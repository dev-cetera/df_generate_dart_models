// Manual fixture for verifying df_generate_dart_models output.
// Covers every entry in DartLooseTypeMappers.

import 'dart:collection' show Queue;
import 'dart:typed_data' show Uint8List;

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '../model_user/model_user.dart';

part '_model_all_types.g.dart';

// Stubs so generated code references real symbols. Bodies are irrelevant —
// we only inspect the generated *.g.dart, not run it.
class Color {
  const Color(int value);
  int toARGB32() => 0;
}

class Timestamp {
  const Timestamp();
}

class Offset {
  const Offset(this.dx, this.dy);
  final double dx;
  final double dy;
}

class Size {
  const Size(this.width, this.height);
  final double width;
  final double height;
}

class Rect {
  const Rect.fromLTRB(this.left, this.top, this.right, this.bottom);
  final double left;
  final double top;
  final double right;
  final double bottom;
}

class EdgeInsets {
  const EdgeInsets.fromLTRB(this.left, this.top, this.right, this.bottom);
  final double left;
  final double top;
  final double right;
  final double bottom;
}

class Alignment {
  const Alignment(this.x, this.y);
  final double x;
  final double y;
}

class Radius {
  const Radius.elliptical(this.x, this.y);
  final double x;
  final double y;
}

enum ColorEnum { red, green, blue }

class PaymentModel {
  const PaymentModel();
  static PaymentModel fromJson(Map<String, dynamic> json) =>
      const PaymentModel();
  Map<String, dynamic> toJson() => const {};
}

@GenerateDartModel(
  shouldInherit: true,
  fields: {
    // Standard primitives.
    Field(fieldPath: ['anyValue'], fieldType: dynamic, nullable: true),
    Field(fieldPath: ['name'], fieldType: String, nullable: true),
    Field(fieldPath: ['active'], fieldType: bool, nullable: true),
    Field(fieldPath: ['count'], fieldType: int, nullable: true),
    Field(fieldPath: ['ratio'], fieldType: double, nullable: true),
    Field(fieldPath: ['amount'], fieldType: num, nullable: true),

    // Date / time / duration / uri / color / timestamp.
    Field(fieldPath: ['createdAt'], fieldType: DateTime, nullable: true),
    Field(fieldPath: ['interval'], fieldType: Duration, nullable: true),
    Field(fieldPath: ['homepage'], fieldType: Uri, nullable: true),
    Field(fieldPath: ['themeColor'], fieldType: 'Color', nullable: true),
    Field(fieldPath: ['stamp'], fieldType: 'Timestamp', nullable: true),

    // DataRefModel.
    Field(fieldPath: ['ownerRef'], fieldType: DataRef, nullable: true),

    // Type / Model / Enum suffix patterns.
    Field(fieldPath: ['payment'], fieldType: 'PaymentModel', nullable: true),
    Field(fieldPath: ['shade'], fieldType: 'ColorEnum', nullable: true),

    // Tier 1 — Dart stdlib.
    Field(fieldPath: ['bigCount'], fieldType: BigInt, nullable: true),
    Field(fieldPath: ['blob'], fieldType: Uint8List, nullable: true),
    Field(fieldPath: ['regex'], fieldType: RegExp, nullable: true),

    // Tier 2 — Flutter geometry.
    Field(fieldPath: ['origin'], fieldType: 'Offset', nullable: true),
    Field(fieldPath: ['canvasSize'], fieldType: 'Size', nullable: true),
    Field(fieldPath: ['bounds'], fieldType: 'Rect', nullable: true),
    Field(fieldPath: ['padding'], fieldType: 'EdgeInsets', nullable: true),
    Field(fieldPath: ['anchor'], fieldType: 'Alignment', nullable: true),
    Field(fieldPath: ['corner'], fieldType: 'Radius', nullable: true),

    // Special string-case types — base.
    Field(fieldPath: ['trimmed'], fieldType: 'Trimmed-String', nullable: true),
    Field(
      fieldPath: ['noSpaces'],
      fieldType: 'NoSpaces-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['searchable'],
      fieldType: 'Searchable-String',
      nullable: true,
    ),

    // Non-trimmed case conversions.
    Field(fieldPath: ['lower'], fieldType: 'LowerCase-String', nullable: true),
    Field(fieldPath: ['upper'], fieldType: 'UpperCase-String', nullable: true),
    Field(
      fieldPath: ['lowerSnake'],
      fieldType: 'LowerSnakeCase-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['upperSnake'],
      fieldType: 'UpperSnakeCase-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['lowerKebab'],
      fieldType: 'LowerKebabCase-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['upperKebab'],
      fieldType: 'UpperKebabCase-String',
      nullable: true,
    ),
    Field(fieldPath: ['camel'], fieldType: 'CamelCase-String', nullable: true),
    Field(
      fieldPath: ['pascal'],
      fieldType: 'PascalCase-String',
      nullable: true,
    ),

    // Trimmed case conversions.
    Field(
      fieldPath: ['tLower'],
      fieldType: 'TrimmedLowerCase-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['tUpper'],
      fieldType: 'TrimmedUpperCase-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['tLowerSnake'],
      fieldType: 'TrimmedLowerSnakeCase-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['tUpperSnake'],
      fieldType: 'TrimmedUpperSnakeCase-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['tLowerKebab'],
      fieldType: 'TrimmedLowerKebabCase-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['tUpperKebab'],
      fieldType: 'TrimmedUpperKebabCase-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['tCamel'],
      fieldType: 'TrimmedCamelCase-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['tPascal'],
      fieldType: 'TrimmedPascalCase-String',
      nullable: true,
    ),

    // Collections of standard primitives.
    Field(fieldPath: ['tags'], fieldType: List<String>, nullable: true),
    Field(fieldPath: ['flags'], fieldType: Set<bool>, nullable: true),
    Field(fieldPath: ['scores'], fieldType: Iterable<int>, nullable: true),
    Field(
      fieldPath: ['lookup'],
      fieldType: Map<String, double>,
      nullable: true,
    ),

    // Queue (from-side was missing — verifies the asymmetry fix).
    Field(fieldPath: ['todo'], fieldType: Queue<String>, nullable: true),

    // Nested collections (deep nesting to exercise recursion).
    Field(fieldPath: ['matrix'], fieldType: List<List<int>>, nullable: true),
    Field(
      fieldPath: ['groupedColors'],
      fieldType: Map<String, List<int>>,
      nullable: true,
    ),
    Field(
      fieldPath: ['nestedMap'],
      fieldType: Map<String, Map<String, int>>,
      nullable: true,
    ),

    // Collection of cross-model references.
    Field(fieldPath: ['users'], fieldType: List<ModelUser>, nullable: true),

    // Map keyed by typed string (verifies key/value mapper composition).
    Field(
      fieldPath: ['localized'],
      fieldType: Map<String, String>,
      nullable: true,
    ),
  },
  description: 'Comprehensive fixture exercising every mapper.',
)
abstract class _ModelAllTypes extends Model {
  const _ModelAllTypes();
}
