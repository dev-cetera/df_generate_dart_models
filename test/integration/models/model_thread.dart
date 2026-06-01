// Verifies the more advanced composition cases:
//  - List of nested models stored in jsonb (PG_jsonb-List<ModelComment>)
//  - Map<String, dynamic> (jsonb)
//  - includeInJson / includeInSqlMap / includeInFirestoreMap slots
//  - equatable: false (opt-out, parallel to FieldModel's opt-out)

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import 'model_pg_user.dart';

part '_model_thread.g.dart';
part '_model_comment.g.dart';

@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['id'], fieldType: 'PG_uuid-String', primaryKey: true),
    Field(fieldPath: ['author_id'], fieldType: 'PG_uuid-String'),
    Field(fieldPath: ['body'], fieldType: 'PG_text-String'),
    Field(fieldPath: ['parent_id'], fieldType: 'PG_uuid-String', nullable: true),
    Field(fieldPath: ['created_at'], fieldType: 'PG_timestamptz-DateTime'),
  },
)
abstract class _ModelComment extends Model {
  const _ModelComment();
}

@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['id'], fieldType: 'PG_uuid-String', primaryKey: true),
    Field(
      fieldPath: ['creator_id'],
      fieldType: 'PG_uuid-String',
      foreignKey: true,
      references: ModelPgUser,
    ),
    Field(fieldPath: ['title'], fieldType: 'PG_text-String'),
    // List of comments embedded as a jsonb array.
    Field(
      fieldPath: ['comments'],
      fieldType: 'PG_jsonb-List<ModelComment>',
      nullable: true,
    ),
    // Wire-only field — excluded from the SQL bind path.
    Field(
      fieldPath: ['unread_count'],
      fieldType: int,
      nullable: true,
    ),
    // Internal cache — never serialised over JSON wire.
    Field(
      fieldPath: ['cache_token'],
      fieldType: String,
      nullable: true,
    ),
    Field(fieldPath: ['created_at'], fieldType: 'PG_timestamptz-DateTime'),
  },
)
abstract class _ModelThread extends Model {
  const _ModelThread();
}
