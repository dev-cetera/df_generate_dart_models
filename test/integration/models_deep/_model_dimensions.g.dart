//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/dev-cetera/df_generate_dart_models
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: annotate_overrides
// ignore_for_file: argument_type_not_assignable
// ignore_for_file: invalid_null_aware_operator
// ignore_for_file: overridden_fields
// ignore_for_file: require_trailing_commas
// ignore_for_file: unnecessary_non_null_assertion
// ignore_for_file: unnecessary_null_comparison
// ignore_for_file: unnecessary_question_mark

part of 'model_post.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelDimensions].
class ModelDimensions extends _ModelDimensions with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelDimensions';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [width, height, rotation];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final int? width;

  /// No description provided.
final int? height;

  /// No description provided.
final int? rotation;


  /// Constructs a new instance of [ModelDimensions]
  /// from optional and required parameters.
  const ModelDimensions({
    required this.width,
required this.height,
 this.rotation,
  }) ;

  /// Construcs a new instance of [ModelDimensions],
  /// forcing all parameters to be optional.
  const ModelDimensions.optional({
    this.width,
this.height,
this.rotation,
  }) ;


  /// Constructs a new instance of [ModelDimensions],
  /// and asserts that all required parameters are not null.
  factory ModelDimensions.assertRequired({
    int? width,
int? height,
int? rotation,
  }) {
    assert(width != null);
assert(height != null);

    return ModelDimensions(
      width: width,
height: height,
rotation: rotation,
    );
  }

  /// Constructs a new instance of [ModelDimensions],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelDimensions.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelDimensions.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelDimensions],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelDimensions? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }


  /// Constructs a new instance of [ModelDimensions],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelDimensions.of(
    ModelDimensions another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelDimensions.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelDimensions],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelDimensions? ofOrNull(
    ModelDimensions? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelDimensions],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelDimensions.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelDimensions.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelDimensions],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelDimensions? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelDimensions.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelDimensions],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelDimensions.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelDimensions.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelDimensions],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelDimensions? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final width = letIntOrNull(json?['width']);
final height = letIntOrNull(json?['height']);
final rotation = letIntOrNull(json?['rotation']);
      return ModelDimensions(
        width: width,
height: height,
rotation: rotation,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelDimensions],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelDimensions.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelDimensions.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelDimensions],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelDimensions? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelDimensions.fromJsonOrNull(uri.queryParameters);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson({
    bool includeNulls = false,
  }) {
    try {
      final width0 = width;
final height0 = height;
final rotation0 = rotation;
      final withNulls = {
        'width': width0,'rotation': rotation0,'height': height0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelDimensions.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [width] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
int get width$ => width!;

  /// Returns the value of the [height] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
int get height$ => height!;

  /// Returns the value of the [rotation] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
int? get rotation$ => rotation;

}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelDimensionsFieldNames {
    /// The field name of [ModelDimensions.width].
static const width = 'width';

  /// The field name of [ModelDimensions.height].
static const height = 'height';

  /// The field name of [ModelDimensions.rotation].
static const rotation = 'rotation';

}

extension ModelDimensionsX on ModelDimensions {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelDimensions mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelDimensions.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelDimensions copyWith({
    int? width,
int? height,
int? rotation,
  }) {
    return ModelDimensions.assertRequired(
      width: width ?? this.width,
height: height ?? this.height,
rotation: rotation ?? this.rotation,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelDimensions copyWithout({
    bool width = true,
bool height = true,
bool rotation = true,
  }) {
    return ModelDimensions.assertRequired(
      width: width ? this.width: null,
height: height ? this.height: null,
rotation: rotation ? this.rotation: null,
    );
  }
}