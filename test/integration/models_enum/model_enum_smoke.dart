// Smoke test for enum detection without the legacy `Type`/`Enum` suffix.
// The extractor uses the analyzer to detect that `Visibility` is an enum and
// tags the resolved type with `@enum`, so the mapper routes it through the
// enum codegen path even though the class name doesn't end in `Type`.

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

part '_model_enum_smoke.g.dart';

// No `Type` / `Enum` suffix — relies on analyzer-driven detection.
enum Visibility { publicVis, friends, privateVis }

// Belt-and-braces: keep one suffix-style enum to verify the legacy pathway
// still works in parallel.
enum AccountStatusType { active, suspended, deleted }

@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['id'], fieldType: 'String', primaryKey: true),
    // Type-literal form — should be auto-tagged as @enum.
    Field(fieldPath: ['visibility'], fieldType: Visibility, nullable: true),
    // Legacy string form, suffix-driven.
    Field(
      fieldPath: ['status'],
      fieldType: 'AccountStatusType',
      nullable: true,
    ),
  },
)
abstract class _ModelEnumSmoke extends Model {
  const _ModelEnumSmoke();
}
