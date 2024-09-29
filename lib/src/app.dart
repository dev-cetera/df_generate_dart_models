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
        defaultsTo: Directory.current.path,
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
        'templates',
        abbr: 't',
        help: 'Template file paths separated by `&`..',
      )
      ..addOption(
        'output',
        abbr: 'o',
        help: 'Output directory path.',
      )
      ..addOption(
        'dart-sdk',
        help: 'Dart SDK path.',
      ),
    onResults: (parser, results) {
      return _ArgsChecker(
        fallbackDartSdkPath: results['dart-sdk'],
        templateFilePaths: results['templates'],
        rootPaths: results['roots'],
        subPaths: results['subs'],
        pathPatterns: results['patterns'],
      );
    },
    action: (parser, results, args) async {
      await generateDartModelsFromAnnotations(
        fallbackDartSdkPath: args.fallbackDartSdkPath,
        rootDirPaths: args.rootPaths!,
        subDirPaths: args.subPaths ?? const {},
        pathPatterns: args.pathPatterns ?? const {},
        templatesRootDirPaths: args.templateFilePaths ?? const {},
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
  final Set<String>? templateFilePaths;
  final Set<String>? rootPaths;
  final Set<String>? subPaths;
  final Set<String>? pathPatterns;

  //
  //
  //

  _ArgsChecker({
    this.fallbackDartSdkPath,
    required dynamic templateFilePaths,
    required dynamic rootPaths,
    required dynamic subPaths,
    required dynamic pathPatterns,
  })  : this.templateFilePaths = splitArg(templateFilePaths)?.toSet(),
        this.rootPaths = splitArg(rootPaths)?.toSet(),
        this.subPaths = splitArg(subPaths)?.toSet(),
        this.pathPatterns = splitArg(pathPatterns)?.toSet();

  //
  //
  //

  @override
  List get args => [
        if (this.fallbackDartSdkPath != null) this.fallbackDartSdkPath,
        //this.templateFilePaths,
        this.rootPaths,
        if (this.subPaths != null) this.subPaths,
        if (this.pathPatterns != null) this.pathPatterns,
      ];
}
