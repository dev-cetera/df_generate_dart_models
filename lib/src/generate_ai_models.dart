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

import 'dart:io';

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:df_log/df_log.dart';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:path/path.dart' as p;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> generateAIModels({
  required List<ClassInsight<GenerateDartModel>> classInsights,
  required String gemeniApiKey,
  required String gemeniModel,
  required Set<String> generateForLanguages,
  required String? messageForAI,
  required String aiOutput,
}) async {
  for (final classInsight in classInsights) {
    final fields = classInsight.annotation.fields;
    if (fields == null) continue;
    final className = classInsight.className;
    for (final langExt in generateForLanguages) {
      final prompt = StringBuffer();
      prompt.writeAll(
        [
          'Generate a data model called $className for the language with extension "$langExt" using the given data below that was orignally for Dart models.',
          'Provide a fromJson constructor or method and a toJson method.',
          'All model classes have a fromJson and toJson.',
          'Only respond with code.',
          'Assume any undefined/unknown variables/classes exist. Do not redefine them.',
          'Start the file with the comment "GENERATED WITH AI. VERIFY AND MODIFY AS NEEDED BEFORE USING IN CODE. REMOVE THIS MESSAGE AFTER VERIFICATION."',
          'Do not provide additional comments.',
          'Do not provide examples.',
          if (messageForAI != null) messageForAI,
          '\n\n',
        ],
        ' ',
      );
      prompt.writeAll(
        fields.map((e) => e.toString()),
        '\n',
      );
      final output = await generateWithGemeni(
        prompt: prompt.toString(),
        gemeniApiKey: gemeniApiKey,
        gemeniModel: gemeniModel,
      );
      final fileName = '${className.toSnakeCase()}.g.$langExt';
      final filePath = p.join(
        Directory.current.path,
        aiOutput,
        fileName,
      );

      await writeFile(filePath, output);

      // Log a success.
      printGreen(
        'Generated additional model using "$gemeniModel" for language "$langExt" at "${previewPath(filePath)}"',
      );
    }
  }
}

Future<String> generateWithGemeni({
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
