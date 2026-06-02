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

part of 'model_smoke.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelSmoke].
class ModelSmoke extends _ModelSmoke with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelSmoke';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, profileId, profileAvatar, profileAddressCity];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final String? id;

  /// No description provided.
final String? profileId;

  /// No description provided.
final String? profileAvatar;

  /// No description provided.
final String? profileAddressCity;


  /// Constructs a new instance of [ModelSmoke]
  /// from optional and required parameters.
  const ModelSmoke({
    required this.id,
 this.profileId,
 this.profileAvatar,
 this.profileAddressCity,
  }) ;

  /// Construcs a new instance of [ModelSmoke],
  /// forcing all parameters to be optional.
  const ModelSmoke.optional({
    this.id,
this.profileId,
this.profileAvatar,
this.profileAddressCity,
  }) ;


  /// Constructs a new instance of [ModelSmoke],
  /// and asserts that all required parameters are not null.
  factory ModelSmoke.assertRequired({
    String? id,
String? profileId,
String? profileAvatar,
String? profileAddressCity,
  }) {
    assert(id != null);



    return ModelSmoke(
      id: id,
profileId: profileId,
profileAvatar: profileAvatar,
profileAddressCity: profileAddressCity,
    );
  }

  /// Constructs a new instance of [ModelSmoke],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelSmoke.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelSmoke.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelSmoke],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelSmoke? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }


  /// Constructs a new instance of [ModelSmoke],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelSmoke.of(
    ModelSmoke another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelSmoke.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelSmoke],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelSmoke? ofOrNull(
    ModelSmoke? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelSmoke],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelSmoke.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelSmoke.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelSmoke],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelSmoke? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelSmoke.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelSmoke],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelSmoke.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelSmoke.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelSmoke],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelSmoke? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
final profileId = json?['profile']?['id']?.toString().trim().nullIfEmpty;
final profileAvatar = json?['profile']?['avatar']?.toString().trim().nullIfEmpty;
final profileAddressCity = json?['profile']?['address']?['city']?.toString().trim().nullIfEmpty;
      return ModelSmoke(
        id: id,
profileId: profileId,
profileAvatar: profileAvatar,
profileAddressCity: profileAddressCity,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelSmoke],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelSmoke.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelSmoke.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelSmoke],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelSmoke? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelSmoke.fromJsonOrNull(uri.queryParameters);
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
final profileId0 = profileId?.trim().nullIfEmpty;
final profileAvatar0 = profileAvatar?.trim().nullIfEmpty;
final profileAddressCity0 = profileAddressCity?.trim().nullIfEmpty;
      final withNulls = {
        'profile': {'id': profileId0, 'avatar': profileAvatar0, 'address': {'city': profileAddressCity0}},'id': id0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelSmoke.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get id$ => id!;

  /// Returns the value of the [profileId] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get profileId$ => profileId;

  /// Returns the value of the [profileAvatar] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get profileAvatar$ => profileAvatar;

  /// Returns the value of the [profileAddressCity] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get profileAddressCity$ => profileAddressCity;

}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelSmokeFieldNames {
    /// The field name of [ModelSmoke.id].
static const id = 'id';

  /// The field name of [ModelSmoke.profileId].
static const profileId = 'profile_id';

  /// The field name of [ModelSmoke.profileAvatar].
static const profileAvatar = 'profile_avatar';

  /// The field name of [ModelSmoke.profileAddressCity].
static const profileAddressCity = 'profile_address_city';

}

extension ModelSmokeX on ModelSmoke {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelSmoke mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelSmoke.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelSmoke copyWith({
    String? id,
String? profileId,
String? profileAvatar,
String? profileAddressCity,
  }) {
    return ModelSmoke.assertRequired(
      id: id ?? this.id,
profileId: profileId ?? this.profileId,
profileAvatar: profileAvatar ?? this.profileAvatar,
profileAddressCity: profileAddressCity ?? this.profileAddressCity,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelSmoke copyWithout({
    bool id = true,
bool profileId = true,
bool profileAvatar = true,
bool profileAddressCity = true,
  }) {
    return ModelSmoke.assertRequired(
      id: id ? this.id: null,
profileId: profileId ? this.profileId: null,
profileAvatar: profileAvatar ? this.profileAvatar: null,
profileAddressCity: profileAddressCity ? this.profileAddressCity: null,
    );
  }
}