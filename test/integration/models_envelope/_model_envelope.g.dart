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

/// Generated class for [_ModelEnvelope].
class ModelEnvelope extends _ModelEnvelope with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelEnvelope';

  @override
  String get $className => CLASS_NAME;

  /// The database table name this model maps to, mirroring `tableName:` on
  /// the annotation. When the annotation omits `tableName:`, this is derived
  /// from the class name (Model prefix/suffix stripped, snake-cased) — no
  /// automatic pluralisation.
  static const tableName = 'envelope';

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props =>
      [primaryChild, children, uniqueChildren, tags, childrenById];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

  /// No description provided.
  final ModelEnvelopeChild? primaryChild;

  /// No description provided.
  final List<ModelEnvelopeChild>? children;

  /// No description provided.
  final Set<ModelEnvelopeChild>? uniqueChildren;

  /// No description provided.
  final List<String>? tags;

  /// No description provided.
  final Map<String, ModelEnvelopeChild>? childrenById;

  /// Constructs a new instance of [ModelEnvelope]
  /// from optional and required parameters.
  const ModelEnvelope({
    this.primaryChild,
    this.children,
    this.uniqueChildren,
    this.tags,
    this.childrenById,
  });

  /// Construcs a new instance of [ModelEnvelope],
  /// forcing all parameters to be optional.
  const ModelEnvelope.optional({
    this.primaryChild,
    this.children,
    this.uniqueChildren,
    this.tags,
    this.childrenById,
  });

  /// Constructs a new instance of [ModelEnvelope],
  /// and asserts that all required parameters are not null.
  factory ModelEnvelope.assertRequired({
    ModelEnvelopeChild? primaryChild,
    List<ModelEnvelopeChild>? children,
    Set<ModelEnvelopeChild>? uniqueChildren,
    List<String>? tags,
    Map<String, ModelEnvelopeChild>? childrenById,
  }) {
    return ModelEnvelope(
      primaryChild: primaryChild,
      children: children,
      uniqueChildren: uniqueChildren,
      tags: tags,
      childrenById: childrenById,
    );
  }

  /// Constructs a new instance of [ModelEnvelope],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelEnvelope.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelEnvelope.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelope],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelEnvelope? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [ModelEnvelope],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelEnvelope.of(
    ModelEnvelope another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelEnvelope.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelope],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelEnvelope? ofOrNull(
    ModelEnvelope? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelEnvelope],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelEnvelope.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelEnvelope.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelope],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelEnvelope? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelEnvelope.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelEnvelope],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelEnvelope.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelEnvelope.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelope],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelEnvelope? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final primaryChild = () {
        final a = letMapOrNull<String, dynamic>(json?['primary_child']);
        return a != null ? ModelEnvelopeChild.fromJson(a) : null;
      }();
      final children = letListOrNull<dynamic>(json?['children'])
          ?.map(
            (p0) => () {
              final a = letMapOrNull<String, dynamic>(p0);
              return a != null ? ModelEnvelopeChild.fromJson(a) : null;
            }(),
          )
          .nonNulls
          .nullIfEmpty
          ?.toList()
          .unmodifiable;
      final uniqueChildren = letSetOrNull<dynamic>(json?['unique_children'])
          ?.map(
            (p0) => () {
              final a = letMapOrNull<String, dynamic>(p0);
              return a != null ? ModelEnvelopeChild.fromJson(a) : null;
            }(),
          )
          .nonNulls
          .nullIfEmpty
          ?.toSet()
          .unmodifiable;
      final tags = letListOrNull<dynamic>(json?['tags'])
          ?.map(
            (p0) => p0?.toString().trim().nullIfEmpty,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList()
          .unmodifiable;
      final childrenById =
          letMapOrNull<dynamic, dynamic>(json?['children_by_id'])
              ?.map(
                (p0, p1) => MapEntry(
                  p0?.toString().trim().nullIfEmpty,
                  () {
                    final a = letMapOrNull<String, dynamic>(p1);
                    return a != null ? ModelEnvelopeChild.fromJson(a) : null;
                  }(),
                ),
              )
              .nonNulls
              .nullIfEmpty
              ?.unmodifiable;
      return ModelEnvelope(
        primaryChild: primaryChild,
        children: children,
        uniqueChildren: uniqueChildren,
        tags: tags,
        childrenById: childrenById,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelEnvelope],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelEnvelope.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelEnvelope.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnvelope],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelEnvelope? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelEnvelope.fromJsonOrNull(uri.queryParameters);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson({
    bool includeNulls = false,
  }) {
    try {
      final primaryChild0 = primaryChild?.toJson();
      final children0 = children
          ?.map(
            (p0) => p0?.toJson(),
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final uniqueChildren0 = uniqueChildren
          ?.map(
            (p0) => p0?.toJson(),
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final tags0 = tags
          ?.map(
            (p0) => p0?.trim().nullIfEmpty,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final childrenById0 = childrenById
          ?.map(
            (p0, p1) => MapEntry(
              p0?.trim().nullIfEmpty,
              p1?.toJson(),
            ),
          )
          .nonNulls
          .nullIfEmpty;
      final withNulls = {
        'unique_children': uniqueChildren0,
        'tags': tags0,
        'primary_child': primaryChild0,
        'children_by_id': childrenById0,
        'children': children0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelEnvelope.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [primaryChild] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  ModelEnvelopeChild? get primaryChild$ => primaryChild;

  /// Returns the value of the [children] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  List<ModelEnvelopeChild>? get children$ => children;

  /// Returns the value of the [uniqueChildren] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Set<ModelEnvelopeChild>? get uniqueChildren$ => uniqueChildren;

  /// Returns the value of the [tags] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  List<String>? get tags$ => tags;

  /// Returns the value of the [childrenById] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Map<String, ModelEnvelopeChild>? get childrenById$ => childrenById;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelEnvelopeFieldNames {
  /// The field name of [ModelEnvelope.primaryChild].
  static const primaryChild = 'primary_child';

  /// The field name of [ModelEnvelope.children].
  static const children = 'children';

  /// The field name of [ModelEnvelope.uniqueChildren].
  static const uniqueChildren = 'unique_children';

  /// The field name of [ModelEnvelope.tags].
  static const tags = 'tags';

  /// The field name of [ModelEnvelope.childrenById].
  static const childrenById = 'children_by_id';

  /// Every declared field-name constant in declaration order. Mirrors
  /// `enum.values` so consumers can iterate the schema without reflection.
  static const List<String> $values = [
    primaryChild,
    children,
    uniqueChildren,
    tags,
    childrenById
  ];

  /// The field marked `primaryKey: true`, or `null` if none was declared.
  static const String? $primaryKey = null;

  /// Foreign-key fields mapped to the referenced class name (as a String).
  /// Empty when no field uses `foreignKey:` / `references:`.
  static const Map<String, String> $foreignKeys = {};
}

extension ModelEnvelopeX on ModelEnvelope {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelEnvelope mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelEnvelope.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelEnvelope copyWith({
    ModelEnvelopeChild? primaryChild,
    List<ModelEnvelopeChild>? children,
    Set<ModelEnvelopeChild>? uniqueChildren,
    List<String>? tags,
    Map<String, ModelEnvelopeChild>? childrenById,
  }) {
    return ModelEnvelope.assertRequired(
      primaryChild: primaryChild ?? this.primaryChild,
      children: children ?? this.children,
      uniqueChildren: uniqueChildren ?? this.uniqueChildren,
      tags: tags ?? this.tags,
      childrenById: childrenById ?? this.childrenById,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelEnvelope copyWithout({
    bool primaryChild = true,
    bool children = true,
    bool uniqueChildren = true,
    bool tags = true,
    bool childrenById = true,
  }) {
    return ModelEnvelope.assertRequired(
      primaryChild: primaryChild ? this.primaryChild : null,
      children: children ? this.children : null,
      uniqueChildren: uniqueChildren ? this.uniqueChildren : null,
      tags: tags ? this.tags : null,
      childrenById: childrenById ? this.childrenById : null,
    );
  }
}
