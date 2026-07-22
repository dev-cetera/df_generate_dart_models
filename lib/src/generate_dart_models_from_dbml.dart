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

import 'dart:io' show Directory, File, Process;
import 'dart:isolate';

import 'package:path/path.dart' as p;

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_string/df_string.dart';

import 'generate_dart_models.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Reads a DBML file (one or many `Table` blocks, optional `enum` blocks and
/// trailing `Ref:` lines) and emits one annotated abstract Dart class per
/// `Table` plus one Dart enum per DBML `enum` — the inverse of
/// `generateDbml`.
///
/// `--dialect` controls which prefix vocabulary the generated `fieldType`
/// strings carry, so the same DBML file can target Postgres-flavoured models
/// (PG_*-), SQLite-flavoured models (SQLITE_*-), or a generic / dialect-free
/// shape that the codegen treats with [DartCoreTypeMappers] only.
///
///  - `postgres` → `PG_text-String`, `PG_bigint-int`, `PG_jsonb-Map`,
///    `PG_bytea-Uint8List`, `PG_enum(<name>)-XyzType`, …
///  - `sqlite`   → `SQLITE_text-String`, `SQLITE_integer-int`,
///    `SQLITE_json-Map`, `SQLITE_integer-bool`, …
///  - `generic`  → bare Dart types (`String`, `int`, `Map<String, dynamic>`).
///
/// The `pgenum` keyword (and the more standard DBML form where a column type
/// is the name of a declared `enum`) round-trips into a Dart enum *plus* a
/// `PG_enum(<enumName>)-<XyzEnum>` field type — so the generated model is
/// directly usable with the existing PG runtime mappers.
Future<void> generateDartModelsFromDbml(List<String> args) async {
  Log.enableReleaseAsserts = true;

  const OUTPUT_PATH = OptionParam(
    name: 'output',
    abbr: 'o',
    help: 'Directory to write the generated model files into. Defaults to '
        'the directory containing the input DBML file.',
  );
  const DIALECT = OptionParam(
    name: 'dialect',
    abbr: 'd',
    defaultsTo: 'postgres',
    help: 'Type-prefix vocabulary to emit: postgres | sqlite | generic.',
  );
  const SCHEMA = OptionParam(
    name: 'schema',
    abbr: 's',
    help: 'Override the `schema:` value written into every @GenerateDartModel '
        'annotation. When omitted, falls back to the DBML file\'s '
        '`// Schema:` header comment if present, otherwise the file base '
        'name without extension.',
  );
  const CLASS_PREFIX = OptionParam(
    name: 'class-prefix',
    defaultsTo: 'Model',
    help: 'Prefix applied to every generated class name (default: "Model"). '
        'A DBML table `users` becomes `_ModelUser` (private abstract) → '
        '`ModelUser` (generated public class).',
  );
  const KEY_STRING_CASE = OptionParam(
    name: 'key-string-case',
    defaultsTo: 'LOWER_SNAKE_CASE',
    help: 'String case applied to the generated `keyStringCase:` value. '
        'Matches the DBML column casing so JSON keys round-trip cleanly.',
  );
  const NO_CODEGEN = Flag(
    name: 'no-codegen',
    defaultsTo: false,
    help: 'Skip the trailing forward-codegen pass. By default this command '
        'writes the @GenerateDartModel source files AND then runs '
        'df_generate_dart_models so the matching `_<name>.g.dart` files are '
        'produced in the same pass. Pass --no-codegen to stop after the '
        'annotation files.',
  );
  const TEMPLATE_PATH_OR_URL = OptionParam(
    name: 'template',
    abbr: 't',
    help: 'Template path or URL passed to the forward codegen pass when '
        'codegen is enabled. Defaults to the version-tagged featured_v1 '
        'template that ships with this package.',
  );

  final parser = CliParser(
    title: 'dev-cetera.com',
    description: 'Generates Dart model source files (one per Table) from a '
        'DBML schema file. The output dialect controls the type-prefix '
        'vocabulary used in the @GenerateDartModel field declarations. '
        'Runs the forward `df_generate_dart_models` codegen automatically '
        'unless --no-codegen is passed.',
    example: 'generate-dart-models-from-dbml -i schema.dbml -o lib/src/models '
        '--dialect postgres',
    additional: 'For contributions, error reports and information, visit: '
        'https://github.com/dev-cetera.',
    params: [
      DefaultFlags.HELP.flag,
      DefaultOptionParams.INPUT_PATH.option,
      OUTPUT_PATH,
      DIALECT,
      SCHEMA,
      CLASS_PREFIX,
      KEY_STRING_CASE,
      NO_CODEGEN,
      TEMPLATE_PATH_OR_URL,
    ],
  );

  final (argResults, argParser) = parser.parse(args);

  if (argResults.flag(DefaultFlags.HELP.name)) {
    Log.printCyan(parser.getInfo(argParser));
    exit(ExitCodes.SUCCESS.code);
  }

  late final String inputPath;
  late final String? outputPathArg;
  late final String dialect;
  late final String? schemaOverride;
  late final String classPrefix;
  late final String keyStringCase;
  late final bool noCodegen;
  late final String? templateArg;
  try {
    inputPath = argResults.option(DefaultOptionParams.INPUT_PATH.name)!;
    outputPathArg = argResults.option(OUTPUT_PATH.name);
    dialect = (argResults.option(DIALECT.name) ?? 'postgres').toLowerCase();
    schemaOverride = argResults.option(SCHEMA.name);
    classPrefix = argResults.option(CLASS_PREFIX.name) ?? 'Model';
    keyStringCase =
        argResults.option(KEY_STRING_CASE.name) ?? 'LOWER_SNAKE_CASE';
    noCodegen = argResults.flag(NO_CODEGEN.name);
    templateArg = argResults.option(TEMPLATE_PATH_OR_URL.name);
  } catch (_) {
    Log.printRed(
      'Missing required args! Use --help flag for more information.',
    );
    exit(ExitCodes.FAILURE.code);
  }

  if (!const {'postgres', 'sqlite', 'generic'}.contains(dialect)) {
    Log.printRed(
      'Unknown dialect "$dialect" — must be one of: postgres, sqlite, generic.',
    );
    exit(ExitCodes.FAILURE.code);
  }

  final inputFile = File(inputPath);
  if (!await inputFile.exists()) {
    Log.printRed('Input DBML file not found: $inputPath');
    exit(ExitCodes.FAILURE.code);
  }

  Log.printWhite('Reading DBML at: $inputPath ...');
  final source = await inputFile.readAsString();
  final parsed = _parseDbml(source);

  if (parsed.tables.isEmpty) {
    Log.printYellow('No Table blocks found in $inputPath — nothing to emit.');
    return;
  }

  // The schema name baked into every annotation: explicit `--schema` wins,
  // then the `// Schema: ...` header comment the DBML emitter writes, then
  // the bare file name without extension.
  final schemaName = schemaOverride ??
      parsed.schemaHeader ??
      p.basenameWithoutExtension(inputPath);

  final outputDir = outputPathArg ?? p.dirname(inputPath);

  // Walk every column once to discover enum references that weren't
  // declared as standalone `enum {...}` blocks — the forward DBML emitter
  // writes columns as `enum(<name>)` without a matching block, so without
  // this pass the enum identifier would dangle in the generated source.
  final declaredEnumNames = {for (final e in parsed.enums) e.name};
  for (final table in parsed.tables) {
    for (final col in table.columns) {
      final raw = col.rawType.toLowerCase();
      final paren = RegExp(r'^enum\s*\(([^)]+)\)').firstMatch(raw);
      if (paren != null) {
        final enumName = paren.group(1)!.trim();
        if (!declaredEnumNames.contains(enumName)) {
          parsed.enums.add(_ParsedEnum(name: enumName, values: const []));
          declaredEnumNames.add(enumName);
        }
        continue;
      }
      if (raw == 'pgenum' && col.inlineEnumName != null) {
        final enumName = col.inlineEnumName!;
        if (!declaredEnumNames.contains(enumName)) {
          parsed.enums.add(_ParsedEnum(name: enumName, values: const []));
          declaredEnumNames.add(enumName);
        }
      }
    }
  }

  // Emit a sidecar enums.dart file when the DBML declares (or implies via
  // `enum(name)` column types) any enums — keeps every Table's source file
  // slim and lets multiple tables share the same enum types.
  if (parsed.enums.isNotEmpty) {
    final enumsBuf = StringBuffer();
    enumsBuf.writeln(_licenseBanner);
    enumsBuf.writeln();
    enumsBuf.writeln(
      '// Generated by df_generate_dart_models_from_dbml — do not edit.',
    );
    enumsBuf.writeln();
    for (final e in parsed.enums) {
      _emitDartEnum(e, enumsBuf);
      enumsBuf.writeln();
    }
    final enumsPath = p.join(outputDir, 'dbml_enums.dart');
    await FileSystemUtility.i.writeLocalFile(enumsPath, enumsBuf.toString());
    Log.printGreen('✔ Wrote ${parsed.enums.length} enum(s) → $enumsPath');
  }

  // Map every table-name → public class name so cross-table `references:`
  // resolve to the right ModelXxx class symbol.
  final classByTable = <String, String>{};
  for (final table in parsed.tables) {
    classByTable[table.name] = _publicClassNameFor(table.name, classPrefix);
  }

  // Refs declared as standalone `Ref: a.col > b.col` lines get folded into
  // the source column's foreign-key metadata.
  final refByColumn = <String, _ParsedRef>{};
  for (final ref in parsed.refs) {
    refByColumn['${ref.srcTable}.${ref.srcColumn}'] = ref;
  }

  final enumByName = {for (final e in parsed.enums) e.name: e};

  var emitted = 0;
  for (final table in parsed.tables) {
    final publicClass = classByTable[table.name]!;
    final privateClass = '_$publicClass';
    final dirName = publicClass.toSnakeCase();
    final fileName = '$dirName.dart';

    final outputFilePath = p.join(outputDir, dirName, fileName);

    // Pre-compute every mapped type for this table so we can decide which
    // dart: imports the parent source needs. Uint8List is the only one the
    // mappers currently lean on, but the pattern extends naturally.
    final mappedTypes = <_MappedType>[];
    for (final col in table.columns) {
      mappedTypes.add(_mapColumnType(col, enumByName, dialect));
    }
    final usesUint8List =
        mappedTypes.any((m) => m.fieldType.contains('Uint8List'));

    final buffer = StringBuffer();
    buffer.writeln(_licenseBanner);
    buffer.writeln();
    if (usesUint8List) {
      buffer.writeln("import 'dart:typed_data' show Uint8List;");
    }
    buffer.writeln(
      "import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';",
    );
    if (parsed.enums.isNotEmpty) {
      buffer.writeln("import '../dbml_enums.dart';");
    }
    // No cross-table imports — `references:` is emitted as a String literal
    // so the analyzer doesn't need the target class in scope.
    buffer.writeln();
    // The matching `part` directive that pulls in the *.g.dart the forward
    // codegen will emit alongside this file. Without it the .g.dart is a
    // dangling library and can't see BaseModel, EquatableMixin, letMapOrNull
    // etc. that come in via df_generate_dart_models_core.
    buffer.writeln("part '_$dirName.g.dart';");
    buffer.writeln();
    buffer.writeln(
      '// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░',
    );
    buffer.writeln();
    if (table.note != null && table.note!.isNotEmpty) {
      buffer.writeln('/// ${table.note}');
    }
    buffer.writeln('@GenerateDartModel(');
    buffer.writeln('  shouldInherit: true,');
    buffer.writeln('  tableName: \'${_escape(table.name)}\',');
    buffer.writeln('  schema: \'${_escape(schemaName)}\',');
    buffer.writeln('  keyStringCase: \'${_escape(keyStringCase)}\',');
    if (table.note != null && table.note!.isNotEmpty) {
      buffer.writeln('  description: \'${_escape(table.note!)}\',');
    }
    buffer.writeln('  fields: {');
    for (final col in table.columns) {
      _emitFieldLine(
        col,
        table,
        classByTable,
        refByColumn,
        enumByName,
        dialect,
        buffer,
      );
    }
    buffer.writeln('  },');
    buffer.writeln(')');
    buffer.writeln('abstract class $privateClass extends Model {');
    buffer.writeln('  const $privateClass();');
    buffer.writeln('}');

    await FileSystemUtility.i.writeLocalFile(outputFilePath, buffer.toString());
    Log.printGreen('✔ Wrote $publicClass → $outputFilePath');
    emitted++;
  }

  Log.printGreen(
    'Done — emitted $emitted Dart model file(s) from ${parsed.tables.length} '
    'table(s) using dialect "$dialect".',
  );

  if (noCodegen) {
    Log.printWhite(
      '--no-codegen passed; skipping forward codegen pass. Run '
      '`df_generate_dart_models -i $outputDir` to produce the _<name>.g.dart '
      'files when ready.',
    );
    return;
  }

  // Make sure the output dir resolves to a real, importable pub package — the
  // forward codegen needs the analyzer to resolve
  // `package:df_generate_dart_models_core/...`. When the output dir already
  // sits inside an existing project, this is a no-op. Otherwise we drop a
  // minimal pubspec + overrides referencing the local checkouts so it works
  // even out-of-tree (the test_outputs/ demo case).
  final bootstrapped = await _ensurePubWorkspace(outputDir);
  if (bootstrapped) {
    Log.printWhite('Bootstrapped a pub workspace at $outputDir.');
  }

  final template = templateArg ?? await _resolveBundledTemplate();
  Log.printWhite('Running forward codegen with template: $template');
  try {
    await generateDartModels(
      ['--input', outputDir, '--template', template],
      defaultTemplatePathOrUrl: template,
    );
  } catch (e) {
    Log.printRed('Forward codegen failed: $e');
    exit(ExitCodes.FAILURE.code);
  }
}

