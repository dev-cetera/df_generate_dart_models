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

import 'dart:io' show Directory;

import 'package:args/args.dart';
import 'package:df_gen_core/df_gen_core.dart';

import 'generate.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A command line app for generating Dart data models from annotations. The
/// [args] are interpreted and passed to [generateDartModelsFromAnnotations].
Future<void> runGenerateDartModelsApp(List<String> args) async {
  await runCommandLineApp(
    title: 'Generate Dart Models',
    description: 'A command line app for generating Dart models from annotations',
    args: args,
    parser: ArgParser()
      ..addFlag(
        'help',
        abbr: 'h',
        negatable: false,
        help: 'Help information.',
      )
      ..addOption(
        'roots',
        abbr: 'r',
        help: 'Root directory paths separated by `&`.',
        defaultsTo: '${Directory.current.path}/',
      )
      ..addOption(
        'subs',
        abbr: 's',
        help: 'Sub-directory paths separated by `&`.',
        defaultsTo: '.',
      )
      ..addOption(
        'patterns',
        abbr: 'p',
        help: 'Path patterns separated by `&`.',
      )
      ..addOption(
        'template',
        abbr: 't',
        help: 'Template file path or URL.',
        defaultsTo:
            'https://raw.githubusercontent.com/robmllze/df_generate_dart_models_core/main/templates/v2.dart.md',
      )
      ..addOption(
        'gemeni_api_key',
        help: 'Obtain your API key here https://ai.google.dev/gemini-api/docs/api-key.',
      )
      ..addOption(
        'gemeni_model',
        help: 'The Gemeni LLM to use.',
        defaultsTo: 'gemini-1.5-flash-latest',
      )
      ..addOption(
        'message_for_ai',
        help: 'Provide a message for the AI to assist with generation.',
      )
      ..addOption(
        'generate_for_languages',
        help: 'Programming languages to generate additional models for using AI, separated by `&`.',
      )
      ..addOption(
        'ai_output',
        help: 'Output dir for AI generated models.',
        defaultsTo: 'ai_generated_models',
      )
      ..addOption(
        'dart-sdk',
        help: 'Dart SDK path.',
      ),
    onResults: (parser, results) {
      return _ArgsChecker(
        fallbackDartSdkPath: results['dart-sdk'] as String?,
        templatePathOrUrl: results['template'] as String?,
        gemeniApiKey: results['gemeni_api_key'] as String?,
        gemeniModel: results['gemeni_model'] as String?,
        messageForAI: results['message_for_ai'] as String?,
        aiOutput: results['ai_output'] as String?,
        rootPaths: results['roots'],
        subPaths: results['subs'],
        pathPatterns: results['patterns'],
        generateForLanguages: results['generate_for_languages'],
      );
    },
    action: (parser, results, args) async {
      await generateDartModelsFromAnnotations(
        fallbackDartSdkPath: args.fallbackDartSdkPath,
        gemeniApiKey: args.gemeniApiKey,
        gemeniModel: args.gemeniModel!,
        messageForAI: args.messageForAI,
        aiOutput: args.aiOutput!,
        rootDirPaths: args.rootPaths!,
        subDirPaths: args.subPaths ?? const {},
        pathPatterns: args.pathPatterns ?? const {},
        templatePathOrUrl: args.templatePathOrUrl!,
        generateForLanguages: args.generateForLanguages ?? const {},
      );
    },
  );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _ArgsChecker extends ValidArgsChecker {
  //
  //
  //

  final String? fallbackDartSdkPath;
  final String? gemeniApiKey;
  final String? gemeniModel;
  final String? messageForAI;
  final String? aiOutput;
  final Set<String>? generateForLanguages;
  final String? templatePathOrUrl;
  final Set<String>? rootPaths;
  final Set<String>? subPaths;
  final Set<String>? pathPatterns;

  //
  //
  //

  _ArgsChecker({
    this.fallbackDartSdkPath,
    this.gemeniApiKey,
    this.gemeniModel,
    this.messageForAI,
    this.aiOutput,
    required this.templatePathOrUrl,
    required dynamic rootPaths,
    required dynamic subPaths,
    required dynamic pathPatterns,
    required dynamic generateForLanguages,
  })  : rootPaths = splitArg(rootPaths)?.toSet(),
        subPaths = splitArg(subPaths)?.toSet(),
        pathPatterns = splitArg(pathPatterns)?.toSet(),
        generateForLanguages = splitArg(generateForLanguages)?.toSet();

  //
  //
  //

  @override
  List<dynamic> get args => [
        if (fallbackDartSdkPath != null) fallbackDartSdkPath,
        templatePathOrUrl,
        if (gemeniApiKey != null) gemeniApiKey,
        gemeniModel,
        if (messageForAI != null) messageForAI,
        aiOutput,
        rootPaths,
        if (subPaths != null) subPaths,
        if (pathPatterns != null) pathPatterns,
        if (generateForLanguages != null) generateForLanguages,
      ];
}
