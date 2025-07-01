//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by dev-cetera.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore: implementation_imports
import 'package:df_config/src/_etc/replace_data.dart';

import 'package:path/path.dart' as p;
import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import 'extract_insights_from_file.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> generateDartModelsGemeni(List<String> args) async {
  final OUTPUT_FILE_NAME_PATTERN = const OptionParam(
    name: 'output-file-name',
    defaultsTo: '_{class}.g.{lang}',
  );
  final GEMENI_API_KEY = const OptionParam(
    name: 'api-key',
    help: 'Get your Gemeni API key here https://ai.google.dev/gemini-api/docs/api-key.',
  );
  final GEMENI_MODEL = const OptionParam(
    name: 'model',
    defaultsTo: 'gemini-1.5-flash-latest',
    help: 'The Gemeni model to use for generation.',
  );
  final NOTE = const OptionParam(
    name: 'note',
    help: 'A note to pass to Gemeni to offer assistance.',
    defaultsTo: 'Provide a fromJson constructor or method and a toJson method.',
  );
  final LANG = const OptionParam(
    name: 'lang',
    help: 'The programming language to generate the data model for, e.g. "dart" or "ts"',
    defaultsTo: 'ts',
  );
  final parser = CliParser(
    title: 'dev-cetera.com',
    description:
        ' A tool for generating data models for Dart classes annotated with @GenerateDartModel, using Gemeni.',
    example:
        'generate_dart_models_gemeni -i . -o models --lang ts --api-key <GEMENI API KEY> --note "I would like a type/interface and not a class"',
    additional:
        'For contributions, error reports and information, visit: https://github.com/dev-cetera.',
    params: [
      DefaultFlags.HELP.flag,
      DefaultOptionParams.INPUT_PATH.option.copyWith(
        defaultsTo: FileSystemUtility.i.currentDir,
      ),
      DefaultOptionParams.GENERATED_OUTPUT.option.copyWith(
        help: 'The directory to write the generated files to.',
        defaultsTo: 'generated',
      ),
      DefaultOptionParams.DART_SDK.option,
      OUTPUT_FILE_NAME_PATTERN,
      GEMENI_API_KEY,
      GEMENI_MODEL,
      NOTE,
      LANG,
    ],
  );
  final (argResults, argParser) = parser.parse(args);
  final help = argResults.flag(DefaultFlags.HELP.name);
  if (help) {
    Log.printCyan(parser.getInfo(argParser));
    exit(ExitCodes.SUCCESS.code);
  }
  late final String inputPath;
  late final String? dartSdk;
  late final String outputFileNamePattern;
  late final String outputDirPath;
  late final String gemeniApiKey;
  late final String gemeniModel;
  late final String note;
  late final String lang;
  try {
    inputPath = argResults.option(DefaultOptionParams.INPUT_PATH.name)!;
    dartSdk = argResults.option(DefaultOptionParams.DART_SDK.name);
    outputFileNamePattern = argResults.option(OUTPUT_FILE_NAME_PATTERN.name)!;
    outputDirPath = argResults.option(
      DefaultOptionParams.GENERATED_OUTPUT.name,
    )!;
    gemeniApiKey = argResults.option(GEMENI_API_KEY.name)!;
    gemeniModel = argResults.option(GEMENI_MODEL.name)!;
    note = argResults.option(NOTE.name)!;
    lang = _fixLang(argResults.option(LANG.name)!);
  } catch (_) {
    Log.printRed('Missing required args! Use --help flag for more information.');
    exit(ExitCodes.FAILURE.code);
  }
  final analysisContextCollection = createDartAnalysisContextCollection(
    {inputPath},
    dartSdk, //
  );
  final filePathStream0 = PathExplorer(inputPath).exploreFiles();
  final filePathStream1 = filePathStream0.where(
    (e) => _isAllowedFileName(e.path),
  );
  List<FilePathExplorerFinding> findings;
  Log.printWhite('Looking for annotated classes...');
  try {
    findings = await filePathStream1.toList();
  } catch (e) {
    Log.printRed('Failed to read file tree!');
    exit(ExitCodes.FAILURE.code);
  }

  Log.printWhite('Generating your models...');
  try {
    for (final finding in findings) {
      final inputFilePath = finding.path;
      final insights = await extractInsightsFromFile(
        inputFilePath,
        analysisContextCollection,
      );
      for (final insight in insights) {
        await _generateModelWithGemeni(
          insight: insight,
          gemeniApiKey: gemeniApiKey,
          gemeniModel: gemeniModel,
          lang: lang,
          note: note,
          outputFileNamePattern: outputFileNamePattern,
          outputDirPath: outputDirPath,
        );
      }
    }
  } catch (e) {
    Log.printRed('✘ One or more files failed to generate!');
    exit(ExitCodes.FAILURE.code);
  }
  Log.printGreen('Done!');
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

