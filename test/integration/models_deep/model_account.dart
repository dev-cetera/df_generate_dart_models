// Postgres-backed account. Top-level entity referenced by Profile, Post,
// Comment, FollowEdge, etc. via `references: ModelAccount`.

import 'dart:typed_data';

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '_enums.dart';

part '_model_account.g.dart';

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
      fieldPath: ['email'],
      fieldType: 'PG_citext-String',
    ),
    Field(
      fieldPath: ['username'],
      fieldType: 'PG_varchar(64)-String',
    ),
    Field(
      fieldPath: ['password_hash'],
      fieldType: 'PG_bytea-Uint8List',
      nullable: true,
    ),
    Field(
      fieldPath: ['status'],
      fieldType: 'PG_enum(account_status)-AccountStatusType',
      nullable: true,
    ),
    Field(
      fieldPath: ['role'],
      fieldType: 'PG_enum(account_role)-AccountRoleType',
      nullable: true,
    ),
    Field(fieldPath: ['created_at'], fieldType: 'PG_timestamptz-DateTime'),
    Field(fieldPath: ['updated_at'], fieldType: 'PG_timestamptz-DateTime'),
    Field(
      fieldPath: ['deleted_at'],
      fieldType: 'PG_timestamptz-DateTime',
      nullable: true,
    ),
  },
)
abstract class _ModelAccount extends Model {
  const _ModelAccount();
}
