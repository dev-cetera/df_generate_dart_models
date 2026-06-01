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

/// Postgres-flavoured prefix vocabulary. Two flavours of entry live here:
///
/// 1. **Runtime-changing** — `PG_jsonb-*`, `PG_json-*`, `PG_bytea-*`, array
///    variants. The Dart-side serialization diverges from the JSON wire shape
///    (jsonEncode, raw bytes vs base64, native array binding), so these
///    entries do real work.
///
/// 2. **DDL-only** — `PG_text-String`, `PG_varchar-String`, `PG_integer-int`,
///    `PG_timestamptz-DateTime`, etc. Runtime mapper code is identical to
///    what [DartCoreTypeMappers] would emit for the bare Dart type; the
///    prefix exists purely to feed DBML/DDL emission downstream. These
///    entries delegate to the same coercive helpers Core uses.
///
/// Postgres column-type parameters (varchar(255), numeric(10,2)) and array
/// markers ([]) are tolerated via the regex tails `(?:\([^)]*\))?(?:\[\])?`.
/// The strip pass at [stripSpecialSyntaxFromFieldType] removes them from the
/// rendered field declaration; the mapper sees the unstripped form and lets
/// them pass through.
class DartPostgresTypeMappers extends TypeMappers {
  //
  //
  //

  static final instance = DartPostgresTypeMappers._();

  //
  //
  //

  DartPostgresTypeMappers._();

  // Convenience: the optional `(...)` and `[]` suffixes a PG_ prefix word
  // may carry. Used inline in every regex so we don't have to think about
  // the exact backtracking each time.
  static const _pgTail = r'(?:\([^)]*\))?(?:\[\])?';

  //
  //
  //

