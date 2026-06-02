// Smoke test for the dual-shape fieldPath:
//  - String form ('profile.id') — dot-separated, normalised to ['profile', 'id'].
//  - Iterable<String> form (['profile', 'avatar']) — used as-is.
// Both must produce deep null-aware accessors like `json?['profile']?['id']`.

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

part '_model_smoke.g.dart';

@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['id'], fieldType: 'String', primaryKey: true),
    Field(fieldPath: 'profile.id', fieldType: 'String', nullable: true),
    Field(
      fieldPath: ['profile', 'avatar'],
      fieldType: 'String',
      nullable: true,
    ),
    Field(
      fieldPath: 'profile.address.city',
      fieldType: 'String',
      nullable: true,
    ),
  },
)
abstract class _ModelSmoke extends Model {
  const _ModelSmoke();
}
