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

part of 'model_enum_smoke.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelEnumSmoke].
class ModelEnumSmoke extends _ModelEnumSmoke with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelEnumSmoke';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, visibility, status];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final String? id;

  /// No description provided.
final Visibility? visibility;

  /// No description provided.
final AccountStatusType? status;


  /// Constructs a new instance of [ModelEnumSmoke]
  /// from optional and required parameters.
  const ModelEnumSmoke({
    required this.id,
 this.visibility,
 this.status,
  }) ;

  /// Construcs a new instance of [ModelEnumSmoke],
  /// forcing all parameters to be optional.
  const ModelEnumSmoke.optional({
    this.id,
this.visibility,
this.status,
  }) ;


  /// Constructs a new instance of [ModelEnumSmoke],
  /// and asserts that all required parameters are not null.
  factory ModelEnumSmoke.assertRequired({
    String? id,
Visibility? visibility,
AccountStatusType? status,
  }) {
    assert(id != null);


    return ModelEnumSmoke(
      id: id,
visibility: visibility,
status: status,
    );
  }

  /// Constructs a new instance of [ModelEnumSmoke],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelEnumSmoke.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelEnumSmoke.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnumSmoke],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelEnumSmoke? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }


  /// Constructs a new instance of [ModelEnumSmoke],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelEnumSmoke.of(
    ModelEnumSmoke another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelEnumSmoke.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnumSmoke],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelEnumSmoke? ofOrNull(
    ModelEnumSmoke? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelEnumSmoke],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelEnumSmoke.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelEnumSmoke.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnumSmoke],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelEnumSmoke? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelEnumSmoke.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelEnumSmoke],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelEnumSmoke.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelEnumSmoke.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnumSmoke],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelEnumSmoke? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
final visibility = Visibility.values.valueOf(json?['visibility']?.toString());
final status = AccountStatusType.values.valueOf(json?['status']?.toString());
      return ModelEnumSmoke(
        id: id,
visibility: visibility,
status: status,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelEnumSmoke],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelEnumSmoke.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelEnumSmoke.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelEnumSmoke],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelEnumSmoke? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelEnumSmoke.fromJsonOrNull(uri.queryParameters);
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
final visibility0 = visibility?.name;
final status0 = status?.name;
      final withNulls = {
        'visibility': visibility0,'status': status0,'id': id0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelEnumSmoke.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get id$ => id!;

  /// Returns the value of the [visibility] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
Visibility? get visibility$ => visibility;

  /// Returns the value of the [status] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
AccountStatusType? get status$ => status;

}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelEnumSmokeFieldNames {
    /// The field name of [ModelEnumSmoke.id].
static const id = 'id';

  /// The field name of [ModelEnumSmoke.visibility].
static const visibility = 'visibility';

  /// The field name of [ModelEnumSmoke.status].
static const status = 'status';

}

extension ModelEnumSmokeX on ModelEnumSmoke {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelEnumSmoke mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelEnumSmoke.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelEnumSmoke copyWith({
    String? id,
Visibility? visibility,
AccountStatusType? status,
  }) {
    return ModelEnumSmoke.assertRequired(
      id: id ?? this.id,
visibility: visibility ?? this.visibility,
status: status ?? this.status,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelEnumSmoke copyWithout({
    bool id = true,
bool visibility = true,
bool status = true,
  }) {
    return ModelEnumSmoke.assertRequired(
      id: id ? this.id: null,
visibility: visibility ? this.visibility: null,
status: status ? this.status: null,
    );
  }
}