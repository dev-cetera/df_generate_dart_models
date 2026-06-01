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

part of 'model_profile.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelProfile].
class ModelProfile extends _ModelProfile with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelProfile';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, accountId, displayName, bio, avatarUrl, settings, createdAt, updatedAt];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final String? id;

  /// No description provided.
final String? accountId;

  /// No description provided.
final String? displayName;

  /// No description provided.
final String? bio;

  /// No description provided.
final Uri? avatarUrl;

  /// No description provided.
final ModelProfileSettings? settings;

  /// No description provided.
final DateTime? createdAt;

  /// No description provided.
final DateTime? updatedAt;


  /// Constructs a new instance of [ModelProfile]
  /// from optional and required parameters.
  const ModelProfile({
    required this.id,
required this.accountId,
 this.displayName,
 this.bio,
 this.avatarUrl,
 this.settings,
required this.createdAt,
required this.updatedAt,
  }) ;

  /// Construcs a new instance of [ModelProfile],
  /// forcing all parameters to be optional.
  const ModelProfile.optional({
    this.id,
this.accountId,
this.displayName,
this.bio,
this.avatarUrl,
this.settings,
this.createdAt,
this.updatedAt,
  }) ;


  /// Constructs a new instance of [ModelProfile],
  /// and asserts that all required parameters are not null.
  factory ModelProfile.assertRequired({
    String? id,
String? accountId,
String? displayName,
String? bio,
Uri? avatarUrl,
ModelProfileSettings? settings,
DateTime? createdAt,
DateTime? updatedAt,
  }) {
    assert(id != null);
assert(accountId != null);




assert(createdAt != null);
assert(updatedAt != null);
    return ModelProfile(
      id: id,
accountId: accountId,
displayName: displayName,
bio: bio,
avatarUrl: avatarUrl,
settings: settings,
createdAt: createdAt,
updatedAt: updatedAt,
    );
  }

  /// Constructs a new instance of [ModelProfile],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelProfile.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelProfile.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelProfile],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelProfile? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }


  /// Constructs a new instance of [ModelProfile],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelProfile.of(
    ModelProfile another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelProfile.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelProfile],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelProfile? ofOrNull(
    ModelProfile? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelProfile],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelProfile.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelProfile.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelProfile],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelProfile? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ModelProfile.fromJson(decoded);
      } else {
        return ModelProfile.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelProfile],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelProfile.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelProfile.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelProfile],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelProfile? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
final accountId = json?['account_id']?.toString().trim().nullIfEmpty;
final displayName = json?['display_name']?.toString().trim().nullIfEmpty;
final bio = json?['bio']?.toString().trim().nullIfEmpty;
final avatarUrl = #x0;
final settings = () { final a = letMapOrNull<String, dynamic>(json?['settings']); return a != null ? ModelProfileSettings.fromJson(a): null; }();
final createdAt = (){ final a = json?['created_at']?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }();
final updatedAt = (){ final a = json?['updated_at']?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }();
      return ModelProfile(
        id: id,
accountId: accountId,
displayName: displayName,
bio: bio,
avatarUrl: avatarUrl,
settings: settings,
createdAt: createdAt,
updatedAt: updatedAt,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelProfile],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelProfile.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelProfile.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelProfile],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelProfile? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ModelProfile.fromJson(uri.queryParameters);
      } else {
        return ModelProfile.assertRequired();
      }
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
final accountId0 = accountId?.trim().nullIfEmpty;
final displayName0 = displayName?.trim().nullIfEmpty;
final bio0 = bio?.trim().nullIfEmpty;
final avatarUrl0 = #x0;
final settings0 = settings != null ? jsonEncode(settings!.toJson()) : null;
final createdAt0 = createdAt?.toUtc().toIso8601String();
final updatedAt0 = updatedAt?.toUtc().toIso8601String();
      final withNulls = {
        'updated_at': updatedAt0,'settings': settings0,'id': id0,'display_name': displayName0,'created_at': createdAt0,'bio': bio0,'avatar_url': avatarUrl0,'account_id': accountId0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelProfile.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get id$ => id!;

  /// Returns the value of the [accountId] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get accountId$ => accountId!;

  /// Returns the value of the [displayName] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get displayName$ => displayName;

  /// Returns the value of the [bio] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get bio$ => bio;

  /// Returns the value of the [avatarUrl] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
Uri? get avatarUrl$ => avatarUrl;

  /// Returns the value of the [settings] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
ModelProfileSettings? get settings$ => settings;

  /// Returns the value of the [createdAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime get createdAt$ => createdAt!;

  /// Returns the value of the [updatedAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime get updatedAt$ => updatedAt!;

}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelProfileFieldNames {
    /// The field name of [ModelProfile.id].
static const id = 'id';

  /// The field name of [ModelProfile.accountId].
static const accountId = 'account_id';

  /// The field name of [ModelProfile.displayName].
static const displayName = 'display_name';

  /// The field name of [ModelProfile.bio].
static const bio = 'bio';

  /// The field name of [ModelProfile.avatarUrl].
static const avatarUrl = 'avatar_url';

  /// The field name of [ModelProfile.settings].
static const settings = 'settings';

  /// The field name of [ModelProfile.createdAt].
static const createdAt = 'created_at';

  /// The field name of [ModelProfile.updatedAt].
static const updatedAt = 'updated_at';

}

extension ModelProfileX on ModelProfile {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelProfile mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelProfile.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelProfile copyWith({
    String? id,
String? accountId,
String? displayName,
String? bio,
Uri? avatarUrl,
ModelProfileSettings? settings,
DateTime? createdAt,
DateTime? updatedAt,
  }) {
    return ModelProfile.assertRequired(
      id: id ?? this.id,
accountId: accountId ?? this.accountId,
displayName: displayName ?? this.displayName,
bio: bio ?? this.bio,
avatarUrl: avatarUrl ?? this.avatarUrl,
settings: settings ?? this.settings,
createdAt: createdAt ?? this.createdAt,
updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelProfile copyWithout({
    bool id = true,
bool accountId = true,
bool displayName = true,
bool bio = true,
bool avatarUrl = true,
bool settings = true,
bool createdAt = true,
bool updatedAt = true,
  }) {
    return ModelProfile.assertRequired(
      id: id ? this.id: null,
accountId: accountId ? this.accountId: null,
displayName: displayName ? this.displayName: null,
bio: bio ? this.bio: null,
avatarUrl: avatarUrl ? this.avatarUrl: null,
settings: settings ? this.settings: null,
createdAt: createdAt ? this.createdAt: null,
updatedAt: updatedAt ? this.updatedAt: null,
    );
  }
}