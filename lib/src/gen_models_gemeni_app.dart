//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';
import 'package:path/path.dart' as p;
import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_gen_core/df_gen_core.dart' as df_gen_core;
import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import 'package:google_generative_ai/google_generative_ai.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> genModelsGemeniApp(List<String> args) async {
  final OUTPUT_FILE_NAME_PATTERN = const df_gen_core.Option(
    name: 'output-file-name',
    defaultsTo: '_{class}.g.{lang}',
  );
  final GEMENI_API_KEY = const df_gen_core.Option(
    name: 'api-key',
    help: 'Get your Gemeni API key here https://ai.google.dev/gemini-api/docs/api-key.',
  );
  final GEMENI_MODEL = const df_gen_core.Option(
    name: 'model',
    defaultsTo: 'gemini-1.5-flash-latest',
    help: 'The Gemeni model to use for generation.',
  );
  final NOTE = const df_gen_core.Option(
    name: 'note',
    help: 'A note to pass to Gemeni to offer assistance.',
    defaultsTo: 'Provide a fromJson constructor or method and a toJson method.',
  );
  final LANG = const df_gen_core.Option(
    name: 'lang',
    help: 'The programming language to generate the data model for, e.g. "dart" or "ts"',
    defaultsTo: 'ts',
  );
  final parser = CliParser(
    title: 'DevCetra.com/df/tools',
    description:
        ' A tool for generating data models for Dart classes annotated with @GenerateDartModel, using Gemeni.',
    example:
        'gen-models-gemeni -i . -o models --lang ts --api-key <GEMENI API KEY> --note "I would like a type/interface and not a class"',
    additional:
        'For contributions, error reports and information, visit: https://github.com/DevCetra.',
    params: [
      DefaultFlags.HELP.flag,
      DefaultOptions.INPUT_PATH.option.copyWith(
        defaultsTo: FileSystemUtility.i.currentDir,
      ),
      DefaultOptions.GENERATED_OUTPUT.option.copyWith(
        help: 'The directory to write the generated files to.',
        defaultsTo: 'generated',
      ),
      DefaultOptions.DART_SDK.option,
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
    _print(
      printCyan,
      parser.getInfo(argParser),
    );
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
    inputPath = argResults.option(DefaultOptions.INPUT_PATH.name)!;
    dartSdk = argResults.option(DefaultOptions.DART_SDK.name);
    outputFileNamePattern = argResults.option(OUTPUT_FILE_NAME_PATTERN.name)!;
    outputDirPath = argResults.option(DefaultOptions.GENERATED_OUTPUT.name)!;
    gemeniApiKey = argResults.option(GEMENI_API_KEY.name)!;
    gemeniModel = argResults.option(GEMENI_MODEL.name)!;
    note = argResults.option(NOTE.name)!;
    lang = _fixLang(argResults.option(LANG.name)!);
  } catch (_) {
    _print(
      printRed,
      'Missing required args! Use --help flag for more information.',
    );
    exit(ExitCodes.FAILURE.code);
  }
  final analysisContextCollection = createDartAnalysisContextCollection(
    {inputPath},
    dartSdk,
  );
  final filePathStream0 = PathExplorer(inputPath).exploreFiles();
  final filePathStream1 = filePathStream0.where((e) => _isAllowedFileName(e.path));
  List<FilePathExplorerFinding> findings;

  final spinner = Spinner();
  spinner.start();
  _print(
    printWhite,
    'Looking for annotated classes...',
    spinner,
  );

  try {
    findings = await filePathStream1.toList();
  } catch (e) {
    _print(
      printRed,
      'Failed to read file tree!',
      spinner,
    );
    exit(ExitCodes.FAILURE.code);
  }

  _print(
    printWhite,
    'Generating your models...',
    spinner,
  );
  try {
    for (final finding in findings) {
      final inputFilePath = finding.path;
      final insights = await extractInsightsFromFile(
        analysisContextCollection,
        inputFilePath,
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
    _print(
      printRed,
      '✘ One or more files failed to generate!',
      spinner,
    );
    exit(ExitCodes.FAILURE.code);
  }
  spinner.stop();
  _print(
    printGreen,
    'Done!',
  );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void _print(
  void Function(String) print,
  String message, [
  Spinner? spinner,
]) {
  spinner?.stop();
  print('[gen-models-gemeni] $message');
  spinner?.start();
}

bool _isAllowedFileName(String e) {
  return !e.endsWith('.g.dart') && e.endsWith('.dart');
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
    ' ',
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
  final fileName = outputFileNamePattern.replaceData({
    '{class}': className.replaceAll('_', '').toSnakeCase(),
    '{lang}': lang,
  });
  var outputFilePath = p.join(
    outputDirPath,
    fileName,
  );

  if (p.isRelative(outputFilePath)) {
    outputFilePath = p.join(
      FileSystemUtility.i.currentScriptDir,
      outputFilePath,
    );
  }

  await FileSystemUtility.i.writeLocalFile(outputFilePath, output);
  printWhite(
    '[gen-models-gemeni] ✔ Generated $outputFilePath',
  );
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
  final model = GenerativeModel(
    model: gemeniModel,
    apiKey: gemeniApiKey,
  );
  final content = [
    Content.text(prompt),
  ];
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
