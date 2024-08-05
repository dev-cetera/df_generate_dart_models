//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. See LICENSE file
// in root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_log/df_log.dart';
import 'package:df_config/df_config.dart';
import 'package:df_string/df_string.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import 'package:path/path.dart' as p;

import '/src/_dart_utils/_index.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final generatorConverger = _GeneratorConverger(
  (replacements, templates) async {
    for (final template in templates) {
      final templateContent = extractCodeFromMarkdown(template);
      for (final replacement in replacements) {
        // Fill the template with the replacement data.
        final output = replaceData(
          templateContent,
          replacement.replacements,
        );

        // Determine the output file name.
        final outputFileName = [
          replacement.insight.className.toLowerSnakeCase(),
          Lang.DART.genExt,
        ].join();

        // Determine the output file path.
        final outputFilePath = p.join(replacement.insight.dirPath, outputFileName);

        // Write the generated Dart file.
        await writeFile(outputFilePath, output);

        // Fix the generated Dart file.
        await fixDartFile(outputFilePath);

        // Format the generated Dart file.
        await fmtDartFile(outputFilePath);

        // Log a success.
        debugLogSuccess('Generated "${previewPath(outputFilePath)}"');
      }
    }
  },
);

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _GeneratorConverger = GeneratorConverger<ClassInsight<GenerateDartModel>, Enum, String>;
