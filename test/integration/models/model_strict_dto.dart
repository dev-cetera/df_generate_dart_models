// json_serializable-style DTO using STRICT- casts. The wire shape is under
// the user's control (e.g. internal API response) so direct casts are
// acceptable. Verifies:
//  - STRICT-String, STRICT-int (via num), STRICT-double, STRICT-bool
//  - STRICT-DateTime (direct DateTime.parse, no defensive chain)
//  - STRICT-Uri, STRICT-Uint8List (base64)
//  - STRICT-Model (cast to Map then nested fromJson)

import 'dart:typed_data';

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

part '_model_strict_dto.g.dart';

@GenerateDartModel(
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['id'], fieldType: 'STRICT-String', primaryKey: true),
    Field(fieldPath: ['name'], fieldType: 'STRICT-String'),
    Field(fieldPath: ['count'], fieldType: 'STRICT-int'),
    Field(fieldPath: ['ratio'], fieldType: 'STRICT-double', nullable: true),
    Field(fieldPath: ['active'], fieldType: 'STRICT-bool', nullable: true),
    Field(fieldPath: ['createdAt'], fieldType: 'STRICT-DateTime'),
    Field(fieldPath: ['homepage'], fieldType: 'STRICT-Uri', nullable: true),
    Field(
      fieldPath: ['avatar'],
      fieldType: 'STRICT-Uint8List',
      nullable: true,
    ),
  },
)
abstract class _ModelStrictDto extends Model {
  const _ModelStrictDto();
}
