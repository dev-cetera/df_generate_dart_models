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

// ignore_for_file: always_declare_return_types

import 'package:df_gen_core/df_gen_core.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// SQLite-flavoured prefix vocabulary.
///
/// SQLite has only five storage classes (NULL, INTEGER, REAL, TEXT, BLOB) and
/// no native bool, DateTime, or JSON. Common conventions:
///
/// * bool → INTEGER 0/1
/// * DateTime → TEXT (ISO) or INTEGER (epoch s/ms)
/// * JSON → TEXT (decoded on read by `letMapOrNull` automatically)
/// * bytes → BLOB (Uint8List, no base64)
///
/// Runtime-changing entries cover the divergent cases; DDL-only ones delegate
/// to the same coercive helpers [DartCoreTypeMappers] uses for the bare Dart
/// type. The bool 0/1 handling is universal (it's baked into
/// [df_type/let_or_null.dart] since Phase 1), so even the bare
/// `SQLITE_integer-bool` mapper just forwards to `letBoolOrNull`.
class DartSqliteTypeMappers extends TypeMappers {
  //
  //
  //

  static final instance = DartSqliteTypeMappers._();

  //
  //
  //

  DartSqliteTypeMappers._();

  // SQLite types have no parenthesised size, but allow it for future-proofing
  // against affinities like `varchar(255)` written into the prefix.
  static const _sqliteTail = r'(?:\([^)]*\))?(?:\[\])?';

  //
  //
  //

