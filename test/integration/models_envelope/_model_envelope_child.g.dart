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

/// Generated class for [_ModelEnvelopeChild].
class ModelEnvelopeChild extends _ModelEnvelopeChild with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelEnvelopeChild';

  @override
  String get $className => CLASS_NAME;

  /// The database table name this model maps to, mirroring `tableName:` on
  /// the annotation. When the annotation omits `tableName:`, this is derived
  /// from the class name (Model prefix/suffix stripped, snake-cased) — no
  /// automatic pluralisation.
  static const tableName = 'envelope_child';

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, label];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

  /// No description provided.
  final String? id;

  /// No description provided.
  final String? label;

  /// Constructs a new instance of [ModelEnvelopeChild]
  /// from optional and required parameters.
  const ModelEnvelopeChild({
    required this.id,
    this.label,
  });

  /// Construcs a new instance of [ModelEnvelopeChild],
  /// forcing all parameters to be optional.
  const ModelEnvelopeChild.optional({
    this.id,
    this.label,
  });

  /// Constructs a new instance of [ModelEnvelopeChild],
  /// and asserts that all required parameters are not null.
  factory ModelEnvelopeChild.assertRequired({
    String? id,
    String? label,
  }) {
    assert(id != null);

    return ModelEnvelopeChild(
      id: id,
      label: label,
    );
  }

  /// Constructs a new instance of [ModelEnvelopeChild],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelEnvelopeChild.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelEnvelopeChild.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeChild],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelEnvelopeChild? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [ModelEnvelopeChild],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelEnvelopeChild.of(
    ModelEnvelopeChild another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelEnvelopeChild.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeChild],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelEnvelopeChild? ofOrNull(
    ModelEnvelopeChild? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelEnvelopeChild],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelEnvelopeChild.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelEnvelopeChild.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeChild],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelEnvelopeChild? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelEnvelopeChild.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeChild],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelEnvelopeChild.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelEnvelopeChild.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeChild],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelEnvelopeChild? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
      final label = json?['label']?.toString().trim().nullIfEmpty;
      return ModelEnvelopeChild(
        id: id,
        label: label,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeChild],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelEnvelopeChild.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelEnvelopeChild.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelopeChild],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelEnvelopeChild? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelEnvelopeChild.fromJsonOrNull(uri.queryParameters);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson({
    bool includeNulls = false,
  }) {
    try {
      final id0 = id?.trim().nullIfEmpty;
      final label0 = label?.trim().nullIfEmpty;
      final withNulls = {
        'label': label0,
        'id': id0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelEnvelopeChild.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String get id$ => id!;

  /// Returns the value of the [label] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get label$ => label;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelEnvelopeChildFieldNames {
  /// The field name of [ModelEnvelopeChild.id].
  static const id = 'id';

  /// The field name of [ModelEnvelopeChild.label].
  static const label = 'label';

  /// Every declared field-name constant in declaration order. Mirrors
  /// `enum.values` so consumers can iterate the schema without reflection.
  static const List<String> $values = [id, label];

  /// The field marked `primaryKey: true`, or `null` if none was declared.
  static const String? $primaryKey = null;

  /// Foreign-key fields mapped to the referenced class name (as a String).
  /// Empty when no field uses `foreignKey:` / `references:`.
  static const Map<String, String> $foreignKeys = {};
}

extension ModelEnvelopeChildX on ModelEnvelopeChild {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelEnvelopeChild mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelEnvelopeChild.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelEnvelopeChild copyWith({
    String? id,
    String? label,
  }) {
    return ModelEnvelopeChild.assertRequired(
      id: id ?? this.id,
      label: label ?? this.label,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelEnvelopeChild copyWithout({
    bool id = true,
    bool label = true,
  }) {
    return ModelEnvelopeChild.assertRequired(
      id: id ? this.id : null,
      label: label ? this.label : null,
    );
  }
}
