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

/// Per-field opt-in mappers that emit json_serializable-style direct `as`
/// casts instead of the defensive `letOrNull` chain used by
/// [DartCoreTypeMappers]. Throws a `TypeError` on shape mismatch (caught by
/// the generated `fromJsonOrNull` try/catch and turned into a null model).
///
/// Use when the wire shape is under your own control (internal API responses,
/// generated test fixtures, fields whose schema you trust). The default loose
/// path stays in effect for everything not prefixed `STRICT-`.
///
/// Vocabulary mirrors the existing case-modifier pattern (`LowerCase-String`)
/// — hyphen between the prefix and the real Dart type. Examples:
///   STRICT-String          -> json?['k'] as String?
///   STRICT-int             -> (json?['k'] as num?)?.toInt()
///   STRICT-double          -> (json?['k'] as num?)?.toDouble()
///   STRICT-bool            -> json?['k'] as bool?
///   STRICT-DateTime        -> json?['k'] == null ? null : DateTime.parse(json?['k'] as String).toUtc()
///   STRICT-Uri             -> json?['k'] == null ? null : Uri.parse(json?['k'] as String)
///   STRICT-ModelXxx        -> `ModelXxx.fromJson(json?['k'] as Map<String, dynamic>?)`
///   STRICT-List`<T>`       -> `(json?['k'] as List?)?.cast<T>()`
///   STRICT-Map`<K, V>`     -> `(json?['k'] as Map?)?.cast<K, V>()`
class DartStrictTypeMappers extends TypeMappers {
  //
  //
  //

  static final instance = DartStrictTypeMappers._();

  //
  //
  //

  DartStrictTypeMappers._();

  //
  //
  //

  @override
  TTypeMappers<CollectionMapperEvent> get collectionFromMappers => newTypeMap({
        // Collections under the STRICT- prefix use `.cast<T>()` — the same
        // shape json_serializable emits. The hashes argument (the rendered
        // per-element mapper code) is built using strict mappers too via the
        // outer composition.
        r'^STRICT-(Map)\??$': (e) {
          return '(${e.name} as Map?)?.cast<${e.args}>()';
        },
        r'^STRICT-(List)\??$': (e) {
          return '(${e.name} as List?)?.cast<${e.args}>()';
        },
        r'^STRICT-(Set)\??$': (e) {
          return '(${e.name} as List?)?.cast<${e.args}>().toSet()';
        },
        r'^STRICT-(Iterable)\??$': (e) {
          return '(${e.name} as List?)?.cast<${e.args}>()';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<CollectionMapperEvent> get collectionToMappers => newTypeMap({
        // Pass-through; json_serializable's emitted toJson is `instance.field`
        // directly. The outer `withNulls`/`?expr` map literal handles null
        // omission, so we don't need to wrap.
        r'^STRICT-(Map|List|Set|Iterable)\??$': (e) {
          return '${e.name}';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<MapperEvent> get objectFromMappers => newTypeMap({
        r'^STRICT-(String)\??$': (e) {
          return '${e.name} as String?';
        },
        r'^STRICT-(bool)\??$': (e) {
          return '${e.name} as bool?';
        },
        r'^STRICT-(int)\??$': (e) {
          return '(${e.name} as num?)?.toInt()';
        },
        r'^STRICT-(double)\??$': (e) {
          return '(${e.name} as num?)?.toDouble()';
        },
        r'^STRICT-(num)\??$': (e) {
          return '${e.name} as num?';
        },
        r'^STRICT-(DateTime)\??$': (e) {
          return '${e.name} == null ? null : DateTime.parse(${e.name} as String).toUtc()';
        },
        r'^STRICT-(Uri)\??$': (e) {
          return '${e.name} == null ? null : Uri.parse(${e.name} as String)';
        },
        r'^STRICT-(BigInt)\??$': (e) {
          return '${e.name} == null ? null : BigInt.parse(${e.name} as String)';
        },
        r'^STRICT-(Uint8List)\??$': (e) {
          return '${e.name} == null ? null : base64Decode(${e.name} as String)';
        },
        // Nested model: cast the raw map then delegate to ModelXxx.fromJson.
        r'^STRICT-(Model-?\w+|\w+-?Model)\??$': (e) {
          final typeName = e.matchGroups?.elementAt(1);
          return '${e.name} == null ? null : $typeName.fromJson(${e.name} as Map<String, dynamic>)';
        },
        // Enum: still goes through valueOf to handle unknown values gracefully.
        // STRICT-ness on the wire-shape side is preserved by the `as String?`
        // cast — anything that isn't a String throws.
        r'^STRICT-(Type-?\w+|\w+-?Type)\??$': (e) {
          final typeName = e.matchGroups?.elementAt(1);
          return '$typeName.values.valueOf(${e.name} as String?)';
        },
        r'^STRICT-(Enum-?\w+|\w+-?Enum)\??$': (e) {
          final typeName = e.matchGroups?.elementAt(1);
          return '$typeName.values.valueOf(${e.name} as String?)';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<MapperEvent> get objectToMappers => newTypeMap({
        // Strict to-side: write the value with minimal processing. Mirrors
        // json_serializable which emits `instance.field` for primitives and
        // `instance.field.toIso8601String()` for DateTime.
        r'^STRICT-(String|bool|int|double|num)\??$': (e) {
          return '${e.name}';
        },
        r'^STRICT-(DateTime)\??$': (e) {
          return '${e.name}?.toUtc().toIso8601String()';
        },
        r'^STRICT-(Uri)\??$': (e) {
          return '${e.name}?.toString()';
        },
        r'^STRICT-(BigInt)\??$': (e) {
          return '${e.name}?.toString()';
        },
        r'^STRICT-(Uint8List)\??$': (e) {
          return '${e.name} != null ? base64Encode(${e.name}!) : null';
        },
        r'^STRICT-(Model-?\w+|\w+-?Model)\??$': (e) {
          return '${e.name}?.toJson()';
        },
        r'^STRICT-(Type-?\w+|\w+-?Type|Enum-?\w+|\w+-?Enum)\??$': (e) {
          return '${e.name}?.name';
        },
      });
}
