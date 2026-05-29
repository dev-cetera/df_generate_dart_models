// Postgres-flavored user. Exercises:
//  - DDL-only PG types (PG_text, PG_varchar(N), PG_citext, PG_uuid,
//    PG_bigint, PG_timestamptz, PG_boolean)
//  - Runtime-changing PG_bytea-Uint8List
//  - PG_enum(name)-XxxType with unknownEnumValue
//  - The schema-metadata slots (primaryKey, unique, sqlType, fallback)

import 'dart:typed_data';

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '_fixtures.dart';

part '_model_pg_user.g.dart';

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
      unique: true,
    ),
    Field(
      fieldPath: ['display_name'],
      fieldType: 'PG_varchar(120)-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['login_count'],
      fieldType: 'PG_bigint-int',
      nullable: true,
      fallback: 0,
    ),
    Field(
      fieldPath: ['is_active'],
      fieldType: 'PG_boolean-bool',
      nullable: true,
      fallback: true,
    ),
    Field(
      fieldPath: ['avatar_bytes'],
      fieldType: 'PG_bytea-Uint8List',
      nullable: true,
    ),
    Field(
      fieldPath: ['auth_provider'],
      fieldType: 'PG_enum(auth_provider_kind)-AuthProviderKindType',
      nullable: true,
      unknownEnumValue: AuthProviderKindType.unknown,
    ),
    Field(fieldPath: ['created_at'], fieldType: 'PG_timestamptz-DateTime'),
    Field(fieldPath: ['updated_at'], fieldType: 'PG_timestamptz-DateTime'),
  },
)
abstract class _ModelPgUser extends Model {
  const _ModelPgUser();
}
