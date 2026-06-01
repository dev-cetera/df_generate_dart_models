// Postgres post that references the user via FK + carries an embedded
// metadata model as jsonb. Verifies:
//  - references: ModelPgUser (FK link)
//  - PG_jsonb-Map (decoded map / jsonEncode round-trip)
//  - PG_jsonb-ModelXxx (nested model inside jsonb)
//  - PG_text[]-List<String> (native PG array)
//  - onDelete behaviour metadata

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '_fixtures.dart';
import 'model_pg_user.dart';

part '_model_pg_post.g.dart';
part '_model_post_metadata.g.dart';

// A small inner model embedded as jsonb on the post.
@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['format'], fieldType: String),
    Field(fieldPath: ['word_count'], fieldType: int, nullable: true),
    Field(fieldPath: ['language'], fieldType: String, nullable: true),
  },
)
abstract class _ModelPostMetadata extends Model {
  const _ModelPostMetadata();
}

@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(
      fieldPath: ['id'],
      fieldType: 'PG_uuid-String',
      primaryKey: true,
    ),
    Field(
      fieldPath: ['author_id'],
      fieldType: 'PG_uuid-String',
      foreignKey: true,
      references: ModelPgUser,
    ),
    Field(
      fieldPath: ['title'],
      fieldType: 'PG_text-String',
    ),
    Field(
      fieldPath: ['body'],
      fieldType: 'PG_text-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['status'],
      fieldType: 'PG_enum(post_status_kind)-PostStatusKindType',
      nullable: true,
    ),
    // Native Postgres array of text — Dart-side List<String>.
    Field(
      fieldPath: ['tags'],
      fieldType: 'PG_text[]-List<String>',
      nullable: true,
    ),
    // Plain jsonb Map column.
    Field(
      fieldPath: ['extra'],
      fieldType: 'PG_jsonb-Map<String, dynamic>',
      nullable: true,
    ),
    // jsonb-wrapped nested model — exercises the model recursion path.
    Field(
      fieldPath: ['metadata'],
      fieldType: 'PG_jsonb-ModelPostMetadata',
      nullable: true,
    ),
    Field(fieldPath: ['created_at'], fieldType: 'PG_timestamptz-DateTime'),
    Field(fieldPath: ['updated_at'], fieldType: 'PG_timestamptz-DateTime'),
  },
)
abstract class _ModelPgPost extends Model {
  const _ModelPgPost();
}