/// Ensures [outputDir] is inside a pub workspace so the analyzer can resolve
/// `package:df_generate_dart_models_core/...` during the forward codegen
/// pass. Returns `true` when this call had to bootstrap the workspace
/// (created `pubspec.yaml`, optional overrides, and ran `pub get`).
Future<bool> _ensurePubWorkspace(String outputDir) async {
  // Walk up the directory tree looking for any existing pubspec. If found,
  // we trust it — the user owns it and we don't want to clobber dependencies.
  var dir = Directory(p.absolute(outputDir));
  while (true) {
    final ps = File(p.join(dir.path, 'pubspec.yaml'));
    if (ps.existsSync()) return false;
    final parent = dir.parent;
    if (parent.path == dir.path) break; // hit filesystem root
    dir = parent;
  }

  // No pubspec found anywhere above [outputDir]. Drop a minimal one + an
  // overrides file pointing at the local df_generate_dart_models_core
  // checkout if we can find it relative to this package's own install.
  final pubspecPath = p.join(outputDir, 'pubspec.yaml');
  final packageName = p.basename(p.absolute(outputDir)).replaceAll('-', '_');
  final corePath = await _resolveLocalDfCorePath();
  final coreDep = corePath != null
      ? '  df_generate_dart_models_core:\n    path: $corePath'
      : '  df_generate_dart_models_core: ^0.11.0';
  await FileSystemUtility.i.writeLocalFile(pubspecPath, '''
name: ${packageName.isEmpty ? 'generated_models' : packageName}
publish_to: none
environment:
  sdk: ">=3.5.0 <4.0.0"
dependencies:
$coreDep
''');
  if (corePath != null) {
    await FileSystemUtility.i.writeLocalFile(
      p.join(outputDir, 'pubspec_overrides.yaml'),
      'dependency_overrides:\n'
      '  df_generate_dart_models_core:\n'
      '    path: $corePath\n',
    );
  }
  // Silence the predictable analyzer warnings on the freshly generated
  // template output so the developer's `dart analyze` stays useful.
  await FileSystemUtility.i.writeLocalFile(
    p.join(outputDir, 'analysis_options.yaml'),
    'analyzer:\n'
    '  errors:\n'
    '    unused_import: ignore\n'
    '    unused_element: ignore\n'
    '    override_on_non_overriding_member: ignore\n',
  );

  Log.printWhite('Running `dart pub get` in $outputDir ...');
  final result = await Process.run(
    'dart',
    ['pub', 'get'],
    workingDirectory: outputDir,
    runInShell: true,
  );
  if (result.exitCode != 0) {
    Log.printRed('`dart pub get` failed:\n${result.stderr}');
    exit(ExitCodes.FAILURE.code);
  }
  return true;
}

