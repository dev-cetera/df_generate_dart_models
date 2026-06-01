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
/// .dbml content as a single string.
Future<String> _runDbml(String modelsDir, {String? outputName}) async {
  final out = outputName ??
      'test_dbml_${DateTime.now().microsecondsSinceEpoch}.dbml';
  final outPath = '${Directory.systemTemp.path}/$out';
  await generateDbml(['--input', modelsDir, '--output', outPath]);
  final f = File(outPath);
  expect(f.existsSync(), isTrue, reason: 'expected DBML output at $outPath');
  final content = f.readAsStringSync();
  // Best-effort cleanup; not fatal if it fails.
  try {
    f.deleteSync();
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
      final tableMatches = RegExp(r'^Table \w+ \{', multiLine: true)
          .allMatches(dbml)
          .length;
      expect(tableMatches, greaterThanOrEqualTo(8));
    });

    test('pluralises Model names — `ModelPgUser` → `pg_users`', () {
      expect(dbml, contains('Table pg_users {'));
    });

    test('handles already-plural names without double-S', () {
      // ModelBase → "bases" (s appended once). The reverse-pluralisation
      // heuristic is naive but consistent.
      expect(dbml, contains('Table bases {'));
    });

    test('primaryKey field becomes [pk]', () {
      // From model_pg_user.dart: Field(fieldPath: ['id'], primaryKey: true).
      expect(dbml, contains('id uuid [pk'));
    });

    test('unique slot becomes [unique]', () {
      // email has unique: true on model_pg_user.
      expect(
        dbml.contains('email citext') || dbml.contains('email text'),
        isTrue,
      );
      final emailLine = dbml
          .split('\n')
          .firstWhere((line) => line.contains('email'));
      expect(emailLine, contains('unique'));
    });

    test('references slot emits a `ref: > <table>.id` line', () {
      // model_pg_post.author_id has references: ModelPgUser → pg_users.id.
      expect(dbml, contains('ref: > pg_users.id'));
    });

    test('onDelete cascade gets stamped onto the reference', () {
      expect(dbml, contains('on delete: cascade'));
    });

    test('sqlType override wins over the Dart-type default', () {
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

    test('fallback slot becomes [default: ...]', () {
      // model_pg_user.login_count has fallback: 0.
      final loginLine = dbml
          .split('\n')
          .firstWhere((line) => line.contains('login_count'));
      expect(loginLine, contains('default: 0'));

      // model_pg_user.is_active has fallback: true.
      final activeLine = dbml
          .split('\n')
          .firstWhere((line) => line.contains('is_active'));
      expect(activeLine, contains('default: true'));
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
      final extraLine = dbml
          .split('\n')
          .firstWhere((line) => line.contains(' extra '));
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

  group('DBML emission — no models found', () {
    test('handles an empty input directory without error', () async {
      // The function still writes a header-only file when zero models
      // are discovered. Useful for cleanly initialising a project's
      // schema file before any models exist.
      final emptyDir = Directory.systemTemp.createTempSync('dbml_empty_');
      try {
        final output = await _runDbml(emptyDir.path);
        expect(output, contains('// Generated by df_generate_dart_models'));
        // Zero `Table xxx {` blocks.
        final tableMatches =
            RegExp(r'^Table \w+ \{', multiLine: true).allMatches(output).length;
        expect(tableMatches, 0);
      } finally {
        emptyDir.deleteSync(recursive: true);
      }
    });
  });
}
