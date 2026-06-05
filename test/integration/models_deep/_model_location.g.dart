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

/// Generated class for [_ModelLocation].
class ModelLocation extends _ModelLocation with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelLocation';

  @override
  String get $className => CLASS_NAME;

  /// The database table name this model maps to, mirroring `tableName:` on
  /// the annotation. When the annotation omits `tableName:`, this is derived
  /// from the class name (Model prefix/suffix stripped, snake-cased) — no
  /// automatic pluralisation.
  static const tableName = 'location';

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [latitude, longitude, accuracyM, placeLabel];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

  /// No description provided.
  final double? latitude;

  /// No description provided.
  final double? longitude;

  /// No description provided.
  final double? accuracyM;

  /// No description provided.
  final String? placeLabel;

  /// Constructs a new instance of [ModelLocation]
  /// from optional and required parameters.
  const ModelLocation({
    required this.latitude,
    required this.longitude,
    this.accuracyM,
    this.placeLabel,
  });

  /// Construcs a new instance of [ModelLocation],
  /// forcing all parameters to be optional.
  const ModelLocation.optional({
    this.latitude,
    this.longitude,
    this.accuracyM,
    this.placeLabel,
  });

  /// Constructs a new instance of [ModelLocation],
  /// and asserts that all required parameters are not null.
  factory ModelLocation.assertRequired({
    double? latitude,
    double? longitude,
    double? accuracyM,
    String? placeLabel,
  }) {
    assert(latitude != null);
    assert(longitude != null);

    return ModelLocation(
      latitude: latitude,
      longitude: longitude,
      accuracyM: accuracyM,
      placeLabel: placeLabel,
    );
  }

  /// Constructs a new instance of [ModelLocation],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelLocation.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelLocation.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelLocation],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelLocation? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [ModelLocation],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelLocation.of(
    ModelLocation another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelLocation.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelLocation],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelLocation? ofOrNull(
    ModelLocation? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelLocation],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelLocation.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelLocation.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelLocation],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelLocation? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelLocation.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelLocation],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelLocation.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelLocation.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelLocation],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelLocation? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final latitude = letDoubleOrNull(json?['latitude']);
      final longitude = letDoubleOrNull(json?['longitude']);
      final accuracyM = letDoubleOrNull(json?['accuracy_m']);
      final placeLabel = json?['place_label']?.toString().trim().nullIfEmpty;
      return ModelLocation(
        latitude: latitude,
        longitude: longitude,
        accuracyM: accuracyM,
        placeLabel: placeLabel,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelLocation],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelLocation.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelLocation.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelLocation],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelLocation? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelLocation.fromJsonOrNull(uri.queryParameters);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson({
    bool includeNulls = false,
  }) {
    try {
      final latitude0 = latitude;
      final longitude0 = longitude;
      final accuracyM0 = accuracyM;
      final placeLabel0 = placeLabel?.trim().nullIfEmpty;
      final withNulls = {
        'place_label': placeLabel0,
        'longitude': longitude0,
        'latitude': latitude0,
        'accuracy_m': accuracyM0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelLocation.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [latitude] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double get latitude$ => latitude!;

  /// Returns the value of the [longitude] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double get longitude$ => longitude!;

  /// Returns the value of the [accuracyM] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double? get accuracyM$ => accuracyM;

  /// Returns the value of the [placeLabel] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get placeLabel$ => placeLabel;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelLocationFieldNames {
  /// The field name of [ModelLocation.latitude].
  static const latitude = 'latitude';

  /// The field name of [ModelLocation.longitude].
  static const longitude = 'longitude';

  /// The field name of [ModelLocation.accuracyM].
  static const accuracyM = 'accuracy_m';

  /// The field name of [ModelLocation.placeLabel].
  static const placeLabel = 'place_label';

  /// Every declared field-name constant in declaration order. Mirrors
  /// `enum.values` so consumers can iterate the schema without reflection.
  static const List<String> $values = [
    latitude,
    longitude,
    accuracyM,
    placeLabel
  ];

  /// The field marked `primaryKey: true`, or `null` if none was declared.
  static const String? $primaryKey = null;

  /// Foreign-key fields mapped to the referenced class name (as a String).
  /// Empty when no field uses `foreignKey:` / `references:`.
  static const Map<String, String> $foreignKeys = {};
}

extension ModelLocationX on ModelLocation {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelLocation mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelLocation.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelLocation copyWith({
    double? latitude,
    double? longitude,
    double? accuracyM,
    String? placeLabel,
  }) {
    return ModelLocation.assertRequired(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      accuracyM: accuracyM ?? this.accuracyM,
      placeLabel: placeLabel ?? this.placeLabel,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelLocation copyWithout({
    bool latitude = true,
    bool longitude = true,
    bool accuracyM = true,
    bool placeLabel = true,
  }) {
    return ModelLocation.assertRequired(
      latitude: latitude ? this.latitude : null,
      longitude: longitude ? this.longitude : null,
      accuracyM: accuracyM ? this.accuracyM : null,
      placeLabel: placeLabel ? this.placeLabel : null,
    );
  }
}