/// Resolves the local checkout of `df_generate_dart_models_core` relative to
/// this package's install directory. Returns `null` when the sibling
/// directory isn't there (i.e. this package was installed from pub.dev), in
/// which case the caller falls back to a `^x.y.z` hosted constraint.
Future<String?> _resolveLocalDfCorePath() async {
  try {
    final uri = await Isolate.resolvePackageUri(
      Uri.parse('package:df_generate_dart_models/df_generate_dart_models.dart'),
    );
    if (uri == null) return null;
    // .../df_generate_dart_models/lib/df_generate_dart_models.dart
    // → .../df_generate_dart_models/  → parent → siblings
    final libDir = File.fromUri(uri).parent;
    final pkgDir = libDir.parent;
    final sibling =
        Directory(p.join(pkgDir.parent.path, 'df_generate_dart_models_core'));
    if (sibling.existsSync()) return sibling.path;
    return null;
  } catch (_) {
    return null;
  }
}

/// Resolves the template URL or path passed to the forward codegen pass. We
/// mirror `bin/df_generate_dart_models.dart`'s version-tagged URL form so the
/// template stays pinned to the matching git tag (and, for local checkouts,
/// falls back to the file path so offline use works).
Future<String> _resolveBundledTemplate() async {
  try {
    final uri = await Isolate.resolvePackageUri(
      Uri.parse('package:df_generate_dart_models/df_generate_dart_models.dart'),
    );
    if (uri != null) {
      final pkgDir = File.fromUri(uri).parent.parent;
      final tpl = File(p.join(pkgDir.path, 'templates', 'featured_v1.dart.md'));
      if (tpl.existsSync()) return tpl.path;
      // Version-tagged URL fallback.
      final pubspec = File(p.join(pkgDir.path, 'pubspec.yaml'));
      if (pubspec.existsSync()) {
        final v = RegExp(
          r'^version:\s*(\S+)',
          multiLine: true,
        ).firstMatch(pubspec.readAsStringSync())?.group(1);
        if (v != null) {
          return 'https://raw.githubusercontent.com/dev-cetera/df_generate_dart_models/v$v/templates/featured_v1.dart.md';
        }
      }
    }
  } catch (_) {}
  return 'https://raw.githubusercontent.com/dev-cetera/df_generate_dart_models/main/templates/featured_v1.dart.md';
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const _licenseBanner = '//.title\n'
    '// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓\n'
    '//\n'
    '// Copyright © dev-cetera.com & contributors.\n'
    '//\n'
    '// The use of this source code is governed by an MIT-style license described in\n'
    "// the LICENSE file located in this project's root directory.\n"
    '//\n'
    '// See: https://opensource.org/license/mit\n'
    '//\n'
    '// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓\n'
    '//.title~';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void _emitDartEnum(_ParsedEnum e, StringBuffer buf) {
  final dartName = _enumClassNameFor(e.name);
  buf.writeln('/// Generated from DBML enum `${e.name}`.');
  buf.writeln('enum $dartName {');
  if (e.values.isEmpty) {
    // The DBML declared the enum only via a column type — `enum(<name>)` or
    // `pgenum [enum: <name>]` — but no `enum {...}` block listed its values.
    // Emit a single `unknown` placeholder so the Dart `enum` is syntactically
    // valid; the developer fills in the real variants by hand.
    buf.writeln('  // TODO: declare the variants for `${e.name}`.');
    buf.writeln('  unknown,');
  } else {
    for (final v in e.values) {
      final identifier = _toDartIdentifier(v);
      buf.writeln('  $identifier,');
    }
  }
  buf.writeln('}');
}

void _emitFieldLine(
  _ParsedColumn col,
  _ParsedTable table,
  Map<String, String> classByTable,
  Map<String, _ParsedRef> refByColumn,
  Map<String, _ParsedEnum> enumByName,
  String dialect,
  StringBuffer buf,
) {
  final mapped = _mapColumnType(col, enumByName, dialect);
  final camel = col.name.toCamelCase();

  // Foreign keys: inline `[ref: > ...]` on the column wins, otherwise look up
  // the trailing `Ref:` table.
  final inlineRef = col.inlineRef;
  final standaloneRef = refByColumn['${table.name}.${col.name}'];
  final refTable = inlineRef?.targetTable ?? standaloneRef?.dstTable;

  buf.writeln('    Field(');
  // Single-segment paths are emitted as bare String literals; the
  // FieldUtils.normalisePath path handles String + Iterable + null
  // uniformly, so we save the visual noise of a one-element list.
  buf.writeln('      fieldPath: \'$camel\',');

  // Wire either as a Type literal (for bare Dart types — most readable) or
  // a String literal (for prefix-bearing types and enums that the Dart
  // identifier resolver wouldn't accept directly).
  if (mapped.useStringLiteral) {
    buf.writeln('      fieldType: \'${_escape(mapped.fieldType)}\',');
  } else {
    buf.writeln('      fieldType: ${mapped.fieldType},');
  }

  if (col.nullable) {
    buf.writeln('      nullable: true,');
  }
  if (col.primaryKey) {
    buf.writeln('      primaryKey: true,');
  }
  if (refTable != null && refTable.isNotEmpty) {
    // Emit as a String literal rather than a Type literal so the analyzer
    // doesn't have to resolve the target class during the forward codegen
    // pass — `.g.dart` files are generated incrementally and a Type
    // literal would yield `null` when its target hasn't been written yet,
    // silently dropping the entry from the `$foreignKeys` map.
    final classRef = classByTable[refTable];
    final refName = classRef ?? refTable;
    buf.writeln('      references: \'${_escape(refName)}\',');
    buf.writeln('      foreignKey: true,');
  }
  if (col.note != null && col.note!.isNotEmpty) {
    buf.writeln('      description: \'${_escape(col.note!)}\',');
  }
  buf.writeln('    ),');
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Maps a parsed DBML column to a Dart field-type string + a flag telling the
/// caller whether to emit it as a `String` literal (for the prefix-bearing
/// vocabulary the codegen looks for) or a bare Dart `Type` literal.
_MappedType _mapColumnType(
  _ParsedColumn col,
  Map<String, _ParsedEnum> enumByName,
  String dialect,
) {
  final raw = col.rawType.trim();
  final isArray = raw.endsWith('[]');
  final base = isArray ? raw.substring(0, raw.length - 2).trim() : raw;

  // Strip column-type parameters like `varchar(255)` → `varchar`, but keep
  // the originally written form for the prefix tail so DDL emission stays
  // lossless when this same model later round-trips through generateDbml.
  final parenMatch = RegExp(r'^(\w+)\s*(\([^)]*\))?$').firstMatch(base);
  final baseName = (parenMatch?.group(1) ?? base).toLowerCase();
  final baseTail = parenMatch?.group(2) ?? '';
  final arrayTail = isArray ? '[]' : '';

  // 1) DBML enum reference. Three shapes we accept here:
  //    - `pgenum`            — column type literal, enum name comes from the
  //                            inline `[enum: <name>]` note.
  //    - `enum(<name>)`      — the canonical form `df_generate_dbml` emits
  //                            (and the form most schema designers write by
  //                            hand). Enum name is in baseTail's parens.
  //    - bare `<enum_name>`  — column type is literally the name of a
  //                            declared `enum {...}` block.
  String? enumKey;
  if (enumByName.containsKey(baseName)) {
    enumKey = baseName;
  } else if (enumByName.containsKey(base)) {
    enumKey = base;
  } else if (baseName == 'enum' && baseTail.isNotEmpty) {
    // baseTail looks like `(post_status_kind)`.
    enumKey = baseTail.replaceAll(RegExp(r'[()\s]'), '');
  } else if (baseName == 'pgenum') {
    enumKey = col.inlineEnumName ?? 'unknown';
  }
  if (enumKey != null) {
    final enumDartName = _enumClassNameFor(enumKey);
    // Emit the field type as a bare Dart Type literal pointing at the
    // generated `enum XxxEnum`. The Core mapper's `^(Enum-?\w+|\w+-?Enum)\??$`
    // regex matches it on the from-side and emits `values.valueOf(...)` —
    // exactly the right enum runtime handling for every dialect. We
    // deliberately *don't* use the `PG_enum(<name>)-XxxEnum` String form here
    // — that would force the field to be quoted and obscure the link to the
    // real Dart enum at the call site. The PG enum-name parameter is only
    // needed for DDL emission; we accept that re-emitting DBML from these
    // models would write the column as `text` rather than the
    // `enum(<name>)` form the input had.
    return _MappedType(
      fieldType: enumDartName,
      useStringLiteral: false,
    );
  }

  // 2) Plain-Dart fallback: caller asked for `generic` — bypass all prefix
  //    construction and let DartCoreTypeMappers do the work.
  if (dialect == 'generic') {
    final dartType = _genericDartTypeFor(baseName, isArray);
    return _MappedType(
      fieldType: dartType,
      useStringLiteral: _typeNeedsStringLiteral(dartType),
    );
  }

  // 3) Dialect-prefixed mapping.
  if (dialect == 'postgres') {
    return _MappedType(
      fieldType: _pgTypeFor(baseName, baseTail, arrayTail),
      useStringLiteral: true,
    );
  }
  // sqlite
  return _MappedType(
    fieldType: _sqliteTypeFor(baseName, baseTail, arrayTail),
    useStringLiteral: true,
  );
}

/// PG-prefix vocabulary chosen to match DartPostgresTypeMappers' regexes —
/// see lib/src/dart_postgres_type_mappers.dart. Unknown column types fall
/// back to `PG_text-String` (the safest "I'll just store this as text"
/// default).
String _pgTypeFor(String baseName, String baseTail, String arrayTail) {
  // Native array variants ─ Postgres has true array columns; the
  // PG_<type>[]-List mapper handles them.
  if (arrayTail == '[]') {
    return 'PG_$baseName[]-List';
  }
  switch (baseName) {
    case 'text':
    case 'varchar':
    case 'char':
    case 'citext':
    case 'name':
    case 'xml':
    case 'uuid':
    case 'inet':
    case 'cidr':
    case 'macaddr':
    case 'macaddr8':
    case 'tsvector':
    case 'tsquery':
    case 'money':
    case 'pg_lsn':
    case 'bit':
    case 'oid':
      return 'PG_$baseName$baseTail-String';
    case 'smallint':
    case 'integer':
    case 'int':
    case 'int2':
    case 'int4':
    case 'int8':
    case 'bigint':
    case 'smallserial':
    case 'serial':
    case 'bigserial':
      final canonical = baseName == 'int' ? 'integer' : baseName;
      return 'PG_$canonical$baseTail-int';
    case 'real':
    case 'float4':
    case 'float8':
    case 'double':
      return 'PG_$baseName$baseTail-double';
    case 'double precision':
      return 'PG_double-double';
    case 'numeric':
    case 'decimal':
      // Numeric defaults to lossy-double — pick String form by hand when
      // full precision matters (e.g. PG_numeric(10,2)-String).
      return 'PG_numeric$baseTail-double';
    case 'boolean':
    case 'bool':
      return 'PG_boolean-bool';
    case 'timestamptz':
    case 'timestamp':
    case 'date':
      return 'PG_$baseName-DateTime';
    case 'interval':
      return 'PG_interval-Duration';
    case 'bytea':
      return 'PG_bytea-Uint8List';
    case 'json':
    case 'jsonb':
      return 'PG_$baseName-Map';
    default:
      // Unknown — fall back to text so the column still round-trips.
      return 'PG_text-String';
  }
}

/// SQLite-prefix vocabulary, matched to DartSqliteTypeMappers' regexes.
/// SQLite only has five storage classes — we lean on community conventions
/// (bool→integer, DateTime→text ISO, JSON→text) for everything else.
String _sqliteTypeFor(String baseName, String baseTail, String arrayTail) {
  // SQLite has no array columns; emit a JSON-encoded List to stay portable.
  if (arrayTail == '[]') {
    return 'SQLITE_json-List';
  }
  switch (baseName) {
    case 'text':
    case 'varchar':
    case 'char':
    case 'clob':
      return 'SQLITE_$baseName$baseTail-String';
    case 'integer':
    case 'int':
    case 'bigint':
    case 'smallint':
      return 'SQLITE_integer$baseTail-int';
    case 'real':
    case 'float':
    case 'double':
      return 'SQLITE_real-double';
    case 'numeric':
    case 'decimal':
      return 'SQLITE_numeric$baseTail-double';
    case 'boolean':
    case 'bool':
      return 'SQLITE_integer-bool';
    case 'blob':
    case 'bytea':
      return 'SQLITE_blob-Uint8List';
    case 'timestamptz':
    case 'timestamp':
    case 'date':
    case 'datetime':
      return 'SQLITE_text-DateTime';
    case 'epoch':
    case 'epochs':
      return 'SQLITE_epochs-DateTime';
    case 'epochms':
      return 'SQLITE_epochms-DateTime';
    case 'julianday':
      return 'SQLITE_julianday-DateTime';
    case 'json':
    case 'jsonb':
      return 'SQLITE_json-Map';
    default:
      return 'SQLITE_text-String';
  }
}

/// Dialect-free mapping — bare Dart types only. Caller emits these as
/// Type literals where possible so the generated source stays idiomatic.
String _genericDartTypeFor(String baseName, bool isArray) {
  String inner;
  switch (baseName) {
    case 'text':
    case 'varchar':
    case 'char':
    case 'citext':
    case 'name':
    case 'xml':
    case 'uuid':
    case 'inet':
    case 'cidr':
    case 'macaddr':
    case 'macaddr8':
    case 'clob':
      inner = 'String';
      break;
    case 'smallint':
    case 'integer':
    case 'int':
    case 'int2':
    case 'int4':
    case 'int8':
    case 'bigint':
    case 'smallserial':
    case 'serial':
    case 'bigserial':
      inner = 'int';
      break;
    case 'real':
    case 'float':
    case 'float4':
    case 'float8':
    case 'double':
    case 'double precision':
      inner = 'double';
      break;
    case 'numeric':
    case 'decimal':
    case 'money':
      inner = 'num';
      break;
    case 'boolean':
    case 'bool':
      inner = 'bool';
      break;
    case 'timestamptz':
    case 'timestamp':
    case 'date':
    case 'datetime':
      inner = 'DateTime';
      break;
    case 'interval':
      inner = 'Duration';
      break;
    case 'bytea':
    case 'blob':
      inner = 'Uint8List';
      break;
    case 'json':
    case 'jsonb':
      // Default the json-ish shape to a Map; switch to List manually if the
      // payload is array-shaped.
      inner = 'Map<String, dynamic>';
      break;
    case 'uri':
    case 'url':
      inner = 'Uri';
      break;
    default:
      inner = 'String';
  }
  return isArray ? 'List<$inner>' : inner;
}

/// `Map<String, dynamic>` and `List<...>` literals are not legal Type
/// literals as-is in a const annotation, so we emit them as Strings.
/// Single identifiers (`String`, `int`, `DateTime`, `Uint8List`) stay bare.
bool _typeNeedsStringLiteral(String dartType) {
  return dartType.contains('<') || dartType.contains(',');
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _MappedType {
  const _MappedType({required this.fieldType, required this.useStringLiteral});
  final String fieldType;
  final bool useStringLiteral;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _ParsedDbml {
  _ParsedDbml({
    required this.tables,
    required this.enums,
    required this.refs,
    required this.schemaHeader,
  });
  final List<_ParsedTable> tables;
  final List<_ParsedEnum> enums;
  final List<_ParsedRef> refs;
  final String? schemaHeader;
}

class _ParsedTable {
  _ParsedTable({required this.name, required this.columns, this.note});
  final String name;
  final List<_ParsedColumn> columns;
  final String? note;
}

class _ParsedColumn {
  _ParsedColumn({
    required this.name,
    required this.rawType,
    this.primaryKey = false,
    this.nullable = true,
    this.note,
    this.inlineRef,
    this.inlineEnumName,
  });
  final String name;
  final String rawType;
  bool primaryKey;
  bool nullable;
  String? note;
  _InlineRef? inlineRef;
  // For `pgenum` columns where the enum name is captured separately
  // (e.g. `status pgenum [enum: job_status]`).
  String? inlineEnumName;
}

class _ParsedEnum {
  _ParsedEnum({required this.name, required this.values});
  final String name;
  final List<String> values;
}

class _ParsedRef {
  _ParsedRef({
    required this.srcTable,
    required this.srcColumn,
    required this.dstTable,
    required this.dstColumn,
  });
  final String srcTable;
  final String srcColumn;
  final String dstTable;
  final String dstColumn;
}

class _InlineRef {
  _InlineRef({required this.targetTable, required this.targetColumn});
  final String targetTable;
  final String targetColumn;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Hand-rolled DBML parser. DBML is a small line-based language — we accept
/// the subset our own `generateDbml` emits plus the standard `enum` block
/// and `Ref:` line shapes. Inline column-level `[note: '...', ref: > ...,
/// pk, not null]` notes are recognised; advanced features (composite PKs,
/// indexes, table groups) are tolerated and silently dropped — they don't
/// affect Dart codegen.
_ParsedDbml _parseDbml(String source) {
  final tables = <_ParsedTable>[];
  final enums = <_ParsedEnum>[];
  final refs = <_ParsedRef>[];
  String? schemaHeader;

  final lines = source.split('\n');

  // First pass: pull the `// Schema: ...` header comment we emit ourselves,
  // and strip all comments / blank lines so the block-level parser below is
  // simpler.
  for (final raw in lines) {
    final m = RegExp(r'^\s*//\s*Schema:\s*(.+?)\s*$').firstMatch(raw);
    if (m != null) {
      schemaHeader = m.group(1);
      break;
    }
  }

  // Re-tokenise into a list of trimmed, comment-stripped lines, preserving
  // braces so the block walker below can find {} pairs cheaply.
  final cleaned = <String>[];
  for (final raw in lines) {
    var line = raw;
    final commentIdx = line.indexOf('//');
    if (commentIdx >= 0) line = line.substring(0, commentIdx);
    final trimmed = line.trim();
    if (trimmed.isEmpty) continue;
    cleaned.add(trimmed);
  }

  var i = 0;
  while (i < cleaned.length) {
    final line = cleaned[i];

    // ── Table ──────────────────────────────────────────────────────────
    final tableMatch = RegExp(
      r'^Table\s+"?([A-Za-z_][\w.]*)"?\s*(?:as\s+\w+)?\s*\{$',
    ).firstMatch(line);
    if (tableMatch != null) {
      final name = _stripSchemaPrefix(tableMatch.group(1)!);
      final columns = <_ParsedColumn>[];
      String? tableNote;
      i++;
      while (i < cleaned.length && cleaned[i] != '}') {
        final l = cleaned[i];
        // `Note: '...'` block inside a table.
        final noteMatch =
            RegExp(r"^Note:\s*'((?:[^'\\]|\\.)*)'\s*$").firstMatch(l);
        if (noteMatch != null) {
          tableNote = _unescape(noteMatch.group(1)!);
          i++;
          continue;
        }
        // `indexes { ... }` block — skip its body.
        if (RegExp(r'^indexes\s*\{').hasMatch(l)) {
          i++;
          while (i < cleaned.length && cleaned[i] != '}') {
            i++;
          }
          if (i < cleaned.length) i++; // consume the `}`
          continue;
        }
        final col = _parseColumn(l);
        if (col != null) columns.add(col);
        i++;
      }
      if (i < cleaned.length) i++; // consume the closing `}`
      tables.add(
        _ParsedTable(name: name, columns: columns, note: tableNote),
      );
      continue;
    }

    // ── Enum ───────────────────────────────────────────────────────────
    final enumMatch =
        RegExp(r'^[Ee]num\s+"?([A-Za-z_][\w.]*)"?\s*\{$').firstMatch(line);
    if (enumMatch != null) {
      final enumName = _stripSchemaPrefix(enumMatch.group(1)!);
      final values = <String>[];
      i++;
      while (i < cleaned.length && cleaned[i] != '}') {
        final v = cleaned[i];
        // Strip optional `[note: '...']` after the value name.
        final valMatch =
            RegExp(r'^"?([\w-]+)"?(?:\s*\[.*\])?\s*$').firstMatch(v);
        if (valMatch != null) values.add(valMatch.group(1)!);
        i++;
      }
      if (i < cleaned.length) i++;
      enums.add(_ParsedEnum(name: enumName, values: values));
      continue;
    }

    // ── Standalone Ref: ────────────────────────────────────────────────
    final refMatch = RegExp(
      r'^Ref(?:\s+\w+)?\s*:\s*'
      r'"?([\w.]+)"?\.\s*"?(\w+)"?\s*'
      r'(?:>|<|-)\s*'
      r'"?([\w.]+)"?\.\s*"?(\w+)"?\s*$',
    ).firstMatch(line);
    if (refMatch != null) {
      refs.add(
        _ParsedRef(
          srcTable: _stripSchemaPrefix(refMatch.group(1)!),
          srcColumn: refMatch.group(2)!,
          dstTable: _stripSchemaPrefix(refMatch.group(3)!),
          dstColumn: refMatch.group(4)!,
        ),
      );
      i++;
      continue;
    }

    // Unrecognised top-level line — skip.
    i++;
  }

  return _ParsedDbml(
    tables: tables,
    enums: enums,
    refs: refs,
    schemaHeader: schemaHeader,
  );
}

/// Parses one column line inside a Table block. Shape:
/// `column_name column_type [note1, note2, ref: > other.col, ...]`
_ParsedColumn? _parseColumn(String line) {
  // Strategy: peel off the column name + type up front (allowing the optional
  // `[]` array suffix on the type), then anything remaining and bracketed is
  // the notes block. Walking left-to-right avoids confusing the array `[]`
  // with the notes `[...]` — the previous indexOf('[') approach swallowed
  // `text[]` as an empty notes block.
  final head = RegExp(
    r'^"?([A-Za-z_]\w*)"?\s+([A-Za-z_]\w*(?:\s*\([^)]*\))?(?:\s*\[\s*\])?)\s*',
  ).firstMatch(line);
  if (head == null) return null;

  final name = head.group(1)!;
  final type = head.group(2)!.replaceAll(RegExp(r'\s+'), '');

  // Whatever's left is either an `[ ... ]` notes block or trailing junk.
  String? notesBody;
  final rest = line.substring(head.end).trim();
  if (rest.startsWith('[') && rest.endsWith(']')) {
    notesBody = rest.substring(1, rest.length - 1);
  }

  var primaryKey = false;
  // DBML's actual default is nullable; only `[pk]` and `[not null]` flip
  // this. The previous "default NOT NULL when notes are present" heuristic
  // produced wrong models for columns like `color text [note: '...']` where
  // a note was supplied but the column was still nullable.
  var nullable = true;
  String? note;
  _InlineRef? inlineRef;
  String? inlineEnumName;

  if (notesBody != null) {
    final parts = _splitNotes(notesBody);
    for (final raw in parts) {
      final p0 = raw.trim();
      if (p0.isEmpty) continue;
      final pLower = p0.toLowerCase();
      if (pLower == 'pk' || pLower == 'primary key' || pLower == 'primarykey') {
        primaryKey = true;
        nullable = false;
      } else if (pLower == 'not null' || pLower == 'notnull') {
        nullable = false;
      } else if (pLower == 'null' || pLower == 'nullable') {
        // Explicit — redundant since nullable defaults to true, but harmless.
        nullable = true;
      } else if (pLower == 'unique' ||
          pLower == 'increment' ||
          pLower.startsWith('default:')) {
        // Tolerated but not used by the model layer.
      } else {
        final noteMatch =
            RegExp(r"^note:\s*'((?:[^'\\]|\\.)*)'\s*$", caseSensitive: false)
                .firstMatch(p0);
        if (noteMatch != null) {
          note = _unescape(noteMatch.group(1)!);
          continue;
        }
        final refMatch = RegExp(
          r'^ref:\s*(?:>|<|-)\s*"?([\w.]+)"?\.\s*"?(\w+)"?\s*$',
          caseSensitive: false,
        ).firstMatch(p0);
        if (refMatch != null) {
          inlineRef = _InlineRef(
            targetTable: _stripSchemaPrefix(refMatch.group(1)!),
            targetColumn: refMatch.group(2)!,
          );
          continue;
        }
        final enumMatch =
            RegExp(r'^enum:\s*"?(\w+)"?\s*$', caseSensitive: false)
                .firstMatch(p0);
        if (enumMatch != null) {
          inlineEnumName = enumMatch.group(1);
          continue;
        }
        // Unknown note — ignore.
      }
    }
  }
  // No notes block — `nullable` keeps its default `true`, which matches
  // DBML's actual semantics.

  return _ParsedColumn(
    name: name,
    rawType: type,
    primaryKey: primaryKey,
    nullable: nullable,
    note: note,
    inlineRef: inlineRef,
    inlineEnumName: inlineEnumName,
  );
}

/// Splits the bracketed `[a, b, note: 'x,y', ref: > t.c]` tail on commas
/// that are not inside a quoted string. A naive `split(',')` would shred
/// the `note: 'a, b'` form.
List<String> _splitNotes(String body) {
  final out = <String>[];
  final buf = StringBuffer();
  var inQuote = false;
  for (var i = 0; i < body.length; i++) {
    final c = body[i];
    if (c == "'" && (i == 0 || body[i - 1] != r'\')) {
      inQuote = !inQuote;
      buf.write(c);
      continue;
    }
    if (c == ',' && !inQuote) {
      out.add(buf.toString());
      buf.clear();
      continue;
    }
    buf.write(c);
  }
  if (buf.isNotEmpty) out.add(buf.toString());
  return out;
}

String _stripSchemaPrefix(String identifier) {
  final dot = identifier.lastIndexOf('.');
  return dot < 0 ? identifier : identifier.substring(dot + 1);
}

String _publicClassNameFor(String tableName, String prefix) {
  final pascal = tableName.toPascalCase();
  if (prefix.isEmpty) return pascal;
  if (pascal.startsWith(prefix)) return pascal;
  return '$prefix$pascal';
}

String _enumClassNameFor(String enumName) {
  final pascal = enumName.toPascalCase();
  if (pascal.endsWith('Enum')) return pascal;
  return '${pascal}Enum';
}

String _toDartIdentifier(String value) {
  var v = value.trim();
  if (v.isEmpty) return 'unknown';
  v = v.replaceAll(RegExp(r'[^A-Za-z0-9_]'), '_');
  if (RegExp(r'^[0-9]').hasMatch(v)) v = 'v$v';
  final camel = v.toCamelCase();
  // Dart reserved + contextual / built-in keywords that can't appear bare as
  // an enum value. Suffix with `_` so the generated source stays valid.
  // Source: dartlang.org/guides/language/language-tour#keywords.
  const reserved = {
    'abstract',
    'as',
    'assert',
    'async',
    'await',
    'base',
    'break',
    'case',
    'catch',
    'class',
    'const',
    'continue',
    'covariant',
    'default',
    'deferred',
    'do',
    'dynamic',
    'else',
    'enum',
    'export',
    'extends',
    'extension',
    'external',
    'factory',
    'false',
    'final',
    'finally',
    'for',
    'function',
    'get',
    'hide',
    'if',
    'implements',
    'import',
    'in',
    'interface',
    'is',
    'late',
    'library',
    'mixin',
    'new',
    'null',
    'of',
    'on',
    'operator',
    'part',
    'required',
    'rethrow',
    'return',
    'sealed',
    'set',
    'show',
    'static',
    'super',
    'switch',
    'sync',
    'this',
    'throw',
    'true',
    'try',
    'typedef',
    'var',
    'void',
    'when',
    'while',
    'with',
    'yield',
    'values',
    'index',
    'name',
    'hashCode',
    'runtimeType',
    'toString',
    'noSuchMethod',
  };
  return reserved.contains(camel) ? '${camel}_' : camel;
}

String _escape(String s) =>
    s.replaceAll(r'\', r'\\').replaceAll("'", r"\'").replaceAll('\n', ' ');

String _unescape(String s) => s.replaceAll(r"\'", "'").replaceAll(r'\\', r'\');
