// SQLite local feed cache. Mirrors a subset of ModelPost for offline
// display. Uses SQLite-native shapes: INTEGER-bool, epoch-ms DateTime,
// and TEXT-backed JSON for the embedded media list.

import 'dart:typed_data';

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import 'model_post.dart'; // for ModelMediaItem cross-dialect nesting

part '_model_feed_cache.g.dart';

@GenerateDartModel(
  schema: 'test',
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(
      fieldPath: ['id'],
      fieldType: 'SQLITE_integer-int',
      primaryKey: true,
    ),
    Field(fieldPath: ['post_id'], fieldType: 'SQLITE_text-String'),
    Field(fieldPath: ['author_id'], fieldType: 'SQLITE_text-String'),
    Field(
      fieldPath: ['caption'],
      fieldType: 'SQLITE_text-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['visibility'],
      fieldType: 'SQLITE_text-String',
      nullable: true,
    ),
    // Nested model (defined in model_post.dart) embedded as a JSON array
    // in SQLite — cross-dialect nesting in action.
    Field(
      fieldPath: ['media'],
      fieldType: 'SQLITE_json-List<ModelMediaItem>',
      nullable: true,
    ),
    Field(
      fieldPath: ['is_unread'],
      fieldType: 'SQLITE_integer-bool',
      nullable: true,
    ),
    Field(
      fieldPath: ['like_count'],
      fieldType: 'SQLITE_integer-int',
      nullable: true,
    ),
    Field(
      fieldPath: ['fetched_at'],
      fieldType: 'SQLITE_epochms-DateTime',
    ),
    Field(
      fieldPath: ['expires_at'],
      fieldType: 'SQLITE_epochms-DateTime',
      nullable: true,
    ),
    Field(
      fieldPath: ['preview_blob'],
      fieldType: 'SQLITE_blob-Uint8List',
      nullable: true,
    ),
  },
)
abstract class _ModelFeedCache extends Model {
  const _ModelFeedCache();
}
