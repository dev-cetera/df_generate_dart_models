// PG profile with a nested jsonb settings blob. Demonstrates:
//   - 1:1 FK to ModelAccount
//   - PG_jsonb-ModelXxx for a single embedded model
//   - Two enums on a nested model

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '_enums.dart';
import 'model_account.dart';

part '_model_profile.g.dart';
part '_model_profile_settings.g.dart';

@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(
      fieldPath: ['default_visibility'],
      fieldType: 'PG_enum(post_visibility)-PostVisibilityType',
      nullable: true,
    ),
    Field(fieldPath: ['language'], fieldType: 'PG_text-String', nullable: true),
    Field(fieldPath: ['timezone'], fieldType: 'PG_text-String', nullable: true),
    Field(
      fieldPath: ['marketing_opt_in'],
      fieldType: 'PG_boolean-bool',
      nullable: true,
    ),
  },
)
abstract class _ModelProfileSettings extends Model {
  const _ModelProfileSettings();
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
      fieldPath: ['account_id'],
      fieldType: 'PG_uuid-String',
      foreignKey: true,
      references: ModelAccount,
    ),
    Field(
      fieldPath: ['display_name'],
      fieldType: 'PG_varchar(120)-String',
      nullable: true,
    ),
    Field(fieldPath: ['bio'], fieldType: 'PG_text-String', nullable: true),
    Field(
      fieldPath: ['avatar_url'],
      fieldType: 'PG_text-Uri',
      nullable: true,
    ),
    Field(
      fieldPath: ['settings'],
      fieldType: 'PG_jsonb-ModelProfileSettings',
      nullable: true,
    ),
    Field(fieldPath: ['created_at'], fieldType: 'PG_timestamptz-DateTime'),
    Field(fieldPath: ['updated_at'], fieldType: 'PG_timestamptz-DateTime'),
  },
)
abstract class _ModelProfile extends Model {
  const _ModelProfile();
}
