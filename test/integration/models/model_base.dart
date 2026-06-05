// Exercises the bare Dart types via DartCoreTypeMappers (no PG/SQLITE/FS/
// STRICT prefixes). The primaryKey + foreignKey + nullable flags are
// represented but don't change runtime behavior on this side — they exist
// for DBML.

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

part '_model_base.g.dart';

@GenerateDartModel(
  schema: 'test',
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['id'], fieldType: String, primaryKey: true),
    Field(fieldPath: ['name'], fieldType: String),
    Field(fieldPath: ['count'], fieldType: int, nullable: true),
    Field(fieldPath: ['ratio'], fieldType: double, nullable: true),
    Field(fieldPath: ['active'], fieldType: bool, nullable: true),
    Field(fieldPath: ['created_at'], fieldType: DateTime, nullable: true),
    Field(fieldPath: ['homepage'], fieldType: Uri, nullable: true),
    Field(fieldPath: ['big'], fieldType: BigInt, nullable: true),
    Field(fieldPath: ['tags'], fieldType: List<String>, nullable: true),
    Field(
      fieldPath: ['metadata'],
      fieldType: Map<String, dynamic>,
      nullable: true,
    ),
  },
)
abstract class _ModelBase extends Model {
  const _ModelBase();
}
