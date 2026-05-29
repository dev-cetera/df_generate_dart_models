// Exercises the per-field `converter:` slot. The `total` field is read /
// written via the test MoneyConverter rather than any dialect mapper.
// The generated code should call `const MoneyConverter().fromJson(value)`
// and `const MoneyConverter().toJson(value)` directly.

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '_fixtures.dart';

part '_model_converter_invoice.g.dart';

@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['id'], fieldType: String, primaryKey: true),
    // Custom-typed field — bypasses every dialect mapper.
    Field(
      fieldPath: ['total'],
      fieldType: dynamic,
      nullable: true,
      converter: MoneyConverter,
    ),
    Field(fieldPath: ['note'], fieldType: String, nullable: true),
  },
)
abstract class _ModelConverterInvoice extends Model {
  const _ModelConverterInvoice();
}
