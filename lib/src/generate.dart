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

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:df_log/df_log.dart';

import '_core_utils/_index.g.dart';

import 'generate_ai_models.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> generateDartModelsFromAnnotations({
  required Set<String> rootDirPaths,
  Set<String> subDirPaths = const {},
  Set<String> pathPatterns = const {},
  required String templateFilePath,
  String? fallbackDartSdkPath,
  String? gemeniApiKey,
  required String gemeniModel,
  String? messageForAI,
  required String aiOutput,
  Set<String> generateForLanguages = const {},
}) async {
  // Notify start.
  printBlue('Starting generator. Please wait...');

  // Explore all source paths.
  final sourceFileExporer = PathExplorer(
    categorizedPathPatterns: const [
      CategorizedPattern(
        category: _Categories.DART,
        pattern: r'.*\.dart$',
      ),
    ],
    dirPathGroups: {
      CombinedPaths(
        rootDirPaths,
        subPaths: subDirPaths,
        pathPatterns: pathPatterns,
      ),
    },
  );
  final sourceFileExplorerResults = await sourceFileExporer.explore();

  final template = templateFilePath.isNotEmpty
      ? extractCodeFromMarkdown(
          await loadFileFromPathOrUrl(templateFilePath),
        ).trim()
      : '';

  // ---------------------------------------------------------------------------

  // Create context for the Dart analyzer.
  final analysisContextCollection = createDartAnalysisContextCollection(
    sourceFileExporer.dirPathGroups.first.paths,
    fallbackDartSdkPath,
  );

  final sequentual = Sequential();

  // For each file...
  for (final filePathResult
      in sourceFileExplorerResults.filePathResults.where((e) => e.category == _Categories.DART)) {
    final filePath = filePathResult.path;

    // Extract insights from the file.
    final classInsights = await extractClassInsightsFromDartFile(
      analysisContextCollection,
      filePath,
    );

    if (classInsights.isEmpty) continue;

    // Converge what was gathered to generate the output if the template is not
    // empty.
    if (template.isNotEmpty) {
      sequentual.add(
        (_) => generatorConverger.converge(
          classInsights,
          [template],
          [
            ...insightMappers,
          ],
        ),
      );
    }

    // Generate AI models if requested.
    if (gemeniApiKey != null &&
        gemeniModel.isNotEmpty &&
        gemeniApiKey.isNotEmpty &&
        generateForLanguages.isNotEmpty) {
      sequentual.add(
        (_) => generateAIModels(
          classInsights: classInsights,
          gemeniApiKey: gemeniApiKey,
          gemeniModel: gemeniModel,
          generateForLanguages: generateForLanguages,
          messageForAI: messageForAI,
          aiOutput: aiOutput,
        ),
      );
    }
  }

  // ---------------------------------------------------------------------------

  await sequentual.last;

  // Notify end.
  printRed('Done!');
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum _Categories {
  DART,
}
