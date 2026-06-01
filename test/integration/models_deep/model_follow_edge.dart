// PG join table — directed follow edge between two accounts. Both FK
// columns reference ModelAccount.

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '_enums.dart';
import 'model_account.dart';

part '_model_follow_edge.g.dart';

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
      fieldPath: ['follower_id'],
      fieldType: 'PG_uuid-String',
      foreignKey: true,
      references: ModelAccount,
    ),
    Field(
      fieldPath: ['followee_id'],
      fieldType: 'PG_uuid-String',
      foreignKey: true,
      references: ModelAccount,
    ),
    Field(
      fieldPath: ['status'],
      fieldType: 'PG_enum(follow_status)-FollowStatusType',
      nullable: true,
    ),
    Field(fieldPath: ['created_at'], fieldType: 'PG_timestamptz-DateTime'),
  },
)
abstract class _ModelFollowEdge extends Model {
  const _ModelFollowEdge();
}
