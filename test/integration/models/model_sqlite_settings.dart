// SQLite-flavored settings. Exercises:
//  - SQLITE_text-String, SQLITE_integer-int (DDL-only path)
//  - SQLITE_integer-bool (runtime: 0/1 round-trip)
//  - SQLITE_epochms-DateTime (runtime: epoch ms round-trip)
//  - SQLITE_text-DateTime (runtime: ISO 8601 round-trip)
//  - SQLITE_json-Map<String, dynamic> (TEXT-backed JSON column)
//  - SQLITE_blob-Uint8List (passes raw bytes)

import 'dart:typed_data';

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

part '_model_sqlite_settings.g.dart';

@GenerateDartModel(
  schema: 'test',
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(
      fieldPath: ['id'],
      fieldType: FieldTypes.sqliteInteger,
      primaryKey: true,
    ),
    Field(fieldPath: ['user_id'], fieldType: FieldTypes.sqliteText),
    Field(
      fieldPath: ['notifications_enabled'],
      fieldType: FieldTypes.sqliteIntegerBool,
      nullable: true,
    ),
    Field(
      fieldPath: ['theme'],
      fieldType: FieldTypes.sqliteText,
      nullable: true,
    ),
    Field(
      fieldPath: ['last_synced_at'],
      fieldType: FieldTypes.sqliteEpochms,
      nullable: true,
    ),
    Field(
      fieldPath: ['legacy_created_at'],
      fieldType: FieldTypes.sqliteTextDateTime,
      nullable: true,
    ),
    Field(
      fieldPath: ['preferences'],
      fieldType: FieldTypes.sqliteJsonMapStringDynamic,
      nullable: true,
    ),
    Field(
      fieldPath: ['avatar_cache'],
      fieldType: FieldTypes.sqliteBlob,
      nullable: true,
    ),
  },
)
abstract class _ModelSqliteSettings extends Model {
  const _ModelSqliteSettings();
}
