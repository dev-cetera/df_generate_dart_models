// Exercises plain (non-DB-dialect) envelope shapes that wrap nested typed
// children. Mirrors compledo's api_models like GetMeRes: a response container
// whose fields are typed nested Models, List<Model>, Map<String, Model>, etc.
//
// Goal: confirm the generator emits symmetric fromJson/toJson for these
// shapes without any dialect prefix (no PG_jsonb, no SQLITE_json, etc.).

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

part '_model_envelope_child.g.dart';
part '_model_envelope.g.dart';
part '_model_envelope_map_values.g.dart';

@GenerateDartModel(
  schema: 'test',
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['id'], fieldType: String),
    Field(fieldPath: ['label'], fieldType: String, nullable: true),
  },
)
abstract class _ModelEnvelopeChild extends Model {
  const _ModelEnvelopeChild();
}

@GenerateDartModel(
  schema: 'test',
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    // Single nested typed model. Uses a String literal because
    // ModelEnvelopeChild is a forward-referenced generated class — using the
    // Type literal would resolve to `dynamic` at annotation-parse time.
    Field(
      fieldPath: ['primary_child'],
      fieldType: 'ModelEnvelopeChild',
      nullable: true,
    ),
    // List of nested typed models — what GetMeRes.groups should look like.
    Field(
      fieldPath: ['children'],
      fieldType: 'List<ModelEnvelopeChild>',
      nullable: true,
    ),
    // Set of nested typed models.
    Field(
      fieldPath: ['unique_children'],
      fieldType: 'Set<ModelEnvelopeChild>',
      nullable: true,
    ),
    // Typed primitive collection (the common loose-typed gripe).
    Field(
      fieldPath: ['tags'],
      fieldType: 'List<String>',
      nullable: true,
    ),
    // Map keyed by id to nested typed model.
    Field(
      fieldPath: ['children_by_id'],
      fieldType: 'Map<String, ModelEnvelopeChild>',
      nullable: true,
    ),
  },
)
abstract class _ModelEnvelope extends Model {
  const _ModelEnvelope();
}

// Exercises typed map values that aren't Models (DateTime, int, etc.) since
// those also surface in compledo (e.g. GetItemsRes.tickedBy → Map<String, DateTime>).
@GenerateDartModel(
  schema: 'test',
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(
      fieldPath: ['ticked_by'],
      fieldType: 'Map<String, DateTime>',
      nullable: true,
    ),
    Field(
      fieldPath: ['counts'],
      fieldType: 'Map<String, int>',
      nullable: true,
    ),
  },
)
abstract class _ModelEnvelopeMapValues extends Model {
  const _ModelEnvelopeMapValues();
}
