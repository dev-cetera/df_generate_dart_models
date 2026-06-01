// Firestore device-registration document. Uses FS_ prefix family.

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '_enums.dart';
import '../models/_fixtures.dart'
    show DocumentReference, GeoPoint, Timestamp, FieldValue;

part '_model_device_token.g.dart';

@GenerateDartModel(
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['id'], fieldType: String, primaryKey: true),
    Field(
      fieldPath: ['account_ref'],
      fieldType: 'FS_ref-String',
      foreignKey: true,
    ),
    Field(fieldPath: ['token'], fieldType: String),
    Field(
      fieldPath: ['kind'],
      fieldType: 'PG_enum(device_kind)-DeviceKindType',
      // PG_enum on a Firestore model is fine — it's just an annotation
      // signal for DBML. Runtime mapper falls through to the standard
      // enum-name round-trip.
    ),
    Field(
      fieldPath: ['locale'],
      fieldType: String,
      nullable: true,
      fallback: 'en',
    ),
    Field(
      fieldPath: ['lastSeenAt'],
      fieldType: 'FS_timestamp-DateTime',
      nullable: true,
    ),
    Field(
      fieldPath: ['createdAt'],
      fieldType: 'FS_server_timestamp-DateTime',
      nullable: true,
    ),
    Field(
      fieldPath: ['lastLocation'],
      fieldType: 'FS_geopoint-GeoPoint',
      nullable: true,
    ),
  },
)
abstract class _ModelDeviceToken extends Model {
  const _ModelDeviceToken();
}
