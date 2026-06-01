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
        // ─── FS_ prefix family ──────────────────────────────────────────────
        // FS_timestamp-DateTime: convert Firestore Timestamp → DateTime.
        // Firestore stores ts in microsecond precision; .toDate() preserves
        // the moment but drops microseconds. UTC normalisation is explicit
        // so downstream comparisons are deterministic. `?.` short-circuits
        // the chain so we don't need the explicit null guard.
        r'^FS_timestamp-(DateTime)\??$': (e) {
          return 'letAsOrNull<Timestamp>(${e.name})?.toDate().toUtc()';
        },
        // FS_server_timestamp-DateTime: identical to FS_timestamp on read;
        // the divergence lives on the to-side (FieldValue.serverTimestamp).
        r'^FS_server_timestamp-(DateTime)\??$': (e) {
          return 'letAsOrNull<Timestamp>(${e.name})?.toDate().toUtc()';
        },
        // GeoPoint passes through (Firestore SDK returns it natively).
        r'^FS_geopoint-(GeoPoint)\??$': (e) {
          return 'letAsOrNull<GeoPoint>(${e.name})';
        },
        // DocumentReference → String path. `?.` short-circuits, then
        // fall back to a String coercion if the value wasn't a
        // DocumentReference (already-serialised path on the wire).
        r'^FS_ref-(String)\??$': (e) {
          return 'letAsOrNull<DocumentReference>(${e.name})?.path ?? ${e.name}?.toString().trim().nullIfEmpty';
        },
        // Blob (Firestore's binary type) → Uint8List. `?.` again, with
        // a fallback to direct Uint8List interpretation.
        r'^FS_blob-(Uint8List)\??$': (e) {
          return 'letAsOrNull<Blob>(${e.name})?.bytes ?? letAsOrNull<Uint8List>(${e.name})';
        },

        // ─── Back-compat: bare Timestamp ────────────────────────────────────
        // Still emitted for models that haven't migrated to the FS_ prefix
        // vocabulary. Read as native Timestamp; consumers call `.toDate()`
        // themselves. Strict cast — Firestore's SDK always returns Timestamp
        // natively for ts-typed columns.
        r'^(Timestamp)\??$': (e) {
          return 'letAsOrNull<Timestamp>(${e.name})';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<MapperEvent> get objectToMappers => newTypeMap({
        // ─── FS_ prefix family ──────────────────────────────────────────────
        // DateTime → Timestamp on write. Firestore's set/update accept
        // Timestamp.fromDate directly.
        r'^FS_timestamp-(DateTime)\??$': (e) {
          return '${e.name} != null ? Timestamp.fromDate(${e.name}!.toUtc()) : null';
        },
        // FieldValue.serverTimestamp() lets the server stamp the moment — the
        // local DateTime is discarded on write, replaced by the server's wall
        // clock. Use for createdAt/updatedAt fields where clock-skew matters.
        r'^FS_server_timestamp-(DateTime)\??$': (e) {
          return 'FieldValue.serverTimestamp()';
        },
        // GeoPoint passes through.
        r'^FS_geopoint-(GeoPoint)\??$': (e) {
          return '${e.name}';
        },
        // String path → DocumentReference is consumer's job at write time;
        // we just emit the path String. Repository code typically does
        // `firestore.doc(model.refPath)` before calling `set`.
        r'^FS_ref-(String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty';
        },
        // Uint8List → Blob (Firestore's typed binary wrapper).
        r'^FS_blob-(Uint8List)\??$': (e) {
          return '${e.name} != null ? Blob(${e.name}!) : null';
        },

        // ─── Back-compat: bare Timestamp ────────────────────────────────────
        // Pass through as-is — Firestore's `set`/`update` accept Timestamp
        // bound parameters natively.
        r'^(Timestamp)\??$': (e) {
          return '${e.name}';
        },
      });
}
