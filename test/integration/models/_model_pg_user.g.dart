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

part of 'model_pg_user.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelPgUser].
class ModelPgUser extends _ModelPgUser with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelPgUser';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, email, displayName, loginCount, isActive, avatarBytes, authProvider, createdAt, updatedAt];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final String? id;

  /// No description provided.
final String? email;

  /// No description provided.
final String? displayName;

  /// No description provided.
final int? loginCount;

  /// No description provided.
final bool? isActive;

  /// No description provided.
final Uint8List? avatarBytes;

  /// No description provided.
final AuthProviderKindType? authProvider;

  /// No description provided.
final DateTime? createdAt;

  /// No description provided.
final DateTime? updatedAt;


  /// Constructs a new instance of [ModelPgUser]
  /// from optional and required parameters.
  const ModelPgUser({
    required this.id,
required this.email,
 this.displayName,
 this.loginCount,
 this.isActive,
 this.avatarBytes,
 this.authProvider,
required this.createdAt,
required this.updatedAt,
  }) ;

  /// Construcs a new instance of [ModelPgUser],
  /// forcing all parameters to be optional.
  const ModelPgUser.optional({
    this.id,
this.email,
this.displayName,
this.loginCount,
this.isActive,
this.avatarBytes,
this.authProvider,
this.createdAt,
this.updatedAt,
  }) ;


  /// Constructs a new instance of [ModelPgUser],
  /// and asserts that all required parameters are not null.
  factory ModelPgUser.assertRequired({
    String? id,
String? email,
String? displayName,
int? loginCount,
bool? isActive,
Uint8List? avatarBytes,
AuthProviderKindType? authProvider,
DateTime? createdAt,
DateTime? updatedAt,
  }) {
    assert(id != null);
assert(email != null);





assert(createdAt != null);
assert(updatedAt != null);
    return ModelPgUser(
      id: id,
email: email,
displayName: displayName,
loginCount: loginCount,
isActive: isActive,
avatarBytes: avatarBytes,
authProvider: authProvider,
createdAt: createdAt,
updatedAt: updatedAt,
    );
  }

  /// Constructs a new instance of [ModelPgUser],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelPgUser.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelPgUser.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPgUser],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelPgUser? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }


  /// Constructs a new instance of [ModelPgUser],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelPgUser.of(
    ModelPgUser another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelPgUser.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPgUser],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelPgUser? ofOrNull(
    ModelPgUser? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelPgUser],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelPgUser.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelPgUser.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPgUser],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelPgUser? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ModelPgUser.fromJson(decoded);
      } else {
        return ModelPgUser.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelPgUser],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelPgUser.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelPgUser.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPgUser],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelPgUser? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
final email = json?['email']?.toString().trim().nullIfEmpty;
final displayName = json?['display_name']?.toString().trim().nullIfEmpty;
final loginCount = letIntOrNull(json?['login_count']) ?? 0;
final isActive = letBoolOrNull(json?['is_active']) ?? true;
final avatarBytes = letAsOrNull<Uint8List>(json?['avatar_bytes']);
final authProvider = AuthProviderKindType.values.valueOf(json?['auth_provider']?.toString()) ?? AuthProviderKindType.unknown;
final createdAt = (){ final a = json?['created_at']?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }();
final updatedAt = (){ final a = json?['updated_at']?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }();
      return ModelPgUser(
        id: id,
email: email,
displayName: displayName,
loginCount: loginCount,
isActive: isActive,
avatarBytes: avatarBytes,
authProvider: authProvider,
createdAt: createdAt,
updatedAt: updatedAt,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelPgUser],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelPgUser.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelPgUser.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPgUser],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelPgUser? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ModelPgUser.fromJson(uri.queryParameters);
      } else {
        return ModelPgUser.assertRequired();
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
final email0 = email?.trim().nullIfEmpty;
final displayName0 = displayName?.trim().nullIfEmpty;
final loginCount0 = loginCount;
final isActive0 = isActive;
final avatarBytes0 = avatarBytes;
final authProvider0 = authProvider?.name;
final createdAt0 = createdAt?.toUtc().toIso8601String();
final updatedAt0 = updatedAt?.toUtc().toIso8601String();
      final withNulls = {
        'updated_at': updatedAt0,'login_count': loginCount0,'is_active': isActive0,'id': id0,'email': email0,'display_name': displayName0,'created_at': createdAt0,'avatar_bytes': avatarBytes0,'auth_provider': authProvider0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelPgUser.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get id$ => id!;

  /// Returns the value of the [email] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get email$ => email!;

  /// Returns the value of the [displayName] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get displayName$ => displayName;

  /// Returns the value of the [loginCount] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
int? get loginCount$ => loginCount;

  /// Returns the value of the [isActive] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
bool? get isActive$ => isActive;

  /// Returns the value of the [avatarBytes] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
Uint8List? get avatarBytes$ => avatarBytes;

  /// Returns the value of the [authProvider] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
AuthProviderKindType? get authProvider$ => authProvider;

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

abstract final class ModelPgUserFieldNames {
    /// The field name of [ModelPgUser.id].
static const id = 'id';

  /// The field name of [ModelPgUser.email].
static const email = 'email';

  /// The field name of [ModelPgUser.displayName].
static const displayName = 'display_name';

  /// The field name of [ModelPgUser.loginCount].
static const loginCount = 'login_count';

  /// The field name of [ModelPgUser.isActive].
static const isActive = 'is_active';

  /// The field name of [ModelPgUser.avatarBytes].
static const avatarBytes = 'avatar_bytes';

  /// The field name of [ModelPgUser.authProvider].
static const authProvider = 'auth_provider';

  /// The field name of [ModelPgUser.createdAt].
static const createdAt = 'created_at';

  /// The field name of [ModelPgUser.updatedAt].
static const updatedAt = 'updated_at';

}

extension ModelPgUserX on ModelPgUser {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelPgUser mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelPgUser.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelPgUser copyWith({
    String? id,
String? email,
String? displayName,
int? loginCount,
bool? isActive,
Uint8List? avatarBytes,
AuthProviderKindType? authProvider,
DateTime? createdAt,
DateTime? updatedAt,
  }) {
    return ModelPgUser.assertRequired(
      id: id ?? this.id,
email: email ?? this.email,
displayName: displayName ?? this.displayName,
loginCount: loginCount ?? this.loginCount,
isActive: isActive ?? this.isActive,
avatarBytes: avatarBytes ?? this.avatarBytes,
authProvider: authProvider ?? this.authProvider,
createdAt: createdAt ?? this.createdAt,
updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelPgUser copyWithout({
    bool id = true,
bool email = true,
bool displayName = true,
bool loginCount = true,
bool isActive = true,
bool avatarBytes = true,
bool authProvider = true,
bool createdAt = true,
bool updatedAt = true,
  }) {
    return ModelPgUser.assertRequired(
      id: id ? this.id: null,
email: email ? this.email: null,
displayName: displayName ? this.displayName: null,
loginCount: loginCount ? this.loginCount: null,
isActive: isActive ? this.isActive: null,
avatarBytes: avatarBytes ? this.avatarBytes: null,
authProvider: authProvider ? this.authProvider: null,
createdAt: createdAt ? this.createdAt: null,
updatedAt: updatedAt ? this.updatedAt: null,
    );
  }
}