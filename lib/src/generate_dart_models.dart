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

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';

import 'dart_composite_type_mappers.dart';
import 'dart_core_type_mappers.dart';
import 'dart_firestore_type_mappers.dart';
import 'dart_postgres_type_mappers.dart';
import 'dart_sqlite_type_mappers.dart';
import 'dart_strict_type_mappers.dart';
import 'extract_insights_from_file.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> generateDartModels(
  List<String> args, {
  required String defaultTemplatePathOrUrl,
}) async {
  Log.enableReleaseAsserts = true;
  final OUTPUT_FILE_NAME_PATTERN = const OptionParam(
    name: 'output-file-name',
    defaultsTo: '_{class}.g.dart',
  );
  final parser = CliParser(
    title: 'dev-cetera.com',
    description:
        'A tool for generating Dart data models for classes annotated with @GenerateDartModel.',
    example: 'generate-dart-models -i .',
    additional:
        'For contributions, error reports and information, visit: https://github.com/dev-cetera.',
    params: [
      DefaultFlags.HELP.flag,
      DefaultOptionParams.INPUT_PATH.option.copyWith(
        defaultsTo: FileSystemUtility.i.currentDir,
      ),
      DefaultOptionParams.TEMPLATE_PATH_OR_URL.option.copyWith(
        defaultsTo: defaultTemplatePathOrUrl,
      ),
      DefaultOptionParams.DART_SDK.option,
      OUTPUT_FILE_NAME_PATTERN,
    ],
  );
  final (argResults, argParser) = parser.parse(args);
  final help = argResults.flag(DefaultFlags.HELP.name);
  if (help) {
    Log.printCyan(parser.getInfo(argParser));
    exit(ExitCodes.SUCCESS.code);
  }
  late final String inputPath;
  late final String templatePathOrUrl;
  late final String? dartSdk;
  late final String outputFileNamePattern;
  try {
    inputPath = argResults.option(DefaultOptionParams.INPUT_PATH.name)!;
    templatePathOrUrl = argResults.option(
      DefaultOptionParams.TEMPLATE_PATH_OR_URL.name,
    )!;
    dartSdk = argResults.option(DefaultOptionParams.DART_SDK.name);
    outputFileNamePattern = argResults.option(OUTPUT_FILE_NAME_PATTERN.name)!;
  } catch (_) {
    Log.printRed(
      'Missing required args! Use --help flag for more information.',
    );

    exit(ExitCodes.FAILURE.code);
  }
  final analysisContextCollection = createDartAnalysisContextCollection(
    {
      inputPath,
    },
    dartSdk, //
  );
  Log.printWhite('Reading template at: $templatePathOrUrl...');
  final result = await MdTemplateUtility.i
      .readTemplateFromPathOrUrl(templatePathOrUrl)
      .value;
  if (result.isErr()) {
    Log.printRed(' Failed to read template!');
    exit(ExitCodes.FAILURE.code);
  }
  final template = result.unwrap();
  Log.printWhite('Looking for Dart files...');
  final filePathStream0 = PathExplorer(inputPath).exploreFiles();
  final filePathStream1 = filePathStream0.where(
    (e) => _isAllowedFileName(e.path),
  );
  List<FilePathExplorerFinding> findings;
  try {
    findings = await filePathStream1.toList();
  } catch (e) {
    Log.printRed('Failed to read file tree!');
    exit(ExitCodes.FAILURE.code);
  }

  Log.printWhite('Generating your models...');
  try {
    for (final finding in findings) {
      final inputFilePath = finding.path;
      final insights = await extractInsightsFromFile(
        inputFilePath,
        analysisContextCollection,
      );

      for (final insight in insights) {
        final output = _interpolator.interpolate(template, insight);
        final fileName = outputFileNamePattern.replaceData({
          '{file}': PathUtility.i.localBaseNameWithoutExtension(inputFilePath),
          '{class}': () {
            var temp = (insight.annotation.className ?? insight.className);
            temp = temp.startsWith('_') ? temp.substring(1) : temp;
            return temp.toSnakeCase();
          }(),
        });
        final outputFilePath = p.join(
          PathUtility.i.localDirName(inputFilePath),
          fileName,
        );
        await FileSystemUtility.i.writeLocalFile(outputFilePath, output);
        Log.printWhite('✔ Generated $fileName');
      }
    }
  } catch (e) {
    Log.printRed('---> $e');
    Log.printRed('✘ One or more files failed to generate!');
    exit(ExitCodes.FAILURE.code);
  }
  Log.printWhite('Fixing generated files..');
  await fixDartFile(inputPath);
  Log.printWhite('Formatting generated files..');
  await fmtDartFile(inputPath);
  Log.printGreen('Done!');
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

bool _isAllowedFileName(String e) {
  final lc = e.toLowerCase();
  return !lc.endsWith('.g.dart') && lc.endsWith('.dart');
}

/// Mapper table used by the codegen interpolators. Composes the
/// dialect-agnostic [DartCoreTypeMappers] with [DartFirestoreTypeMappers]
/// so models that mention `Timestamp` continue to work without any
/// per-call wiring. Future dialect tables (Postgres, SQLite, STRICT_) will
/// slot in here alongside the existing two.
///
/// Order matters: specific-vocabulary dialects come BEFORE the generic
/// [DartCoreTypeMappers] because mapper lookup is first-match-wins and Core's
/// catchall regex `^(\w+)\??$` would otherwise swallow any specific type
/// name a dialect tries to claim. Insert future dialects at the start of
/// the list, never at the end.
/// Pattern used to recognise enum-flavoured field type codes so the
/// `unknownEnumValue` slot can append a `?? <enumLiteral>` after the
/// generated `XxxType.values.valueOf(...)`. Mirrors the regex the mappers
/// themselves use (`Type-?\w+|\w+-?Type|Enum-?\w+|\w+-?Enum`) but
/// pre-strips any prefix (PG_, STRICT-, LowerCase-, etc.) so a prefixed
/// enum type code like `PG_enum(kind)-AuthProviderType` still matches.
final _enumTypeCodePattern = RegExp(
  r'^(?:[A-Za-z][\w]*(?:\([^)]*\))?(?:\[\])?-)?'
  r'(Type-?\w+|\w+-?Type|Enum-?\w+|\w+-?Enum)\??$',
);

bool _looksLikeEnumType(DartField field) {
  final code = field.fieldTypeCode;
  if (code == null) return false;
  return _enumTypeCodePattern.hasMatch(code);
}

/// Renders the `fallback:` annotation value as a Dart literal expression
/// suitable for the right-hand side of `??`. Strings get quoted; bool/num
/// pass through; anything else gets stringified — users with exotic
/// fallback shapes (Map literals, Symbol constants) should use a custom
/// converter instead.
String _renderFallbackLiteral(Object value) {
  if (value is String) {
    final escaped = value
        .replaceAll(r'\', r'\\')
        .replaceAll("'", r"\'")
        .replaceAll('\n', r'\n');
    return "'$escaped'";
  }
  if (value is bool || value is num) return value.toString();
  return value.toString();
}

final _defaultMappers = DartCompositeTypeMappers([
  DartStrictTypeMappers.instance,
  DartPostgresTypeMappers.instance,
  DartSqliteTypeMappers.instance,
  DartFirestoreTypeMappers.instance,
  DartCoreTypeMappers.instance,
]);

final _interpolator = TemplateInterpolator<ClassInsight<GenerateDartModel>>({
  '___DESCRIPTION___': (insight) {
    return insight.annotation.description ??
        'Generated class for [${insight.className}].';
  },
  '___SUPER_CLASS_NAME___': (insight) {
    return insight.annotation.shouldInherit == true
        ? insight.className
        : 'Model';
  },
  '___CLASS_FILE_NAME___': (insight) {
    return insight.fileName;
  },
  '___CLASS_NAME___': (insight) {
    return insight.annotation.className ??
        insight.className.replaceFirst(RegExp(r'^[_$]+'), '');
  },
  '___WITH_EQUATABLE___': (insight) {
    // EquatableMixin is opt-out via `equatable: false` on the annotation. Used
    // by classes whose instances get embedded in const Sets inside other
    // annotations (Dart forbids const set elements from overriding ==).
    // Default behaviour (null/true) emits the mixin and a `props` override.
    final equatable = insight.annotation.equatable ?? true;
    return equatable ? 'with EquatableMixin ' : '';
  },
  '___EQUATABLE_OVERRIDES___': (insight) {
    final equatable = insight.annotation.equatable ?? true;
    if (!equatable) return '';
    final propsList = insight.fields.map((e) => e.fieldName).join(', ');
    return '''
  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [$propsList];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();''';
  },
  '___SUPER_CONSTRUCTOR___': (insight) {
    return insight.annotation.shouldInherit == true
        ? insight.annotation.inheritanceConstructor?.nullIfEmpty != null
            ? ': super.${insight.annotation.inheritanceConstructor}()'
            : ''
        : '';
  },
  '___FIELD_DECLARATIONS___': (insight) {
    return insight.fields.map((e) {
      final description = e.description;
      final t = e.fieldType!;
      final r = stripSpecialSyntaxFromFieldType(t);
      final f = e.fieldName;
      return [
        '  /// ${description ?? 'No description provided.'}',
        'final $r? $f;',
        '',
      ].join('\n');
    }).join('\n');
  },
  '___PARAMS___': (insight) {
    return insight.fields.map((e) {
      final n = e.nullable;
      final f = e.fieldName;
      return '${n ? '' : 'required'} this.$f,';
    }).join('\n');
  },
  '___PERMISSIVE_PARAMS___': (insight) {
    return insight.fields.map((e) {
      final f = e.fieldName;
      return 'this.$f,';
    }).join('\n');
  },
  '___STRICT_PARAMS___': (insight) {
    return insight.fields.map((e) {
      final t = e.fieldType!;
      final r = stripSpecialSyntaxFromFieldType(t);
      final f = e.fieldName;
      return '$r? $f,';
    }).join('\n');
  },
  '___STRICT_PARAM_ASSERTIONS___': (insight) {
    return insight.fields.map((e) {
      final n = e.nullable;
      final f = e.fieldName;
      return n ? '' : 'assert($f != null);';
    }).join('\n');
  },
  '___STRICT_ARGS___': (insight) {
    return insight.fields.map((e) {
      final f = e.fieldName;
      return '$f: $f,';
    }).join('\n');
  },
  '___FROM_JSON_OR_NULL_PARAMS___': (insight) {
    final fields = insight.fields.toList();
    String $v(String a, DartField field) {
      final fieldPath = field.fieldPath;
      if (fieldPath == null || fieldPath.isEmpty) return '';
      final parts = insight.stringCaseType.convertAll(field.fieldPath!);
      final f = field.fieldName;
      final rawKey = "$a?['${parts.last}']";

      // converter: bypass dialect/prefix mappers entirely and emit
      // `const ConverterClass().fromJson(value)`. Mirrors json_serializable's
      // JsonConverter escape hatch for custom types.
      var code = field.converter != null
          ? 'const ${field.converter}().fromJson($rawKey)'
          : DartTypeCodeMapper(_defaultMappers.fromMappers).map(
              fieldName: rawKey,
              // Pass the unstripped type code so prefix-bearing types
              // (LowerCase-String, PG_jsonb-Map, STRICT-int, PG_text-String,
              // etc.) match their specific regexes. The strip is only used to
              // render valid Dart for the field declaration, not the mapper.
              fieldTypeCode: field.fieldTypeCode!,
            );

      // unknownEnumValue: append `?? <Enum.value>` after the mapper output
      // when the field type code is enum-flavoured. The mapper itself emits
      // `XxxType.values.valueOf(...)` which returns null on unknown names —
      // this wraps it with the user-chosen fallback.
      if (field.unknownEnumValue != null && _looksLikeEnumType(field)) {
        code = '$code ?? ${field.unknownEnumValue}';
      }

      // fallback: applied last so it covers null from either the mapper or
      // the unknownEnumValue chain. Renders the literal per the Dart-side
      // type — Strings get quoted, primitives pass through, anything else
      // is `.toString()`'d.
      if (field.fallback != null) {
        code = '$code ?? ${_renderFallbackLiteral(field.fallback!)}';
      }

      return 'final $f = $code;';
    }

    final j = fields.map((a) {
      // Defensive: fields with a null fieldPath can't have a parent path
      // computed, so skip the relationship lookup for them rather than
      // throwing on `!`.
      final aPath = a.fieldPath;
      if (aPath == null) return $v('json', a);
      final aJoined = aPath.join('.');
      final ff = fields.where((b) {
        final bPath = b.fieldPath;
        if (bPath == null) return false;
        return aJoined.startsWith('${bPath.join('.')}.');
      }).toList();
      // Sort by fieldName desc, tolerating null fieldNames (treat them as
      // empty so the comparator is total and never throws).
      ff.sort((x, y) => (y.fieldName ?? '').compareTo(x.fieldName ?? ''));
      return $v(ff.length > 1 ? (ff[1].fieldName ?? '') : 'json', a);
    });
    return j.join('\n');
  },
  '___FROM_JSON_OR_NULL_ARGS___': (insight) {
    return insight.fields.map((e) {
      final f = e.fieldName;
      return '$f: $f,';
    }).join('\n');
  },
  '___TO_JSON_PARAMS___': (insight) {
    return insight.fields.map((e) {
      final f = e.fieldName!;
      final f0 = '${f}0';
      // converter: emit `const ConverterClass().toJson(field)` and skip the
      // dialect mapper. Mirrors the from-side handling above.
      if (e.converter != null) {
        return 'final $f0 = const ${e.converter}().toJson($f);';
      }
      // Unstripped on the to-side too so the inverse of every prefix mapper
      // can fire (LowerCase→toLowerCase, PG_jsonb→jsonEncode, etc.).
      final x = e.fieldTypeCode!;
      final a = DartTypeCodeMapper(
        _defaultMappers.toMappers,
      ).map(fieldName: f, fieldTypeCode: x);
      return 'final $f0 = $a;';
    }).join('\n');
  },
  '___TO_JSON_ARGS___': (insight) {
    final fields = insight.fields.toList();
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
    final stringCaseType = insight.stringCaseType;
    final entries = fields
        .map(
          (e) => MapEntry(
            stringCaseType.convertAll(e.fieldPath!).join('.'),
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
        [
          ...parent.fieldPath!.map(
            (e) => "'${insight.stringCaseType.convert(e)}'",
          ),
          '#',
        ],
        newValue: '...?${parent.fieldName}0,', //
      );
    }
    final test = buffer.entries.map((e) => '${e.key}: ${e.value},').join();
    return test.replaceAll('#:', '');
  },
  '___GETTERS___': (insight) {
    return insight.fields.map((e) {
      final f = e.fieldName;
      final x = e.fieldTypeCode!;
      final s = stripSpecialSyntaxFromFieldType(x);
      final n = e.nullable;
      return [
        '  /// Returns the value of the [$f] field.',
        '  /// If the field is nullable, the return value may be null; otherwise, it',
        '  /// will always return a non-null value.',
        "@pragma('vm:prefer-inline')",
        '$s get $f\$ => $f${n ? '' : '!'};',
        '',
      ].join('\n');
    }).join('\n');
  },
  '___FIELD_NAMES___': (insight) {
    return insight.fields.map((e) {
      final className = insight.annotation.className ??
          insight.className.replaceFirst(RegExp(r'^[_$]+'), '');
      final f = e.fieldName;
      final c = insight.stringCaseType.convert(e.fieldName!);
      return [
        '  /// The field name of [$className.$f].',
        "static const $f = '$c';",
        '',
      ].join('\n');
    }).join('\n');
  },
  '___COPY_WITH_PARAMS___': (insight) {
    return insight.fields.map((e) {
      final f = e.fieldName;
      final t = e.fieldType!;
      final r = stripSpecialSyntaxFromFieldType(t);
      return '$r? $f,';
    }).join('\n');
  },
  '___COPY_WITH_ARGS___': (insight) {
    return insight.fields.map((e) {
      final f = e.fieldName;
      return '$f: $f ?? this.$f,';
    }).join('\n');
  },
  '___COPY_WITHOUT_PARAMS___': (insight) {
    return insight.fields.map((e) {
      final f = e.fieldName;
      return 'bool $f = true,';
    }).join('\n');
  },
  '___COPY_WITHOUT_ARGS___': (insight) {
    return insight.fields.map((e) {
      final f = e.fieldName;
      return '$f: $f ? this.$f: null,';
    }).join('\n');
  },
});

extension _ClassInsightExtension on ClassInsight<GenerateDartModel> {
  Iterable<DartField> get fields {
    return annotation.fields?.whereType<TFieldRecord>().map((e) {
          e.runtimeType;
          return DartField.fromRecord(e);
        }).nonNulls ??
        {};
  }

  StringCaseType get stringCaseType {
    return StringCaseType.values.valueOf(annotation.keyStringCase) ??
        StringCaseType.CAMEL_CASE;
  }
}
