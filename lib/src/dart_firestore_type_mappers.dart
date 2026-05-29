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

/// Firestore-specific type mappers. Currently covers `cloud_firestore`'s
/// `Timestamp` only; future PG_/SQLITE_-style dialect families will live in
/// sibling classes (DartPostgresTypeMappers, DartSqliteTypeMappers, etc.) and
/// be composed alongside [DartCoreTypeMappers] at generation time.
///
/// Including this class only forces a transitive dependency on
/// `cloud_firestore` when a generated model actually uses `Timestamp` — the
/// regex matches by exact type code, so models that never mention Timestamp
/// pay nothing.
class DartFirestoreTypeMappers extends TypeMappers {
  //
  //
  //

  static final instance = DartFirestoreTypeMappers._();

  //
  //
  //

  DartFirestoreTypeMappers._();

  //
  //
  //

  @override
  TTypeMappers<CollectionMapperEvent> get collectionFromMappers =>
      newTypeMap({});

  //
  //
  //

  @override
  TTypeMappers<CollectionMapperEvent> get collectionToMappers =>
      newTypeMap({});

  //
  //
  //

  @override
  TTypeMappers<MapperEvent> get objectFromMappers => newTypeMap({
        // Read as native Timestamp; consumers can call `.toDate()` themselves
        // when they need a DateTime. Strict cast — Firestore's SDK always
        // returns Timestamp natively for ts-typed columns, so coercion isn't
        // needed.
        r'^(Timestamp)\??$': (e) {
          return 'letAsOrNull<Timestamp>(${e.name})';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<MapperEvent> get objectToMappers => newTypeMap({
        // Pass through as-is — Firestore's `set`/`update` accept Timestamp
        // bound parameters natively. No String coercion needed.
        r'^(Timestamp)\??$': (e) {
          return '${e.name}';
        },
      });
}
