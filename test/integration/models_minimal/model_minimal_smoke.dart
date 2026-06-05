// Smoke fixture for templates/minimal_v1.dart.md.
//
// The minimal template emits a stripped-down DTO with only field
// declarations, default + assertRequired-style constructor, copyWith,
// copyWithout, and bang-getters. No fromJson, no equality, no inheritance.
//
// This file exists so the integration suite can verify the minimal template
// keeps compiling against the current interpolator. Regenerate with:
//
//   dart run bin/df_generate_dart_models.dart \
//     -i test/integration/models_minimal \
//     -t templates/minimal_v1.dart.md

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

part '_model_minimal_smoke.g.dart';

@GenerateDartModel(
  fields: {
    Field(fieldPath: ['id'], fieldType: String),
    Field(fieldPath: ['label'], fieldType: String, nullable: true),
    Field(fieldPath: ['count'], fieldType: int, nullable: true),
    Field(fieldPath: ['active'], fieldType: bool),
    Field(fieldPath: ['tags'], fieldType: 'List<String>', nullable: true),
  },
)
// ignore: unused_element
abstract class _ModelMinimalSmoke {
  const _ModelMinimalSmoke();
}
