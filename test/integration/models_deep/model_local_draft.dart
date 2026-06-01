// SQLite local-only draft post. Never goes to the server until publish;
// includes a TEXT-encoded JSON blob for the WIP media list.

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import 'model_post.dart'; // ModelMediaItem cross-dialect nesting

part '_model_local_draft.g.dart';

@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(
      fieldPath: ['id'],
      fieldType: 'SQLITE_integer-int',
      primaryKey: true,
    ),
    Field(
      fieldPath: ['caption'],
      fieldType: 'SQLITE_text-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['hashtags'],
      fieldType: 'SQLITE_json-List<String>',
      nullable: true,
    ),
    Field(
      fieldPath: ['media'],
      fieldType: 'SQLITE_json-List<ModelMediaItem>',
      nullable: true,
    ),
    Field(
      fieldPath: ['scheduled_for'],
      fieldType: 'SQLITE_epochms-DateTime',
      nullable: true,
    ),
    Field(
      fieldPath: ['is_dirty'],
      fieldType: 'SQLITE_integer-bool',
      nullable: true,
      fallback: true,
    ),
    Field(
      fieldPath: ['updated_at'],
      fieldType: 'SQLITE_epochms-DateTime',
    ),
  },
)
abstract class _ModelLocalDraft extends Model {
  const _ModelLocalDraft();
}