bool _isAllowedFileName(String e) {
  final lc = e.toLowerCase();
  return !lc.endsWith('.g.dart') && lc.endsWith('.dart');
}

Future<void> _generateModelWithGemeni({
  required ClassInsight<GenerateDartModel> insight,
  required String gemeniApiKey,
  required String gemeniModel,
  required String lang,
  required String note,
  required String outputFileNamePattern,
  required String outputDirPath,
}) async {
  final fields = insight.annotation.fields;
  if (fields == null) return;
  final className = insight.className;
  final prompt = StringBuffer();
  prompt.writeAll(
    [
      'Generate a data class called $className for the programming language "$lang" using the given data below, orignally for Dart models.',
      note,
      'Only respond with code.',
      'Assume any undefined/unknown variables/classes exist. Do not redefine them.',
      'Start the file with the comment "GENERATED WITH GEMENI. VERIFY AND MODIFY AS NEEDED BEFORE USING IN CODE."',
      'Do not provide additional comments.',
      'Do not provide examples.',
      '\n\n',
    ],
    ' ', //
  );
  prompt.writeAll(
    fields.map(
      (e) => {
        'field-name': e.fieldPath!.join(''),
        'field-type': e.fieldType,
        'nullable': e.nullable,
      }.toString(),
    ),
    '\n',
  );
  final output = await _generateWithGemeni(
    prompt: prompt.toString(),
    gemeniApiKey: gemeniApiKey,
    gemeniModel: gemeniModel,
  );
  // ignore: invalid_use_of_internal_member
  final fileName = outputFileNamePattern.replaceData({
    '{class}': className.replaceAll('_', '').toSnakeCase(),
    '{lang}': lang,
  });
  var outputFilePath = p.join(outputDirPath, fileName);

  if (p.isRelative(outputFilePath)) {
    outputFilePath = p.join(
      FileSystemUtility.i.currentScriptDir,
      outputFilePath,
    );
  }

  await FileSystemUtility.i.writeLocalFile(outputFilePath, output);
  Log.printWhite('✔ Generated $outputFilePath');
}

String _fixLang(String lang) {
  final l = lang
      .trim()
      .toLowerCase()
      .replaceAll('+', 'p')
      .replaceAll('#', 's')
      .replaceAll(RegExp('[^a-z1]'), '');
  return {
        'c': 'c',
        'cpp': 'cpp',
        'cs': 'cs',
        'dart': 'dart',
        'go': 'go',
        'haskell': 'hs',
        'java': 'java',
        'javascript': 'js',
        'kotlin': 'kt',
        'lua': 'lua',
        'perl': 'pl',
        'php': 'php',
        'powershell': 'ps1',
        'python': 'py',
        'r': 'r',
        'ruby': 'rb',
        'rust': 'rs',
        'scala': 'scala',
        'swift': 'swift',
        'typescript': 'ts',
      }[l] ??
      l;
}

Future<String> _generateWithGemeni({
  required String prompt,
  required String gemeniApiKey,
  required String gemeniModel,
}) async {
  final model = GenerativeModel(model: gemeniModel, apiKey: gemeniApiKey);
  final content = [Content.text(prompt)];
  final response = await model.generateContent(content);
  var text = response.text!.trim();
  if (text.startsWith('```')) {
    final startIndex = text.indexOf('\n') + 1;
    text = text.substring(startIndex);
    if (text.endsWith('```')) {
      text = text.substring(0, text.length - 3).trim();
    }
  }
  return text.trim();
}