  @override
  TTypeMappers<CollectionMapperEvent> get collectionFromMappers => newTypeMap({
        // JSON columns in SQLite are TEXT under the hood. letMapOrNull /
        // letListOrNull JSON-decode the TEXT automatically.
        r'^SQLITE_(?:json|jsonb)' + _sqliteTail + r'-(Map)\??$': (e) {
          return 'letMapOrNull<dynamic, dynamic>(${e.name})?.map((${e.args}) => MapEntry(${e.hashes},),).nonNulls.nullIfEmpty?.unmodifiable';
        },
        r'^SQLITE_(?:json|jsonb)' + _sqliteTail + r'-(List)\??$': (e) {
          return 'letListOrNull<dynamic>(${e.name})?.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty?.toList().unmodifiable';
        },
        r'^SQLITE_(?:json|jsonb)' + _sqliteTail + r'-(Set)\??$': (e) {
          return 'letSetOrNull<dynamic>(${e.name})?.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty?.toSet().unmodifiable';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<CollectionMapperEvent> get collectionToMappers => newTypeMap({
        // JSON columns get jsonEncode'd to a TEXT string for binding. Local
        // alias so the template substitution (replaceFirst on `p0`) doesn't
        // leave a stray placeholder in the second reference.
        r'^SQLITE_(?:json|jsonb)' + _sqliteTail + r'-(Map)\??$': (e) {
          return '(){ final a = ${e.name}; return a != null ? jsonEncode(a.map((${e.args}) => MapEntry(${e.hashes},)).nonNulls.nullIfEmpty) : null; }()';
        },
        r'^SQLITE_(?:json|jsonb)' +
            _sqliteTail +
            r'-(List|Set|Iterable|Queue)\??$': (e) {
          return '(){ final a = ${e.name}; return a != null ? jsonEncode(a.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty?.toList()) : null; }()';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<MapperEvent> get objectFromMappers => newTypeMap({
        // ─── Runtime-changing ───────────────────────────────────────────────
        // bool stored as INTEGER. letBoolOrNull handles 0/1 (Phase 1 fix).
        r'^SQLITE_integer' + _sqliteTail + r'-(bool)\??$': (e) {
          return 'letBoolOrNull(${e.name})';
        },
        // DateTime stored as INTEGER epoch seconds.
        r'^SQLITE_epochs' + _sqliteTail + r'-(DateTime)\??$': (e) {
          return '(){ final a = letIntOrNull(${e.name}); return a != null ? DateTime.fromMillisecondsSinceEpoch(a * 1000, isUtc: true) : null; }()';
        },
        // DateTime stored as INTEGER epoch milliseconds.
        r'^SQLITE_epochms' + _sqliteTail + r'-(DateTime)\??$': (e) {
          return '(){ final a = letIntOrNull(${e.name}); return a != null ? DateTime.fromMillisecondsSinceEpoch(a, isUtc: true) : null; }()';
        },
        // DateTime stored as REAL Julian day number.
        r'^SQLITE_julianday' + _sqliteTail + r'-(DateTime)\??$': (e) {
          return '(){ final a = letDoubleOrNull(${e.name}); return a != null ? DateTime.fromMillisecondsSinceEpoch(((a - 2440587.5) * 86400000).round(), isUtc: true) : null; }()';
        },
        // JSON column with a nested model — same shape as PG_jsonb.
        r'^SQLITE_(?:json|jsonb)' +
            _sqliteTail +
            r'-(Model-?\w+|\w+-?Model)\??$': (e) {
          final typeName = e.matchGroups?.elementAt(1);
          return '() { final a = letMapOrNull<String, dynamic>(${e.name}); return a != null ? $typeName.fromJson(a): null; }()';
        },

        // ─── DDL-only — forward to Core's behaviour for the bare type ────
        r'^SQLITE_(?:text|varchar|char|clob)' + _sqliteTail + r'-(String)\??$':
            (e) {
          return '${e.name}?.toString().trim().nullIfEmpty';
        },
        r'^SQLITE_integer' + _sqliteTail + r'-(int)\??$': (e) {
          return 'letIntOrNull(${e.name})';
        },
        r'^SQLITE_real' + _sqliteTail + r'-(double)\??$': (e) {
          return 'letDoubleOrNull(${e.name})';
        },
        r'^SQLITE_numeric' + _sqliteTail + r'-(String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty';
        },
        r'^SQLITE_numeric' + _sqliteTail + r'-(double)\??$': (e) {
          return 'letDoubleOrNull(${e.name})';
        },
        r'^SQLITE_blob' + _sqliteTail + r'-(Uint8List)\??$': (e) {
          return 'letAsOrNull<Uint8List>(${e.name})';
        },
        // ISO-string-encoded DateTime (the common default).
        r'^SQLITE_text' + _sqliteTail + r'-(DateTime)\??$': (e) {
          return '(){ final a = ${e.name}?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }()';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<MapperEvent> get objectToMappers => newTypeMap({
        // ─── Runtime-changing ───────────────────────────────────────────────
        r'^SQLITE_integer' + _sqliteTail + r'-(bool)\??$': (e) {
          return '${e.name} == null ? null : (${e.name}! ? 1 : 0)';
        },
        r'^SQLITE_epochs' + _sqliteTail + r'-(DateTime)\??$': (e) {
          return '${e.name} != null ? ${e.name}!.toUtc().millisecondsSinceEpoch ~/ 1000 : null';
        },
        r'^SQLITE_epochms' + _sqliteTail + r'-(DateTime)\??$': (e) {
          return '${e.name}?.toUtc().millisecondsSinceEpoch';
        },
        r'^SQLITE_julianday' + _sqliteTail + r'-(DateTime)\??$': (e) {
          return '${e.name} != null ? (${e.name}!.toUtc().millisecondsSinceEpoch / 86400000) + 2440587.5 : null';
        },
        r'^SQLITE_(?:json|jsonb)' +
            _sqliteTail +
            r'-(Model-?\w+|\w+-?Model)\??$': (e) {
          return '${e.name} != null ? jsonEncode(${e.name}!.toJson()) : null';
        },

        // ─── DDL-only ────────────────────────────────────────────────────
        r'^SQLITE_(?:text|varchar|char|clob)' + _sqliteTail + r'-(String)\??$':
            (e) {
          return '${e.name}?.trim().nullIfEmpty';
        },
        r'^SQLITE_integer' + _sqliteTail + r'-(int)\??$': (e) {
          return '${e.name}';
        },
        r'^SQLITE_real' + _sqliteTail + r'-(double)\??$': (e) {
          return '${e.name}';
        },
        r'^SQLITE_numeric' + _sqliteTail + r'-(String|double)\??$': (e) {
          return '${e.name}';
        },
        r'^SQLITE_blob' + _sqliteTail + r'-(Uint8List)\??$': (e) {
          return '${e.name}';
        },
        r'^SQLITE_text' + _sqliteTail + r'-(DateTime)\??$': (e) {
          return '${e.name}?.toUtc().toIso8601String()';
        },
      });
}
