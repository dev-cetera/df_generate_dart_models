// Firestore notification document. Embeds an FS_timestamp DateTime plus
// the cross-dialect nested ModelMediaItem for rich notification previews.

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '_enums.dart';
import '../models/_fixtures.dart' show Timestamp, FieldValue, DocumentReference;
import 'model_post.dart' show ModelMediaItem;

part '_model_notification.g.dart';

@GenerateDartModel(
  schema: 'test',
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['id'], fieldType: String, primaryKey: true),
    Field(
      fieldPath: ['recipientRef'],
      fieldType: 'FS_ref-String',
      foreignKey: true,
    ),
    Field(
      fieldPath: ['actorRef'],
      fieldType: 'FS_ref-String',
      foreignKey: true,
      nullable: true,
    ),
    Field(
      fieldPath: ['kind'],
      fieldType: 'PG_enum(notification_kind)-NotificationKindType',
    ),
    Field(fieldPath: ['title'], fieldType: String),
    Field(fieldPath: ['body'], fieldType: String, nullable: true),
    Field(
      fieldPath: ['previewMedia'],
      // Cross-dialect: a Postgres-defined nested model embedded inside a
      // Firestore document as a plain Map. The FS-side serialisation here
      // just uses the standard nested-model mapper (Model.fromJson /
      // Model.toJson) — Firestore accepts the resulting Map natively.
      fieldType: 'ModelMediaItem',
      nullable: true,
    ),
    Field(
      fieldPath: ['readAt'],
      fieldType: 'FS_timestamp-DateTime',
      nullable: true,
    ),
    Field(
      fieldPath: ['createdAt'],
      fieldType: 'FS_server_timestamp-DateTime',
      nullable: true,
    ),
  },
)
abstract class _ModelNotification extends Model {
  const _ModelNotification();
}
