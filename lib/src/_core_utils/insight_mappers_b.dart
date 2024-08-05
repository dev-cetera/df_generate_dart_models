//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. See LICENSE file
// in root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_string/df_string.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '/src/_dart_utils/_index.g.dart';

import 'insight_mapper_utils.dart';
import 'strip_special_syntax_from_field_type.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final insightMappersB = [
  _InsightMapper(
    placeholder: PlaceholdersB.STATIC_KEY_NAMES,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final k = 'K_${e.fieldName!.toUpperSnakeCase()}';
          final c = stringCaseType(insight).convert(e.fieldName!);
          return "static const $k = '$c';";
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersB.FIELD_DECLARATIONS_B,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final t = stripSpecialSyntaxFromFieldType(e.fieldType!);
          final f = e.fieldName!.toCamelCase();
          return '$t? $f;';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersB.FROM_JSON_B,
    mapInsights: (insight) async {
      return '${dartFields(insight).map(
        (e) {
          final k = 'K_${e.fieldName!.toUpperSnakeCase()}';
          final f = e.fieldName!.toCamelCase();
          return '..\$$f = otherData?[$k]';
        },
      ).join('\n')};';
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersB.TO_JSON_B,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final k = 'K_${e.fieldName!.toUpperSnakeCase()}';
          final f = e.fieldName!.toCamelCase();
          return '$k: this.\$$f,';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersB.UPDATE_WITH_JSON_B,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final f = e.fieldName!.toCamelCase();
          return 'if (other.$f != null) { this.$f = other.$f!; }';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersB.GETTERS_AND_SETTERS_B,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final f = e.fieldName!.toCamelCase();
          final x = e.fieldTypeCode!;
          final s = stripSpecialSyntaxFromFieldType(x);
          final n = e.nullable;
          final a = DartTypeCodeMapper(DartLooseTypeMappers.instance.toMappers).map(
            fieldName: 'this.$f',
            fieldTypeCode: x,
          );
          final b = DartTypeCodeMapper(DartLooseTypeMappers.instance.fromMappers).map(
            fieldName: 'v',
            fieldTypeCode: x,
          );
          return [
            '  // $f.',
            '$s get ${f}Field => this.$f${n ? '' : '!'};',
            'set ${f}Field($s v) => this.$f = v;',
            '@protected',
            'dynamic get \$$f => $a;',
            '@protected',
            'set \$$f(v) => this.$f = $b;',
            '',
          ].join('\n');
        },
      ).join('\n');
    },
  ),
];

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum PlaceholdersB {
  STATIC_KEY_NAMES,
  FIELD_DECLARATIONS_B,
  FIELD_ASSERTIONS,
  FROM_JSON_B,
  TO_JSON_B,
  UPDATE_WITH_JSON_B,
  GETTERS_AND_SETTERS_B,
}

typedef _InsightMapper = InsightMapper<ClassInsight<GenerateDartModel>, PlaceholdersB>;
