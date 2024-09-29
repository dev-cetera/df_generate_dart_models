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

import '/src/_dart_utils/_index.g.dart';

import 'insight_mapper_utils.dart';
import 'strip_special_syntax_from_field_type.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final insightMappersA = [
  _InsightMapper(
    placeholder: PlaceholdersA.SUPER_CLASS_NAME,
    mapInsights: (insight) async {
      return insight.annotation.shouldInherit == true ? insight.className : 'Model';
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
          final t = e.fieldType!;
          final r = stripSpecialSyntaxFromFieldType(t);
          final f = e.fieldName;
          return 'final $r? $f;';
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
          final t = e.fieldType!;
          final r = stripSpecialSyntaxFromFieldType(t);
          final f = e.fieldName;
          return '$r? $f,';
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
        final fieldPath = field.fieldPath;
        if (fieldPath == null || fieldPath.isEmpty) return '';
        final parts = stringCaseType(insight).convertAll(field.fieldPath!);
        final f = field.fieldName;
        final x = field.fieldTypeCode!;
        final s = stripSpecialSyntaxFromFieldType(x);
        final b = DartTypeCodeMapper(DartLooseTypeMappers.instance.fromMappers).map(
          fieldName: "$a?['${parts.last}']",
          fieldTypeCode: s,
        );
        return 'final $f = $b;';
      }

      final j = fields.map((a) {
        final ff = fields
            .where(
              (b) => a.fieldPath!.join('.').startsWith('${b.fieldPath!.join('.')}.'),
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
          final f = e.fieldName!;
          final f0 = '${f}0';
          final x = e.fieldTypeCode!;
          final s = stripSpecialSyntaxFromFieldType(x);
          final a = DartTypeCodeMapper(DartLooseTypeMappers.instance.toMappers).map(
            fieldName: f,
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

      final type = stringCaseType(insight);

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
            "@pragma('vm:prefer-inline')",
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
  _InsightMapper(
    placeholder: PlaceholdersA.COPY_WITH_PARAMS,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final f = e.fieldName;
          final t = e.fieldType!;
          final r = stripSpecialSyntaxFromFieldType(t);
          return '$r? $f,';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.COPY_WITH_ARGS,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final f = e.fieldName;
          return '$f: $f ?? this.$f,';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.COPY_WITHOUT_PARAMS,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final f = e.fieldName;
          return 'bool $f = true,';
        },
      ).join('\n');
    },
  ),
  _InsightMapper(
    placeholder: PlaceholdersA.COPY_WITHOUT_ARGS,
    mapInsights: (insight) async {
      return dartFields(insight).map(
        (e) {
          final f = e.fieldName;
          return '$f: $f ? this.$f: null,';
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
  COPY_WITH_PARAMS,
  COPY_WITH_ARGS,
  COPY_WITHOUT_PARAMS,
  COPY_WITHOUT_ARGS,
}

typedef _InsightMapper = InsightMapper<ClassInsight<GenerateDartModel>, PlaceholdersA>;
