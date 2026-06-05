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

part of 'model_account.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelAccount].
class ModelAccount extends _ModelAccount with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelAccount';

  @override
  String get $className => CLASS_NAME;

  /// The database table name this model maps to, mirroring `tableName:` on
  /// the annotation. When the annotation omits `tableName:`, this is derived
  /// from the class name (Model prefix/suffix stripped, snake-cased) — no
  /// automatic pluralisation.
  static const tableName = 'account';

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [
        id,
        email,
        username,
        passwordHash,
        status,
        role,
        createdAt,
        updatedAt,
        deletedAt
      ];

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
  final String? username;

  /// No description provided.
  final Uint8List? passwordHash;

  /// No description provided.
  final AccountStatusType? status;

  /// No description provided.
  final AccountRoleType? role;

  /// No description provided.
  final DateTime? createdAt;

  /// No description provided.
  final DateTime? updatedAt;

  /// No description provided.
  final DateTime? deletedAt;

  /// Constructs a new instance of [ModelAccount]
  /// from optional and required parameters.
  const ModelAccount({
    required this.id,
    required this.email,
    required this.username,
    this.passwordHash,
    this.status,
    this.role,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  /// Construcs a new instance of [ModelAccount],
  /// forcing all parameters to be optional.
  const ModelAccount.optional({
    this.id,
    this.email,
    this.username,
    this.passwordHash,
    this.status,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  /// Constructs a new instance of [ModelAccount],
  /// and asserts that all required parameters are not null.
  factory ModelAccount.assertRequired({
    String? id,
    String? email,
    String? username,
    Uint8List? passwordHash,
    AccountStatusType? status,
    AccountRoleType? role,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    assert(id != null);
    assert(email != null);
    assert(username != null);

    assert(createdAt != null);
    assert(updatedAt != null);

    return ModelAccount(
      id: id,
      email: email,
      username: username,
      passwordHash: passwordHash,
      status: status,
      role: role,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  /// Constructs a new instance of [ModelAccount],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelAccount.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelAccount.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelAccount],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelAccount? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [ModelAccount],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelAccount.of(
    ModelAccount another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelAccount.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelAccount],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelAccount? ofOrNull(
    ModelAccount? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelAccount],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelAccount.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelAccount.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelAccount],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelAccount? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelAccount.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelAccount],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelAccount.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelAccount.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelAccount],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelAccount? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
      final email = json?['email']?.toString().trim().nullIfEmpty;
      final username = json?['username']?.toString().trim().nullIfEmpty;
      final passwordHash = letAsOrNull<Uint8List>(json?['password_hash']);
      final status =
          AccountStatusType.values.valueOf(json?['status']?.toString());
      final role = AccountRoleType.values.valueOf(json?['role']?.toString());
      final createdAt = () {
        final a = json?['created_at']?.toString().trim().nullIfEmpty;
        return a != null ? DateTime.tryParse(a)?.toUtc() : null;
      }();
      final updatedAt = () {
        final a = json?['updated_at']?.toString().trim().nullIfEmpty;
        return a != null ? DateTime.tryParse(a)?.toUtc() : null;
      }();
      final deletedAt = () {
        final a = json?['deleted_at']?.toString().trim().nullIfEmpty;
        return a != null ? DateTime.tryParse(a)?.toUtc() : null;
      }();
      return ModelAccount(
        id: id,
        email: email,
        username: username,
        passwordHash: passwordHash,
        status: status,
        role: role,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelAccount],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelAccount.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelAccount.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelAccount],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelAccount? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelAccount.fromJsonOrNull(uri.queryParameters);
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
      final username0 = username?.trim().nullIfEmpty;
      final passwordHash0 = passwordHash;
      final status0 = status?.name;
      final role0 = role?.name;
      final createdAt0 = createdAt?.toUtc().toIso8601String();
      final updatedAt0 = updatedAt?.toUtc().toIso8601String();
      final deletedAt0 = deletedAt?.toUtc().toIso8601String();
      final withNulls = {
        'username': username0,
        'updated_at': updatedAt0,
        'status': status0,
        'role': role0,
        'password_hash': passwordHash0,
        'id': id0,
        'email': email0,
        'deleted_at': deletedAt0,
        'created_at': createdAt0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelAccount.toJson: $e');
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

  /// Returns the value of the [username] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String get username$ => username!;

  /// Returns the value of the [passwordHash] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Uint8List? get passwordHash$ => passwordHash;

  /// Returns the value of the [status] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  AccountStatusType? get status$ => status;

  /// Returns the value of the [role] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  AccountRoleType? get role$ => role;

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

  /// Returns the value of the [deletedAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  DateTime? get deletedAt$ => deletedAt;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelAccountFieldNames {
  /// The field name of [ModelAccount.id].
  static const id = 'id';

  /// The field name of [ModelAccount.email].
  static const email = 'email';

  /// The field name of [ModelAccount.username].
  static const username = 'username';

  /// The field name of [ModelAccount.passwordHash].
  static const passwordHash = 'password_hash';

  /// The field name of [ModelAccount.status].
  static const status = 'status';

  /// The field name of [ModelAccount.role].
  static const role = 'role';

  /// The field name of [ModelAccount.createdAt].
  static const createdAt = 'created_at';

  /// The field name of [ModelAccount.updatedAt].
  static const updatedAt = 'updated_at';

  /// The field name of [ModelAccount.deletedAt].
  static const deletedAt = 'deleted_at';

  /// Every declared field-name constant in declaration order. Mirrors
  /// `enum.values` so consumers can iterate the schema without reflection.
  static const List<String> $values = [
    id,
    email,
    username,
    passwordHash,
    status,
    role,
    createdAt,
    updatedAt,
    deletedAt
  ];

  /// The field marked `primaryKey: true`, or `null` if none was declared.
  static const String $primaryKey = id;

  /// Foreign-key fields mapped to the referenced class name (as a String).
  /// Empty when no field uses `foreignKey:` / `references:`.
  static const Map<String, String> $foreignKeys = {};
}

extension ModelAccountX on ModelAccount {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelAccount mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelAccount.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelAccount copyWith({
    String? id,
    String? email,
    String? username,
    Uint8List? passwordHash,
    AccountStatusType? status,
    AccountRoleType? role,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return ModelAccount.assertRequired(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      passwordHash: passwordHash ?? this.passwordHash,
      status: status ?? this.status,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelAccount copyWithout({
    bool id = true,
    bool email = true,
    bool username = true,
    bool passwordHash = true,
    bool status = true,
    bool role = true,
    bool createdAt = true,
    bool updatedAt = true,
    bool deletedAt = true,
  }) {
    return ModelAccount.assertRequired(
      id: id ? this.id : null,
      email: email ? this.email : null,
      username: username ? this.username : null,
      passwordHash: passwordHash ? this.passwordHash : null,
      status: status ? this.status : null,
      role: role ? this.role : null,
      createdAt: createdAt ? this.createdAt : null,
      updatedAt: updatedAt ? this.updatedAt : null,
      deletedAt: deletedAt ? this.deletedAt : null,
    );
  }
}
