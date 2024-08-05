//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. See LICENSE file
// in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_string/df_string.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '_dart_field.dart';
import '_dart_type_code_mapper.dart';
import '_insight_mapper_utils.dart';
import '_strip_special_syntax_from_field_type.dart';
import '_dart_loose_type_mappers.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final insightMappersA = [
  _InsightMapper(
    placeholder: PlaceholdersA.SUPER_CLASS_NAME,
    mapInsights: (insight) async {
      return insight.annotation.shouldInherit == true
          ? insight.className
          : 'Model';
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.CLASS_FILE_NAME,
    mapInsights: (insight) async {
      return insight.fileName;
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.CLASS_NAME,
    mapInsights: (insight) async {
      return insight.annotation.className ??
          insight.className.replaceFirst(
            RegExp(r'^[_$]+'),
            '',
          );
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.SUPER_CONSTRUCTOR,
    mapInsights: (insight) async {
      return insight.annotation.shouldInherit == true
          ? insight.annotation.inheritanceConstructor?.nullIfEmpty != null
              ? ': super.${insight.annotation.inheritanceConstructor}()'
              : ''
          : '';
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.FIELD_DECLARATIONS_A,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final t = stripSpecialSyntaxFromFieldType(e.fieldType!);
          final f = e.fieldName;
          return 'final $t? $f;';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.PARAMS_A1,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final n = e.nullable;
          final f = e.fieldName;
          return '${n ? '' : 'required'} this.$f,';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.PARAMS_A2,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final f = e.fieldName;
          return 'this.$f,';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.PARAMS_A3,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final t = stripSpecialSyntaxFromFieldType(e.fieldType!);
          final f = e.fieldName;
          return '$t? $f,';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.FIELD_ASSERTIONS,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final n = e.nullable;
          final f = e.fieldName;
          return n ? '' : 'assert($f != null);';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.ARGS_A,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final f = e.fieldName;
          return '$f: $f,';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.FROM_JSON_A1,
    mapInsights: (insight) async {
      final fields = dartFields(insight).toList();

      String $v(String a, DartField field) {
        final keys = field.fieldPath;
        if (keys == null || keys.isEmpty) return '';
        final f = field.fieldName;
        final x = field.fieldTypeCode!;
        final s = stripSpecialSyntaxFromFieldType(x);
        final b =
            DartTypeCodeMapper(DartLooseTypeMappers.instance.fromMappers).map(
          fieldName: "$a?['${keys.last}']",
          fieldTypeCode: s,
        );
        return 'final $f = $b;';
      }

      final j = fields.map((a) {
        final ff = fields
            .where(
              (b) => a.fieldPath!
                  .join('.')
                  .startsWith('${b.fieldPath!.join('.')}.'),
            )
            .toList();

        ff.sort((a, b) => b.fieldName!.compareTo(a.fieldName!));

        return $v(ff.length > 1 ? '${ff[1].fieldName}' : 'otherData', a);
      });
      return j.join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.FROM_JSON_A2,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final f = e.fieldName;
          return '$f: $f,';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.TO_JSON_A1,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final f = e.fieldName;
          final f0 = '${f}0';
          final x = e.fieldTypeCode!;
          final s = stripSpecialSyntaxFromFieldType(x);
          final a =
              DartTypeCodeMapper(DartLooseTypeMappers.instance.toMappers).map(
            fieldName: 'this.$f',
            fieldTypeCode: s,
          );
          return 'final $f0 = $a;';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.TO_JSON_A2,
    mapInsights: (insight) async {
      final fields = dartFields(insight).toList();
      final parents = fields
          .where(
            (f1) =>
                f1.fieldType == 'Map<String, dynamic>' &&
                fields
                    .map((e) => e.fieldPath!.join('.'))
                    .any((e) => e.startsWith('${f1.fieldPath!.join('.')}.')),
          )
          .toList();
      fields.removeWhere((e) => parents.contains(e));

      final type =
          StringCaseType.values.valueOf(insight.annotation.keyStringCase) ??
              StringCaseType.CAMEL_CASE;

      final entries = fields
          .map(
            (e) => MapEntry(
              type.convertAll(e.fieldPath!).join('.'),
              '${e.fieldName}0',
            ),
          )
          .toList()
        ..sort((a, b) => b.key.compareTo(a.key));

      var buffer = <String, dynamic>{};

      for (final e in entries) {
        traverseMap(
          buffer,
          e.key.split('.').map((e) => "'$e'").toList(),
          newValue: e.value,
        );
      }

      for (final parent in parents) {
        traverseMap(
          buffer,
          [...parent.fieldPath!.map((e) => "'${type.convert(e)}'"), '#'],
          newValue: '...?${parent.fieldName}0,',
        );
      }

      final test = buffer.entries.map((e) => '${e.key}: ${e.value},').join();

      return test.replaceAll('#:', '');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.GETTERS_A,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final f = e.fieldName;
          final x = e.fieldTypeCode!;
          final s = stripSpecialSyntaxFromFieldType(x);
          final n = e.nullable;
          return [
            '  // $f.',
            '$s get ${f}Field => this.$f${n ? '' : '!'};',
            '',
          ].join('\n');
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.FIELD_NAMES,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final f = e.fieldName;
          final c = stringCaseType(insight).convert(e.fieldName!);
          return "static const $f = '$c';";
        },
      ).join('\n');
    },
  ),
];

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum PlaceholdersA {
  SUPER_CLASS_NAME,
  CLASS_NAME,
  SUPER_CONSTRUCTOR,
  CLASS_FILE_NAME,
  FIELD_DECLARATIONS_A,
  PARAMS_A1,
  FIELD_ASSERTIONS,
  ARGS_A,
  PARAMS_A2,
  PARAMS_A3,
  FROM_JSON_A1,
  FROM_JSON_A2,
  TO_JSON_A1,
  TO_JSON_A2,
  GETTERS_A,
  FIELD_NAMES,
}

typedef _InsightMapper
    = InsightMapper<ClassInsight<GenerateDartModel>, PlaceholdersA>;
