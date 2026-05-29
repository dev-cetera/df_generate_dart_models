//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
//
// The use of this source code is governed by an MIT-style license described in
// the LICENSE file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:path/path.dart' as p;
import 'package:ai_broker/ai_broker.dart';

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import 'extract_insights_from_file.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Broker-agnostic version of [generateDartModelsGemeni]. Pick the provider
/// at the CLI with `--broker openai|anthropic|gemini`. API keys come from
/// `--api-key` or, when absent, from the broker-specific env var via
/// [EnvKeyResolver]. The model id defaults to the first model the broker
/// lists for the resolved key, so common cases work with zero flags.
Future<void> generateDartModelsAi(List<String> args) async {
  Log.enableReleaseAsserts = true;
  final OUTPUT_FILE_NAME_PATTERN = const OptionParam(
    name: 'output-file-name',
    defaultsTo: '_{class}.g.{lang}',
  );
  final BROKER = const OptionParam(
    name: 'broker',
    defaultsTo: 'gemini',
    help: 'AI broker id: openai | anthropic | gemini.',
  );
  final API_KEY = const OptionParam(
    name: 'api-key',
    help:
        'API key. Falls back to OPENAI_API_KEY / ANTHROPIC_API_KEY / GEMINI_API_KEY based on --broker.',
  );
  final MODEL = const OptionParam(
    name: 'model',
    help: 'Model id. Defaults to the broker\'s first listed model.',
  );
  final NOTE = const OptionParam(
    name: 'note',
    help: 'A note to pass to the model to offer assistance.',
    defaultsTo: 'Provide a fromJson constructor or method and a toJson method.',
  );
  final LANG = const OptionParam(
    name: 'lang',
    help:
        'The programming language to generate the data model for, e.g. "dart" or "ts"',
    defaultsTo: 'ts',
  );
  final parser = CliParser(
    title: 'dev-cetera.com',
    description:
        'A tool for generating data models for Dart classes annotated with @GenerateDartModel via any supported AI broker.',
    example:
        'df_generate_dart_models_ai -i . -o models --broker openai --lang ts --note "I would like a type/interface and not a class"',
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
      BROKER,
      API_KEY,
      MODEL,
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
  late final String brokerId;
  late final String? apiKeyArg;
  late final String? modelArg;
  late final String note;
  late final String lang;
  try {
    inputPath = argResults.option(DefaultOptionParams.INPUT_PATH.name)!;
    dartSdk = argResults.option(DefaultOptionParams.DART_SDK.name);
    outputFileNamePattern = argResults.option(OUTPUT_FILE_NAME_PATTERN.name)!;
    outputDirPath = argResults.option(
      DefaultOptionParams.GENERATED_OUTPUT.name,
    )!;
    brokerId = argResults.option(BROKER.name)!;
    apiKeyArg = argResults.option(API_KEY.name);
    modelArg = argResults.option(MODEL.name);
    note = argResults.option(NOTE.name)!;
    lang = _fixLang(argResults.option(LANG.name)!);
  } catch (_) {
    Log.printRed(
      'Missing required args! Use --help flag for more information.',
    );
    exit(ExitCodes.FAILURE.code);
  }

  // Register the built-in brokers on every run. `register()` overwrites by
  // id so this is idempotent, and we intentionally do NOT call `clear()` —
  // doing so would wipe any custom brokers an embedding application has
  // registered against the same process-wide registry.
  final registry = AiBrokerRegistry.instance
    ..register(OpenAiBroker())
    ..register(AnthropicBroker())
    ..register(GeminiBroker());

  final broker = registry.lookup(brokerId);
  if (broker == null) {
    Log.printRed(
      'Unknown broker "$brokerId". Expected one of: openai, anthropic, gemini.',
    );
    exit(ExitCodes.USAGE.code);
  }

  String apiKey;
  try {
    apiKey = apiKeyArg ?? await EnvKeyResolver().require(brokerId);
  } catch (e) {
    Log.printRed('Could not resolve API key for "$brokerId": $e');
    exit(ExitCodes.FAILURE.code);
  }

  String model;
  try {
    if (modelArg != null) {
      model = modelArg;
    } else {
      final available = await broker.listModels(apiKey);
      if (available.isEmpty) {
        Log.printRed(
          'Broker "$brokerId" returned no models. Pass --model explicitly.',
        );
        exit(ExitCodes.FAILURE.code);
      }
      model = available.first;
    }
  } catch (e) {
    Log.printRed('Failed to list models for "$brokerId": $e');
    exit(ExitCodes.FAILURE.code);
  }

  final analysisContextCollection = createDartAnalysisContextCollection(
    {inputPath},
    dartSdk,
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

  Log.printWhite('Generating your models with $brokerId ($model)...');
  try {
    for (final finding in findings) {
      final inputFilePath = finding.path;
      final insights = await extractInsightsFromFile(
        inputFilePath,
        analysisContextCollection,
      );
      for (final insight in insights) {
        await _generateModelWithBroker(
          insight: insight,
          broker: broker,
          apiKey: apiKey,
          model: model,
          lang: lang,
          note: note,
          outputFileNamePattern: outputFileNamePattern,
          outputDirPath: outputDirPath,
        );
      }
    }
  } catch (e) {
    Log.printRed('---> $e');
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

Future<void> _generateModelWithBroker({
  required ClassInsight<GenerateDartModel> insight,
  required AiBroker broker,
  required String apiKey,
  required String model,
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
      'Generate a data class called $className for the programming language "$lang" using the given data below, originally for Dart models.',
      note,
      'Only respond with code.',
      'Assume any undefined/unknown variables/classes exist. Do not redefine them.',
      'Start the file with the comment "GENERATED WITH AI (${broker.label}). VERIFY AND MODIFY AS NEEDED BEFORE USING IN CODE."',
      'Do not provide additional comments.',
      'Do not provide examples.',
      '\n\n',
    ],
    ' ',
  );
  prompt.writeAll(
    fields.map(
      (e) {
        // Field paths are stored as segments (e.g. ['user', 'name']).
        // Joining with '' would collapse them into `username` and lose the
        // structure the AI needs to emit a correct nested type. '.' is the
        // conventional separator and survives round-tripping in prompts.
        // `fields` here is dynamic (the model exposes Set<dynamic>?), so we
        // pull the path through the safe accessor.
        final fieldPath = FieldUtils.fieldPathOrNull(e);
        return {
          'field-name': (fieldPath == null || fieldPath.isEmpty)
              ? '<unknown>'
              : fieldPath.join('.'),
          'field-type': FieldUtils.fieldTypeOrNull(e),
          'nullable': FieldUtils.nullableOrNull(e),
        }.toString();
      },
    ),
    '\n',
  );
  final output = await _generateWithBroker(
    broker: broker,
    apiKey: apiKey,
    model: model,
    prompt: prompt.toString(),
  );
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

Future<String> _generateWithBroker({
  required AiBroker broker,
  required String apiKey,
  required String model,
  required String prompt,
}) async {
  final text = await broker.complete(
    apiKey: apiKey,
    model: model,
    system: '',
    user: prompt,
  );
  return stripCodeFence(text);
}

String _fixLang(String lang) {
  final l = lang
      .trim()
      .toLowerCase()
      .replaceAll('+', 'p')
      .replaceAll('#', 's')
      // Keep ASCII letters AND digits so codes like `ps1`, `py3`, `cpp17`
      // round-trip through normalisation. The previous `[^a-z1]` pattern
      // silently dropped every digit except 1.
      .replaceAll(RegExp('[^a-z0-9]'), '');
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
