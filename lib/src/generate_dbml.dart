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

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';

import 'extract_insights_from_file.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Walks every Dart file under [inputPath], extracts each
/// `@GenerateDartModel` annotation, and writes one DBML file describing the
/// schema as a single `Table` per model plus trailing `Ref:` lines for the
/// foreign keys captured in `references:`.
///
/// Output is dialect-agnostic DBML — emit dialect-specific SQL downstream
/// with `dbml2sql --postgres` or `dbml2sql --sqlite`.
Future<void> generateDbml(
  List<String> args, {
  String defaultOutputPath = 'schema.dbml',
}) async {
  Log.enableReleaseAsserts = true;

  const OUTPUT_PATH = OptionParam(
    name: 'output',
    defaultsTo: 'schema.dbml',
  );

  final parser = CliParser(
    title: 'dev-cetera.com',
    description: 'Generates a DBML schema file from classes annotated with '
        '@GenerateDartModel. The PG_*-/SQLITE_*- prefixes on fieldType drive '
        'column types, `references:` drives FK Ref lines, and `primaryKey:` '
        'drives the `[pk]` constraint.',
    example: 'generate-dbml -i lib/src/db_models -o schema.dbml',
    additional: 'For contributions, error reports and information, visit: '
        'https://github.com/dev-cetera.',
    params: [
      DefaultFlags.HELP.flag,
      DefaultOptionParams.INPUT_PATH.option.copyWith(
        defaultsTo: FileSystemUtility.i.currentDir,
      ),
      DefaultOptionParams.DART_SDK.option,
      OUTPUT_PATH,
    ],
  );

  final (argResults, argParser) = parser.parse(args);

  if (argResults.flag(DefaultFlags.HELP.name)) {
    Log.printCyan(parser.getInfo(argParser));
    exit(ExitCodes.SUCCESS.code);
  }

  late final String inputPath;
  late final String? dartSdk;
  late final String outputPath;
  try {
    inputPath = argResults.option(DefaultOptionParams.INPUT_PATH.name)!;
    dartSdk = argResults.option(DefaultOptionParams.DART_SDK.name);
    outputPath = argResults.option(OUTPUT_PATH.name) ?? defaultOutputPath;
  } catch (_) {
    Log.printRed(
      'Missing required args! Use --help flag for more information.',
    );
    exit(ExitCodes.FAILURE.code);
  }

  final analysisContextCollection = createDartAnalysisContextCollection(
    {inputPath},
    dartSdk,
  );

  Log.printWhite('Looking for Dart files in $inputPath...');
  final stream = PathExplorer(inputPath).exploreFiles().where(
        (e) => _isAllowedFileName(e.path),
      );

  final allInsights = <ClassInsight<GenerateDartModel>>[];
  final scannedFiles = <String>[];
  try {
    await for (final finding in stream) {
      scannedFiles.add(finding.path);
      final insights = await extractInsightsFromFile(
        finding.path,
        analysisContextCollection,
      );
      allInsights.addAll(insights);
    }
  } catch (e) {
    Log.printRed('Failed while reading: $e');
    exit(ExitCodes.FAILURE.code);
  }

  // Resolve every Dart enum reachable from the scanned files so we can
  // emit real `Enum "<name>" { ... }` blocks plus `enum(<name>)` column
  // types in the DBML — instead of letting enum-typed columns silently
  // fall through to `text`.
  final reachableEnums = await resolveReachableEnums(
    scannedFiles,
    analysisContextCollection,
  );

  // Only models that declare `schema:` get DBML output — that's the gate.
  // Nested / embedded models (e.g. jsonb-only child shapes) don't carry a
  // schema and are naturally excluded; they aren't tables.
  final schemaInsights = allInsights
      .where(
        (i) => (i.annotation.schema ?? '').isNotEmpty,
      )
      .toList();
  final skipped = allInsights.length - schemaInsights.length;
  Log.printWhite(
    'Found ${allInsights.length} model(s); $skipped without `schema:` (skipped); '
    'emitting ${schemaInsights.length} table(s)...',
  );

  if (schemaInsights.isEmpty) {
    Log.printYellow(
      'No models with `schema:` set — nothing to emit. Add `schema: ...` to '
      'the @GenerateDartModel annotations you want to include.',
    );
    return;
  }

  // Build cross-cutting maps from the schema-bound insights only, so refs
  // never resolve to non-table models.
  //
  //  - `pkByTable`: lets a ref target a parent table's actual primary key
  //    column rather than blindly emitting `.id` (e.g. `permissions.key`).
  //  - `tableByClass`: lets a ref honour a target model's explicit
  //    `tableName:`. Without this, `references: 'ModelUser'` would always
  //    resolve to `user` even if the target declared `tableName: 'users'`.
  final pkByTable = <String, String>{};
  final tableByClass = <String, String>{};
  for (final insight in schemaInsights) {
    final table = _tableNameFor(insight);
    tableByClass[_publicClassName(insight)] = table;
    final pkField =
        insight.fields.where((f) => f.primaryKey == true).firstOrNull;
    if (pkField != null) {
      pkByTable[table] = _columnNameFor(insight, pkField);
    }
  }

  // Group tables by schema so we emit one DBML file per distinct schema.
  final bySchema = <String, List<ClassInsight<GenerateDartModel>>>{};
  for (final insight in schemaInsights) {
    final schema = insight.annotation.schema!;
    (bySchema[schema] ??= []).add(insight);
  }

  // Treat `outputPath` as the *directory* for per-schema files. If the user
  // supplied something that looks like a file (ends in `.dbml`), use its
  // parent dir — this preserves the `--output schema.dbml` ergonomics from
  // the previous single-file mode while making multi-schema output natural.
  final outputDir =
      outputPath.endsWith('.dbml') ? _parentDir(outputPath) : outputPath;
  final sourceLabel = PathUtility.i.localBaseName(inputPath);

  for (final entry in bySchema.entries) {
    final schema = entry.key;
    final insights = entry.value;
    final buffer = StringBuffer();
    buffer.writeln('// Generated by df_generate_dart_models.');
    buffer.writeln('// Source: $sourceLabel');
    buffer.writeln('// Schema: $schema');
    buffer.writeln();

    // Discover every Dart enum referenced (by `@enum` tag or by the explicit
    // `PG_enum(<name>)-XxxEnum` prefix) on any field in this schema and emit
    // a DBML `Enum "<name>" { ... }` block. The block names use the
    // snake_cased Dart name when the PG prefix didn't supply an explicit
    // name, so the column type `enum(user_role_type)` resolves cleanly.
    final usedEnums = _collectUsedEnums(insights, reachableEnums);
    for (final e in usedEnums) {
      _emitEnumBlock(e, buffer);
      buffer.writeln();
    }

    final refLines = <String>[];
    for (final insight in insights) {
      _emitTable(insight, buffer, refLines, pkByTable, tableByClass, usedEnums);
      buffer.writeln();
    }
    for (final line in refLines) {
      buffer.writeln(line);
    }

    final filePath =
        outputDir.isEmpty ? '$schema.dbml' : '$outputDir/$schema.dbml';
    await FileSystemUtility.i.writeLocalFile(filePath, buffer.toString());
    Log.printGreen(
      '✔ Wrote ${insights.length} table(s) for schema `$schema` to $filePath',
    );
  }
}

