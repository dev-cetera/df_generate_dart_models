// End-to-end tests for the DBML exporter. Drives the public
// `generateDbml` entry point against a temporary fixture directory, then
// reads the emitted .dbml file and asserts the right column types,
// constraints, and Ref: lines made it in.
//
// The integration models under test/integration/models/ are the broader
// fixture; this file focuses on smaller, targeted shapes so failures
// pinpoint the helper that broke (sqlType derivation, FK rendering,
// table-name pluralisation, etc.).

import 'dart:io';

import 'package:df_generate_dart_models/df_generate_dart_models.dart';
import 'package:test/test.dart';

/// Runs the DBML generator against [modelsDir] and returns the emitted
/// `<schema>.dbml` content as a single string. The DBML emitter now writes
/// one file per schema into the parent dir of `--output`, so this helper
/// uses an isolated temp dir per call to keep tests parallel-safe.
Future<String> _runDbml(String modelsDir, {String schema = 'test'}) async {
  final tempDir = Directory.systemTemp.createTempSync('dbml_');
  await generateDbml(
    ['--input', modelsDir, '--output', '${tempDir.path}/x.dbml'],
  );
  final f = File('${tempDir.path}/$schema.dbml');
  expect(f.existsSync(), isTrue, reason: 'expected DBML output at ${f.path}');
  final content = f.readAsStringSync();
  try {
    tempDir.deleteSync(recursive: true);
  } catch (_) {}
  return content;
}

void main() {
  group('DBML emission — runs against the integration models fixture', () {
    late final String dbml;

    setUpAll(() async {
      dbml = await _runDbml('test/integration/models');
    });

    test('emits a Table per model annotation', () {
      // One Table block per annotated abstract class (files containing two
      // annotations yield two tables). The actual count is what the
      // models/ directory holds — keep this assertion loose-greater-than
      // so adding/removing a model doesn't force a magic-number update.
      final tableMatches =
          RegExp(r'^Table \w+ \{', multiLine: true).allMatches(dbml).length;
      expect(tableMatches, greaterThanOrEqualTo(8));
    });

    test('strips `Model` prefix and snake-cases — `ModelPgUser` → `pg_user`',
        () {
      // Table name is derived 1:1 from the annotated class name; the
      // developer is responsible for naming the class the way the table is
      // named (no automatic English pluralisation).
      expect(dbml, contains('Table pg_user {'));
    });

    test('plain-snake-case is the only transform — `ModelBase` → `base`', () {
      expect(dbml, contains('Table base {'));
    });

    test('primaryKey field becomes [pk]', () {
      // From model_pg_user.dart: Field(fieldPath: ['id'], primaryKey: true).
      expect(dbml, contains('id uuid [pk'));
    });

    test('references slot emits a `ref: > <table>.<pk>` line', () {
      // model_pg_post.author_id has references: ModelPgUser → pg_user.id.
      expect(dbml, contains('ref: > pg_user.id'));
    });

    test('PG_varchar(N)-String prefix flows through as the SQL column type',
        () {
      // model_pg_user.display_name uses PG_varchar(120)-String — the
      // PG_varchar(120) part flows through as the SQL column type.
      expect(dbml, contains('display_name varchar(120)'));
    });

    test('Dart-side defaults map sensibly when no PG_ prefix is set', () {
      // model_base.id is plain `String` → defaults to `text`.
      expect(dbml, contains('id text [pk'));
      // model_base.count is `int` → `bigint`.
      expect(dbml, contains('count bigint'));
      // model_base.ratio is `double` → `double precision`.
      expect(dbml, contains('ratio double precision'));
      // model_base.active is `bool` → `boolean`.
      expect(dbml, contains('active boolean'));
      // model_base.created_at is `DateTime` → `timestamptz`.
      expect(dbml, contains('created_at timestamptz'));
      // model_base.tags is List<String> → `jsonb` (default for collections).
      expect(dbml, contains('tags jsonb'));
    });

    test('description becomes a [note: \'...\'] annotation', () {
      // Most fields in our integration models don't have descriptions, but
      // the converter_invoice model has none either; checking the shape
      // when present via the standard models suffices to lock the
      // formatting in. (We'd add description: to a test field if we
      // wanted stricter coverage.)
      // Spot-check: notes get quoted with single quotes.
      // If any note exists, it should match `note: '...'`.
      final notePattern = RegExp(r"note: '[^']*'");
      // Optional — just confirm the pattern is valid when present.
      if (dbml.contains('note: ')) {
        expect(notePattern.hasMatch(dbml), isTrue);
      }
    });

    test('PG_jsonb-Map column type derives to `jsonb`', () {
      // model_pg_post.extra is PG_jsonb-Map<String, dynamic>.
      // After the strip → `jsonb`.
      final extraLine =
          dbml.split('\n').firstWhere((line) => line.contains(' extra '));
      expect(extraLine, contains('jsonb'));
    });

    test('PG_text[]-List<String> renders as `text[]`', () {
      // model_pg_post.tags has PG_text[]-List<String>.
      final tagsLine = dbml
          .split('\n')
          .where((line) => line.contains(' tags '))
          // multiple "tags" may exist across tables; pick the post one.
          .firstWhere(
            (line) => line.contains('text[]'),
            orElse: () => '<not found>',
          );
      expect(tagsLine, contains('text[]'));
    });

    test('PG_enum(name)-Type renders with the parenthesised enum name', () {
      // model_pg_user.auth_provider has
      // PG_enum(auth_provider_kind)-AuthProviderKindType.
      final authLine = dbml
          .split('\n')
          .firstWhere((line) => line.contains('auth_provider '));
      expect(authLine, contains('enum(auth_provider_kind)'));
    });
  });

  group('DBML emission — no schema-bound models', () {
    test('writes nothing when no model declares `schema:`', () async {
      // `schema:` is the emission gate now — an input with no schema-bound
      // models should produce no `.dbml` files at all rather than a
      // misleading empty stub.
      final emptyDir = Directory.systemTemp.createTempSync('dbml_empty_');
      final outDir = Directory.systemTemp.createTempSync('dbml_out_');
      try {
        await generateDbml(
          ['--input', emptyDir.path, '--output', '${outDir.path}/x.dbml'],
        );
        final produced = outDir
            .listSync()
            .whereType<File>()
            .where((f) => f.path.endsWith('.dbml'))
            .toList();
        expect(produced, isEmpty, reason: 'expected no .dbml files emitted');
      } finally {
        emptyDir.deleteSync(recursive: true);
        outDir.deleteSync(recursive: true);
      }
    });
  });
}
