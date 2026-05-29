// Firestore-flavored document. Exercises:
//  - FS_timestamp-DateTime (Timestamp ↔ DateTime round-trip)
//  - FS_server_timestamp-DateTime (FieldValue.serverTimestamp on write)
//  - FS_geopoint-GeoPoint (pass-through)
//  - FS_ref-String (.path / DocumentReference conversion)
//  - FS_blob-Uint8List (Blob.bytes / Blob() conversion)
//  - Back-compat: bare Timestamp

import 'dart:typed_data';

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '_fixtures.dart';

part '_model_firestore_doc.g.dart';

@GenerateDartModel(
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['id'], fieldType: String, primaryKey: true),
    Field(fieldPath: ['title'], fieldType: String, nullable: true),
    Field(
      fieldPath: ['captured_at'],
      fieldType: 'FS_timestamp-DateTime',
      nullable: true,
    ),
    Field(
      fieldPath: ['createdAt'],
      fieldType: 'FS_server_timestamp-DateTime',
      nullable: true,
    ),
    Field(
      fieldPath: ['location'],
      fieldType: 'FS_geopoint-GeoPoint',
      nullable: true,
    ),
    Field(
      fieldPath: ['ownerRef'],
      fieldType: 'FS_ref-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['thumbnail'],
      fieldType: 'FS_blob-Uint8List',
      nullable: true,
    ),
    // Back-compat — bare Timestamp still resolves via DartFirestoreTypeMappers.
    Field(
      fieldPath: ['legacyStamp'],
      fieldType: 'Timestamp',
      nullable: true,
    ),
  },
)
abstract class _ModelFirestoreDoc extends Model {
  const _ModelFirestoreDoc();
}
