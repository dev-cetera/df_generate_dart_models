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

/// Generated class for [_ModelMediaDetails].
class ModelMediaDetails extends _ModelMediaDetails with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelMediaDetails';

  @override
  String get $className => CLASS_NAME;

  /// The database table name this model maps to, mirroring `tableName:` on
  /// the annotation. When the annotation omits `tableName:`, this is derived
  /// from the class name (Model prefix/suffix stripped, snake-cased) — no
  /// automatic pluralisation.
  static const tableName = 'media_details';

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [mime, byteSize, durationMs, dimensions, altText];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

  /// No description provided.
  final String? mime;

  /// No description provided.
  final int? byteSize;

  /// No description provided.
  final int? durationMs;

  /// No description provided.
  final ModelDimensions? dimensions;

  /// No description provided.
  final String? altText;

  /// Constructs a new instance of [ModelMediaDetails]
  /// from optional and required parameters.
  const ModelMediaDetails({
    required this.mime,
    this.byteSize,
    this.durationMs,
    this.dimensions,
    this.altText,
  });

  /// Construcs a new instance of [ModelMediaDetails],
  /// forcing all parameters to be optional.
  const ModelMediaDetails.optional({
    this.mime,
    this.byteSize,
    this.durationMs,
    this.dimensions,
    this.altText,
  });

  /// Constructs a new instance of [ModelMediaDetails],
  /// and asserts that all required parameters are not null.
  factory ModelMediaDetails.assertRequired({
    String? mime,
    int? byteSize,
    int? durationMs,
    ModelDimensions? dimensions,
    String? altText,
  }) {
    assert(mime != null);

    return ModelMediaDetails(
      mime: mime,
      byteSize: byteSize,
      durationMs: durationMs,
      dimensions: dimensions,
      altText: altText,
    );
  }

  /// Constructs a new instance of [ModelMediaDetails],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelMediaDetails.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelMediaDetails.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelMediaDetails],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelMediaDetails? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [ModelMediaDetails],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelMediaDetails.of(
    ModelMediaDetails another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelMediaDetails.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelMediaDetails],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelMediaDetails? ofOrNull(
    ModelMediaDetails? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelMediaDetails],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelMediaDetails.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelMediaDetails.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelMediaDetails],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelMediaDetails? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelMediaDetails.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelMediaDetails],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelMediaDetails.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelMediaDetails.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelMediaDetails],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelMediaDetails? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final mime = json?['mime']?.toString().trim().nullIfEmpty;
      final byteSize = letIntOrNull(json?['byte_size']);
      final durationMs = letIntOrNull(json?['duration_ms']);
      final dimensions = () {
        final a = letMapOrNull<String, dynamic>(json?['dimensions']);
        return a != null ? ModelDimensions.fromJson(a) : null;
      }();
      final altText = json?['alt_text']?.toString().trim().nullIfEmpty;
      return ModelMediaDetails(
        mime: mime,
        byteSize: byteSize,
        durationMs: durationMs,
        dimensions: dimensions,
        altText: altText,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelMediaDetails],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelMediaDetails.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelMediaDetails.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelMediaDetails],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelMediaDetails? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelMediaDetails.fromJsonOrNull(uri.queryParameters);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson({
    bool includeNulls = false,
  }) {
    try {
      final mime0 = mime?.trim().nullIfEmpty;
      final byteSize0 = byteSize;
      final durationMs0 = durationMs;
      final dimensions0 =
          dimensions != null ? jsonEncode(dimensions!.toJson()) : null;
      final altText0 = altText?.trim().nullIfEmpty;
      final withNulls = {
        'mime': mime0,
        'duration_ms': durationMs0,
        'dimensions': dimensions0,
        'byte_size': byteSize0,
        'alt_text': altText0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelMediaDetails.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [mime] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String get mime$ => mime!;

  /// Returns the value of the [byteSize] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  int? get byteSize$ => byteSize;

  /// Returns the value of the [durationMs] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  int? get durationMs$ => durationMs;

  /// Returns the value of the [dimensions] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  ModelDimensions? get dimensions$ => dimensions;

  /// Returns the value of the [altText] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get altText$ => altText;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelMediaDetailsFieldNames {
  /// The field name of [ModelMediaDetails.mime].
  static const mime = 'mime';

  /// The field name of [ModelMediaDetails.byteSize].
  static const byteSize = 'byte_size';

  /// The field name of [ModelMediaDetails.durationMs].
  static const durationMs = 'duration_ms';

  /// The field name of [ModelMediaDetails.dimensions].
  static const dimensions = 'dimensions';

  /// The field name of [ModelMediaDetails.altText].
  static const altText = 'alt_text';

  /// Every declared field-name constant in declaration order. Mirrors
  /// `enum.values` so consumers can iterate the schema without reflection.
  static const List<String> $values = [
    mime,
    byteSize,
    durationMs,
    dimensions,
    altText
  ];

  /// The field marked `primaryKey: true`, or `null` if none was declared.
  static const String? $primaryKey = null;

  /// Foreign-key fields mapped to the referenced class name (as a String).
  /// Empty when no field uses `foreignKey:` / `references:`.
  static const Map<String, String> $foreignKeys = {};
}

extension ModelMediaDetailsX on ModelMediaDetails {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelMediaDetails mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelMediaDetails.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelMediaDetails copyWith({
    String? mime,
    int? byteSize,
    int? durationMs,
    ModelDimensions? dimensions,
    String? altText,
  }) {
    return ModelMediaDetails.assertRequired(
      mime: mime ?? this.mime,
      byteSize: byteSize ?? this.byteSize,
      durationMs: durationMs ?? this.durationMs,
      dimensions: dimensions ?? this.dimensions,
      altText: altText ?? this.altText,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelMediaDetails copyWithout({
    bool mime = true,
    bool byteSize = true,
    bool durationMs = true,
    bool dimensions = true,
    bool altText = true,
  }) {
    return ModelMediaDetails.assertRequired(
      mime: mime ? this.mime : null,
      byteSize: byteSize ? this.byteSize : null,
      durationMs: durationMs ? this.durationMs : null,
      dimensions: dimensions ? this.dimensions : null,
      altText: altText ? this.altText : null,
    );
  }
}
