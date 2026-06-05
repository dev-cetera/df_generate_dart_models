// PG comment with two FKs (post + author) + self-referential parent_id
// for threaded replies.

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '_enums.dart';
import 'model_account.dart';
import 'model_post.dart';

part '_model_comment.g.dart';

@GenerateDartModel(
  schema: 'test',
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(
      fieldPath: ['id'],
      fieldType: 'PG_uuid-String',
      primaryKey: true,
    ),
    Field(
      fieldPath: ['post_id'],
      fieldType: 'PG_uuid-String',
      foreignKey: true,
      references: ModelPost,
    ),
    Field(
      fieldPath: ['author_id'],
      fieldType: 'PG_uuid-String',
      foreignKey: true,
      references: ModelAccount,
    ),
    Field(
      fieldPath: ['parent_id'],
      fieldType: 'PG_uuid-String',
      nullable: true,
      foreignKey: true,
      // Self-reference for threaded replies.
    ),
    Field(fieldPath: ['body'], fieldType: 'PG_text-String'),
    Field(
      fieldPath: ['status'],
      fieldType: 'PG_enum(comment_status)-CommentStatusType',
      nullable: true,
    ),
    Field(
      fieldPath: ['like_count'],
      fieldType: 'PG_integer-int',
      nullable: true,
    ),
    Field(fieldPath: ['created_at'], fieldType: 'PG_timestamptz-DateTime'),
    Field(fieldPath: ['updated_at'], fieldType: 'PG_timestamptz-DateTime'),
  },
)
abstract class _ModelComment extends Model {
  const _ModelComment();
}
