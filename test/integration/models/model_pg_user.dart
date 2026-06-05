// Postgres-flavored user. Exercises FieldTypes constants end-to-end —
// every fieldType is built from `FieldTypes.*` rather than a raw string
// literal, so a typo would surface as a compile error instead of a silent
// fallback to the default `text` column.

import 'dart:typed_data';

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '_fixtures.dart';

part '_model_pg_user.g.dart';

@GenerateDartModel(
  schema: 'test',
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(
      fieldPath: ['id'],
      fieldType: FieldTypes.pgUuid,
      primaryKey: true,
    ),
    Field(
      fieldPath: ['email'],
      fieldType: FieldTypes.pgCitext,
    ),
    Field(
      fieldPath: ['display_name'],
      fieldType: 'PG_varchar(120)-String', // parameterised — runtime helper
      nullable: true,
    ),
    Field(
      fieldPath: ['login_count'],
      fieldType: FieldTypes.pgBigint,
      nullable: true,
    ),
    Field(
      fieldPath: ['is_active'],
      fieldType: FieldTypes.pgBoolean,
      nullable: true,
    ),
    Field(
      fieldPath: ['avatar_bytes'],
      fieldType: FieldTypes.pgBytea,
      nullable: true,
    ),
    Field(
      fieldPath: ['auth_provider'],
      fieldType:
          'PG_enum(auth_provider_kind)-AuthProviderKindType', // parameterised
      nullable: true,
    ),
    Field(fieldPath: ['created_at'], fieldType: FieldTypes.pgTimestamptz),
    Field(fieldPath: ['updated_at'], fieldType: FieldTypes.pgTimestamptz),
  },
)
abstract class _ModelPgUser extends Model {
  const _ModelPgUser();
}