/// Returns the parent directory of [path] without a trailing separator.
/// Empty string if [path] has no separator (i.e. it's a bare filename in
/// the current working directory).
String _parentDir(String path) {
  final lastSep = path.lastIndexOf(RegExp(r'[/\\]'));
  return lastSep < 0 ? '' : path.substring(0, lastSep);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void _emitTable(
  ClassInsight<GenerateDartModel> insight,
  StringBuffer buffer,
  List<String> refLines,
  Map<String, String> pkByTable,
  Map<String, String> tableByClass,
  List<_EnumInfo> enums,
) {
  final tableName = _tableNameFor(insight);
  final enumDbmlByDart = {for (final e in enums) e.dartName: e.dbmlName};

  buffer.writeln('Table $tableName {');

  for (final field in insight.fields) {
    final columnName = _columnNameFor(insight, field);
    final sqlType = _sqlTypeFor(field, enumDbmlByDart);
    final notes = <String>[];

    if (field.primaryKey == true) notes.add('pk');
    if (field.nullable != true && field.primaryKey != true) {
      notes.add('not null');
    }

    final references = _referenceTableFor(field, tableByClass);
    if (references != null) {
      // Target the parent table's actual primary key column, falling back to
      // `id` for models that don't declare `primaryKey: true` (the historic
      // convention).
      final targetColumn = pkByTable[references] ?? 'id';
      notes.add('ref: > $references.$targetColumn');
    }

    final description = field.description;
    if (description != null && description.isNotEmpty) {
      notes.add("note: '${_escapeDbmlString(description)}'");
    }

    final noteSegment = notes.isEmpty ? '' : ' [${notes.join(', ')}]';
    buffer.writeln('  $columnName $sqlType$noteSegment');
  }

  buffer.writeln('}');
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

String _tableNameFor(ClassInsight<GenerateDartModel> insight) {
  // Explicit `tableName:` on the annotation is always the source of truth —
  // no further transform, no pluralisation, no surprises.
  final explicit = insight.annotation.tableName;
  if (explicit != null && explicit.isNotEmpty) return explicit;
  final raw = insight.annotation.className ??
      insight.className.replaceFirst(RegExp(r'^[_$]+'), '');
  return _stripModelMarker(raw).toSnakeCase();
}

/// Strip the `Model` marker from a class name, supporting both conventions:
///
///  - Leading: `ModelUser` → `User`, `ModelModel` → `Model` (still produces
///    a non-empty table name).
///  - Trailing: `HelloModel` → `Hello`.
///  - Bare `Model` (no other word): leave alone, lowers to `model`.
///
/// Only ONE marker is stripped per call so that `ModelModel` resolves to the
/// expected `model` rather than collapsing to an empty string.
String _stripModelMarker(String name) {
  if (name == 'Model') return name;
  if (name.startsWith('Model') && name.length > 5) return name.substring(5);
  if (name.endsWith('Model') && name.length > 5) {
    return name.substring(0, name.length - 5);
  }
  return name;
}

String _columnNameFor(
  ClassInsight<GenerateDartModel> insight,
  DartField field,
) {
  final path = field.fieldPath;
  if (path == null || path.isEmpty) return field.fieldName ?? 'unknown';
  return insight.stringCaseType.convertAll(path).join('_');
}

/// Derives the DBML column type from the `PG_*-`/`SQLITE_*-` prefix in
/// `fieldType`, falling back to a sensible default per the bare Dart
/// type when no dialect prefix is set.
String _sqlTypeFor(DartField field, Map<String, String> enumDbmlByDart) {
  final raw = field.fieldType ?? 'dynamic';
  final dialectMatch = RegExp(
    r'^(?:PG|SQLITE)_(\w+(?:\([^)]*\))?(?:\[\])?)-',
  ).firstMatch(raw);
  if (dialectMatch != null) return dialectMatch.group(1)!;

  // Enum detection runs BEFORE the bare-name fallback so analyzer-tagged
  // enums (`UserRoleType@enum`) and bare enum Type literals
  // (`UserRoleType` when reachable enums confirm it) both round-trip as
  // proper `enum(<dbml_name>)` columns instead of falling through to `text`.
  final cleaned = raw.replaceAll('?', '');
  if (cleaned.endsWith('@enum')) {
    final dartName = cleaned.substring(0, cleaned.length - '@enum'.length);
    final dbmlName = enumDbmlByDart[dartName] ?? _dbmlEnumNameFor(dartName);
    return 'enum($dbmlName)';
  }
  if (enumDbmlByDart.containsKey(cleaned)) {
    return 'enum(${enumDbmlByDart[cleaned]})';
  }

  // Defaults for bare Dart types. `@enum` sentinel is now handled above —
  // strip it defensively in case any other code path leaves it on the
  // raw string.
  final bare = cleaned.replaceAll('@enum', '');
  switch (bare) {
    case 'String':
      return 'text';
    case 'int':
      return 'bigint';
    case 'double':
      return 'double precision';
    case 'num':
      return 'numeric';
    case 'bool':
      return 'boolean';
    case 'DateTime':
      return 'timestamptz';
    case 'Uint8List':
      return 'bytea';
    case 'Uri':
      return 'text';
    case 'BigInt':
      return 'numeric';
    case 'Duration':
      return 'bigint';
  }
  // Map / List / Set / nested Models → jsonb by default.
  if (bare.startsWith('Map') ||
      bare.startsWith('List') ||
      bare.startsWith('Set') ||
      bare.startsWith('Iterable') ||
      RegExp(r'^(Model-?\w+|\w+-?Model)$').hasMatch(bare)) {
    return 'jsonb';
  }
  return 'text';
}

/// Resolves a `references:` value (Type or String literal) to the target
/// table name. First consults [tableByClass] — the up-front map of every
/// scanned model's class-name → table-name — so an explicit `tableName:`
/// on the target wins. Falls back to stripping the `Model` marker and
/// snake-casing.
String? _referenceTableFor(
  DartField field,
  Map<String, String> tableByClass,
) {
  final ref = field.references;
  if (ref == null) return null;
  final raw = ref.toString();
  if (raw.isEmpty || raw == 'Object' || raw == 'dynamic') return null;
  // Drop the `_` that abstract carrier classes carry so `_ModelUser` and
  // `ModelUser` resolve to the same entry in the map.
  final public = raw.replaceFirst(RegExp(r'^_+'), '');
  return tableByClass[public] ?? _stripModelMarker(raw).toSnakeCase();
}

/// The public class name for [insight] — the form that consumers reference
/// via `references:`. Mirrors `___CLASS_NAME___` in the model template.
String _publicClassName(ClassInsight<GenerateDartModel> insight) {
  return insight.annotation.className ??
      insight.className.replaceFirst(RegExp(r'^[_$]+'), '');
}

String _escapeDbmlString(String s) =>
    s.replaceAll(r'\', r'\\').replaceAll("'", r"\'").replaceAll('\n', ' ');

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

bool _isAllowedFileName(String e) {
  final lc = e.toLowerCase();
  return !lc.endsWith('.g.dart') && lc.endsWith('.dart');
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension _ClassInsightExtension on ClassInsight<GenerateDartModel> {
  Iterable<DartField> get fields {
    return annotation.fields?.whereType<TFieldRecord>().map((e) {
          return DartField.fromRecord(e);
        }).nonNulls ??
        const [];
  }

  StringCaseType get stringCaseType {
    return StringCaseType.values.valueOf(annotation.keyStringCase) ??
        StringCaseType.CAMEL_CASE;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// One DBML enum we plan to emit at the top of the schema. Carries both the
/// snake-cased DBML identifier (`user_role_type`) used in column types and
/// the original Dart name (`UserRoleType`) used to look up variants in
/// [resolveReachableEnums]'s result.
class _EnumInfo {
  _EnumInfo({
    required this.dbmlName,
    required this.dartName,
    required this.variants,
  });
  final String dbmlName;
  final String dartName;
  final List<String> variants;
}

/// Walks every field across the schema's models, finds every distinct enum
/// referenced (either via the `@enum` sentinel that the extractor adds to
/// analyzer-detected enum Type literals, or via the explicit
/// `PG_enum(<name>)-XxxEnum` prefix vocabulary), and looks each one up in
/// [reachable] for its variants. Variants missing from [reachable] still
/// produce an entry — the block just gets an empty body for the user to
/// fill in.
List<_EnumInfo> _collectUsedEnums(
  Iterable<ClassInsight<GenerateDartModel>> insights,
  Map<String, List<String>> reachable,
) {
  // dbmlName → _EnumInfo. We key on dbmlName so the explicit PG name (which
  // may differ from the snake_cased Dart name) wins when both forms appear.
  final out = <String, _EnumInfo>{};

  void register(String dartName, String dbmlName) {
    if (out.containsKey(dbmlName)) return;
    final variants = reachable[dartName] ?? const <String>[];
    out[dbmlName] = _EnumInfo(
      dbmlName: dbmlName,
      dartName: dartName,
      variants: variants,
    );
  }

  for (final insight in insights) {
    for (final field in insight.fields) {
      final raw = (field.fieldType ?? '').replaceAll('?', '');
      if (raw.isEmpty) continue;

      // 1) `PG_enum(<dbml_name>)-<DartTypeName>` — explicit DBML name set
      //    via the prefix vocabulary; wins over any inference.
      final pgEnumMatch = RegExp(
        r'^PG_enum\(([^)]+)\)-(\w+)$',
      ).firstMatch(raw);
      if (pgEnumMatch != null) {
        register(pgEnumMatch.group(2)!, pgEnumMatch.group(1)!);
        continue;
      }

      // 2) Analyzer sentinel: `UserRoleType@enum`.
      if (raw.endsWith('@enum')) {
        final dartName = raw.substring(0, raw.length - '@enum'.length);
        register(dartName, _dbmlEnumNameFor(dartName));
        continue;
      }

      // 3) Bare Dart Type name that resolves to a real enum in the
      //    analyzer-reachable set. Catches the case where the user wrote
      //    `fieldType: UserRoleType` and the extractor's `@enum`-tagging
      //    path didn't fire (legacy String-form annotation slots).
      if (reachable.containsKey(raw)) {
        register(raw, _dbmlEnumNameFor(raw));
      }
    }
  }
  // Stable order so successive runs produce a clean diff.
  final list = out.values.toList()
    ..sort((a, b) => a.dbmlName.compareTo(b.dbmlName));
  return list;
}

/// snake-cases a Dart enum class name into the DBML enum identifier and
/// strips a trailing `_enum` suffix so a reverse-then-forward round-trip
/// (where the reverse generator appends `Enum` to the Dart class name) lands
/// on the original DBML name instead of drifting to `<name>_enum`.
String _dbmlEnumNameFor(String dartName) {
  final snake = dartName.toSnakeCase();
  if (snake.endsWith('_enum') && snake.length > '_enum'.length) {
    return snake.substring(0, snake.length - '_enum'.length);
  }
  return snake;
}

/// Emits one `Enum "<name>" { ... }` block. Empty-variant enums (analyzer
/// couldn't resolve the type) still produce a block with a placeholder
/// comment so the schema is syntactically valid DBML.
void _emitEnumBlock(_EnumInfo e, StringBuffer buf) {
  buf.writeln('Enum "${_escapeDbmlString(e.dbmlName)}" {');
  if (e.variants.isEmpty) {
    buf.writeln('  // TODO: variants for `${e.dartName}` were not resolvable;');
    buf.writeln(
      '  // fill them in or re-run with the enum source on the path.',
    );
    buf.writeln('  unknown');
  } else {
    for (final v in e.variants) {
      buf.writeln('  $v');
    }
  }
  buf.writeln('}');
}