  @override
  TTypeMappers<CollectionMapperEvent> get collectionFromMappers => newTypeMap({
        // jsonb / json — read as a Map regardless of whether the driver
        // returned a decoded Map or a JSON String. letMapOrNull handles
        // both shapes.
        r'^PG_(?:jsonb|json)' + _pgTail + r'-(Map)\??$': (e) {
          return 'letMapOrNull<dynamic, dynamic>(${e.name})?.map((${e.args}) => MapEntry(${e.hashes},),).nonNulls.nullIfEmpty?.unmodifiable';
        },
        // jsonb-encoded arrays-of-anything come back as List or as JSON
        // String — letListOrNull handles both.
        r'^PG_(?:jsonb|json)' + _pgTail + r'-(List)\??$': (e) {
          return 'letListOrNull<dynamic>(${e.name})?.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty?.toList().unmodifiable';
        },
        r'^PG_(?:jsonb|json)' + _pgTail + r'-(Set)\??$': (e) {
          return 'letSetOrNull<dynamic>(${e.name})?.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty?.toSet().unmodifiable';
        },
        // Native Postgres arrays — text[], int[], etc. The driver returns
        // these as already-typed Dart Lists; letListOrNull keeps them safe.
        r'^PG_\w+\[\]-(List)\??$': (e) {
          return 'letListOrNull<dynamic>(${e.name})?.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty?.toList().unmodifiable';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<CollectionMapperEvent> get collectionToMappers => newTypeMap({
        // jsonb to-side wraps the entire Map in jsonEncode so it can be bound
        // to a jsonb column parameter directly. postgres-package rejects
        // plain Maps for jsonb — they must arrive pre-serialised. We bind
        // ${e.name} into a local first because the template's `replaceFirst`
        // substitution only handles one `p0` placeholder per formula.
        r'^PG_(?:jsonb|json)' + _pgTail + r'-(Map)\??$': (e) {
          return '(){ final a = ${e.name}; return a != null ? jsonEncode(a.map((${e.args}) => MapEntry(${e.hashes},)).nonNulls.nullIfEmpty) : null; }()';
        },
        r'^PG_(?:jsonb|json)' + _pgTail + r'-(List|Set|Iterable|Queue)\??$':
            (e) {
          return '(){ final a = ${e.name}; return a != null ? jsonEncode(a.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty?.toList()) : null; }()';
        },
        // Native arrays — Dart List binds directly via package:postgres.
        r'^PG_\w+\[\]-(List|Set|Iterable|Queue)\??$': (e) {
          return '${e.name}?.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty?.toList()';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<MapperEvent> get objectFromMappers => newTypeMap({
        // ─── Runtime-changing ───────────────────────────────────────────────
        // jsonb / json paired with a nested Model: decode-or-pass-through Map,
        // then delegate to ModelXxx.fromJson.
        r'^PG_(?:jsonb|json)' + _pgTail + r'-(Model-?\w+|\w+-?Model)\??$': (e) {
          final typeName = e.matchGroups?.elementAt(1);
          return '() { final a = letMapOrNull<String, dynamic>(${e.name}); return a != null ? $typeName.fromJson(a): null; }()';
        },
        // bytea — driver gives Uint8List natively. No base64.
        r'^PG_bytea' + _pgTail + r'-(Uint8List)\??$': (e) {
          return 'letAsOrNull<Uint8List>(${e.name})';
        },
        // PG_enum(name)-XxxType — same as the bare enum mapper; the (name)
        // is captured by the DBML pipeline, not by the runtime. Matches the
        // legacy `Type`/`Enum`-suffixed forms AND the analyzer-tagged
        // `<Name>@enum` sentinel, so enum-shaped fields work regardless of
        // class-name suffix.
        r'^PG_enum' +
                _pgTail +
                r'-(?:(Type-?\w+|\w+-?Type|Enum-?\w+|\w+-?Enum)|(\w+)@enum)\??$':
            (e) {
          final typeName = (e.matchGroups?.elementAt(1)) ??
              (e.matchGroups?.elementAt(2));
          return '$typeName.values.valueOf(${e.name}?.toString())';
        },

        // ─── DDL-only ───────────────────────────────────────────────────────
        // All of these forward to the same code [DartCoreTypeMappers] uses
        // for the bare Dart type. The prefix only exists for schema export.
        r'^PG_(?:text|varchar|char|citext|name|xml|uuid|inet|cidr|macaddr|macaddr8|tsvector|tsquery|money|pg_lsn|bit|oid)'
                + _pgTail +
                r'-(String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty';
        },
        r'^PG_(?:smallint|integer|bigint|int2|int4|int8|smallserial|serial|bigserial)'
                + _pgTail +
                r'-(int)\??$': (e) {
          return 'letIntOrNull(${e.name})';
        },
        r'^PG_(?:real|float4|float8|double)' + _pgTail + r'-(double)\??$': (e) {
          return 'letDoubleOrNull(${e.name})';
        },
        // numeric paired with String keeps full precision; paired with double
        // is the lossy convenience form.
        r'^PG_numeric' + _pgTail + r'-(String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty';
        },
        r'^PG_numeric' + _pgTail + r'-(double)\??$': (e) {
          return 'letDoubleOrNull(${e.name})';
        },
        r'^PG_boolean' + _pgTail + r'-(bool)\??$': (e) {
          return 'letBoolOrNull(${e.name})';
        },
        r'^PG_(?:timestamp|timestamptz|date)' +
                _pgTail +
                r'-(DateTime)\??$': (e) {
          return '(){ final a = ${e.name}?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }()';
        },
        r'^PG_interval' + _pgTail + r'-(Duration)\??$': (e) {
          return '(){ final a = letAsOrNull<int>(${e.name}); return a != null ? Duration(microseconds: a): null; }()';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<MapperEvent> get objectToMappers => newTypeMap({
        // ─── Runtime-changing ───────────────────────────────────────────────
        // jsonb / json with a nested Model: nested.toJson() then jsonEncode
        // the result for the bind parameter.
        r'^PG_(?:jsonb|json)' + _pgTail + r'-(Model-?\w+|\w+-?Model)\??$': (e) {
          return '${e.name} != null ? jsonEncode(${e.name}!.toJson()) : null';
        },
        // bytea — postgres-package binds Uint8List directly, no base64.
        r'^PG_bytea' + _pgTail + r'-(Uint8List)\??$': (e) {
          return '${e.name}';
        },
        // PG_enum(name) — name comparable to the bare enum mapper. Same
        // legacy + `@enum` sentinel handling as the from-side.
        r'^PG_enum' +
                _pgTail +
                r'-(?:(Type-?\w+|\w+-?Type|Enum-?\w+|\w+-?Enum)|(\w+)@enum)\??$':
            (e) {
          return '${e.name}?.name';
        },

        // ─── DDL-only — same code Core emits for the bare type ───────────
        r'^PG_(?:text|varchar|char|citext|name|xml|uuid|inet|cidr|macaddr|macaddr8|tsvector|tsquery|money|pg_lsn|bit|oid)'
                + _pgTail +
                r'-(String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty';
        },
        r'^PG_(?:smallint|integer|bigint|int2|int4|int8|smallserial|serial|bigserial|real|float4|float8|double|boolean)'
                + _pgTail +
                r'-(int|double|bool)\??$': (e) {
          return '${e.name}';
        },
        r'^PG_numeric' + _pgTail + r'-(String|double)\??$': (e) {
          return '${e.name}';
        },
        r'^PG_(?:timestamp|timestamptz|date)' +
                _pgTail +
                r'-(DateTime)\??$': (e) {
          return '${e.name}?.toUtc().toIso8601String()';
        },
        r'^PG_interval' + _pgTail + r'-(Duration)\??$': (e) {
          return '${e.name}?.inMicroseconds';
        },
      });
}
