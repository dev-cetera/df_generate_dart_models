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

part of 'model_envelope.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelEnvelopeMapValues].
class ModelEnvelopeMapValues extends _ModelEnvelopeMapValues
    with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelEnvelopeMapValues';

  @override
  String get $className => CLASS_NAME;

  /// The database table name this model maps to, mirroring `tableName:` on
  /// the annotation. When the annotation omits `tableName:`, this is derived
  /// from the class name (Model prefix/suffix stripped, snake-cased) — no
  /// automatic pluralisation.
  static const tableName = 'envelope_map_values';

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [tickedBy, counts];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

  /// No description provided.
  final Map<String, DateTime>? tickedBy;

  /// No description provided.
  final Map<String, int>? counts;

  /// Constructs a new instance of [ModelEnvelopeMapValues]
  /// from optional and required parameters.
  const ModelEnvelopeMapValues({
    this.tickedBy,
    this.counts,
  });

  /// Construcs a new instance of [ModelEnvelopeMapValues],
  /// forcing all parameters to be optional.
  const ModelEnvelopeMapValues.optional({
    this.tickedBy,
    this.counts,
  });

  /// Constructs a new instance of [ModelEnvelopeMapValues],
  /// and asserts that all required parameters are not null.
  factory ModelEnvelopeMapValues.assertRequired({
    Map<String, DateTime>? tickedBy,
    Map<String, int>? counts,
  }) {
    return ModelEnvelopeMapValues(
      tickedBy: tickedBy,
      counts: counts,
    );
  }

  /// Constructs a new instance of [ModelEnvelopeMapValues],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelEnvelopeMapValues.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelEnvelopeMapValues.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeMapValues],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelEnvelopeMapValues? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [ModelEnvelopeMapValues],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelEnvelopeMapValues.of(
    ModelEnvelopeMapValues another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelEnvelopeMapValues.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeMapValues],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelEnvelopeMapValues? ofOrNull(
    ModelEnvelopeMapValues? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelEnvelopeMapValues],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelEnvelopeMapValues.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelEnvelopeMapValues.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeMapValues],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelEnvelopeMapValues? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelEnvelopeMapValues.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeMapValues],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelEnvelopeMapValues.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelEnvelopeMapValues.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeMapValues],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelEnvelopeMapValues? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final tickedBy = letMapOrNull<dynamic, dynamic>(json?['ticked_by'])
          ?.map(
            (p0, p1) => MapEntry(
              p0?.toString().trim().nullIfEmpty,
              () {
                final a = p1?.toString().trim().nullIfEmpty;
                return a != null ? DateTime.tryParse(a)?.toUtc() : null;
              }(),
            ),
          )
          .nonNulls
          .nullIfEmpty
          ?.unmodifiable;
      final counts = letMapOrNull<dynamic, dynamic>(json?['counts'])
          ?.map(
            (p0, p1) => MapEntry(
              p0?.toString().trim().nullIfEmpty,
              letIntOrNull(p1),
            ),
          )
          .nonNulls
          .nullIfEmpty
          ?.unmodifiable;
      return ModelEnvelopeMapValues(
        tickedBy: tickedBy,
        counts: counts,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeMapValues],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelEnvelopeMapValues.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelEnvelopeMapValues.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeMapValues],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelEnvelopeMapValues? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelEnvelopeMapValues.fromJsonOrNull(uri.queryParameters);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson({
    bool includeNulls = false,
  }) {
    try {
      final tickedBy0 = tickedBy
          ?.map(
            (p0, p1) => MapEntry(
              p0?.trim().nullIfEmpty,
              p1?.toUtc().toIso8601String(),
            ),
          )
          .nonNulls
          .nullIfEmpty;
      final counts0 = counts
          ?.map(
            (p0, p1) => MapEntry(
              p0?.trim().nullIfEmpty,
              p1,
            ),
          )
          .nonNulls
          .nullIfEmpty;
      final withNulls = {
        'ticked_by': tickedBy0,
        'counts': counts0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelEnvelopeMapValues.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [tickedBy] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Map<String, DateTime>? get tickedBy$ => tickedBy;

  /// Returns the value of the [counts] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Map<String, int>? get counts$ => counts;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelEnvelopeMapValuesFieldNames {
  /// The field name of [ModelEnvelopeMapValues.tickedBy].
  static const tickedBy = 'ticked_by';

  /// The field name of [ModelEnvelopeMapValues.counts].
  static const counts = 'counts';

  /// Every declared field-name constant in declaration order. Mirrors
  /// `enum.values` so consumers can iterate the schema without reflection.
  static const List<String> $values = [tickedBy, counts];

  /// The field marked `primaryKey: true`, or `null` if none was declared.
  static const String? $primaryKey = null;

  /// Foreign-key fields mapped to the referenced class name (as a String).
  /// Empty when no field uses `foreignKey:` / `references:`.
  static const Map<String, String> $foreignKeys = {};
}

extension ModelEnvelopeMapValuesX on ModelEnvelopeMapValues {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelEnvelopeMapValues mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelEnvelopeMapValues.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelEnvelopeMapValues copyWith({
    Map<String, DateTime>? tickedBy,
    Map<String, int>? counts,
  }) {
    return ModelEnvelopeMapValues.assertRequired(
      tickedBy: tickedBy ?? this.tickedBy,
      counts: counts ?? this.counts,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelEnvelopeMapValues copyWithout({
    bool tickedBy = true,
    bool counts = true,
  }) {
    return ModelEnvelopeMapValues.assertRequired(
      tickedBy: tickedBy ? this.tickedBy : null,
      counts: counts ? this.counts : null,
    );
  }
}
