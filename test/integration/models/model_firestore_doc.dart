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
  schema: 'test',
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['id'], fieldType: FieldTypes.string, primaryKey: true),
    Field(fieldPath: ['title'], fieldType: FieldTypes.string, nullable: true),
    Field(
      fieldPath: ['captured_at'],
      fieldType: FieldTypes.fsTimestamp,
      nullable: true,
    ),
    Field(
      fieldPath: ['createdAt'],
      fieldType: FieldTypes.fsServerTimestamp,
      nullable: true,
    ),
    Field(
      fieldPath: ['location'],
      fieldType: FieldTypes.fsGeopoint,
      nullable: true,
    ),
    Field(
      fieldPath: ['ownerRef'],
      fieldType: FieldTypes.fsRef,
      nullable: true,
    ),
    Field(
      fieldPath: ['thumbnail'],
      fieldType: FieldTypes.fsBlob,
      nullable: true,
    ),
    // Back-compat — bare Timestamp still resolves via DartFirestoreTypeMappers.
    Field(
      fieldPath: ['legacyStamp'],
      fieldType: FieldTypes.timestamp,
      nullable: true,
    ),
  },
)
abstract class _ModelFirestoreDoc extends Model {
  const _ModelFirestoreDoc();
}
