import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '../model_user/model_user.dart';

part '_model_test.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  shouldInherit: true,
  fields: {
    Field(
      fieldPath: ['users'],
      fieldType: List<ModelUser>,
      nullable: true,
    ),
    Field(
      fieldPath: ['checks'],
      fieldType: List<int>,
      nullable: true,
    ),
    Field(
      fieldPath: ['random'],
      fieldType: Map<String, Map<dynamic, int>>,
      nullable: true,
    ),
  },
)
abstract class _ModelTest extends Model {
  const _ModelTest();
}
