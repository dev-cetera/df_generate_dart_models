//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/DevCetra/df_generate_dart_models
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: annotate_overrides
// ignore_for_file: invalid_null_aware_operator
// ignore_for_file: overridden_fields
// ignore_for_file: require_trailing_commas
// ignore_for_file: unnecessary_non_null_assertion
// ignore_for_file: unnecessary_null_comparison
// ignore_for_file: unnecessary_question_mark

part of 'model_user.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelUser].
class ModelUser extends _ModelUser {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelUser';

  @override
  String get $className => CLASS_NAME;

  /// No description provided.
  final DataRefModel? ref;

  /// No description provided.
  final String? firstName;

  /// No description provided.
  final String? lastName;

  /// Constructs a new instance of [ModelUser]
  /// from optional and required parameters.
  const ModelUser({
    required this.ref,
    this.firstName,
    this.lastName,
  });

  /// Construcs a new instance of [ModelUser],
  /// forcing all parameters to be optional.
  const ModelUser.optional({
    this.ref,
    this.firstName,
    this.lastName,
  });

  /// Constructs a new instance of [ModelUser],
  /// and asserts that all required parameters are not null.
  factory ModelUser.assertRequired({
    DataRefModel? ref,
    String? firstName,
    String? lastName,
  }) {
    assert(ref != null);

    return ModelUser(
      ref: ref,
      firstName: firstName,
      lastName: lastName,
    );
  }

  /// Constructs a new instance of [ModelUser],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelUser.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelUser.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelUser],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelUser? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }

  /// Constructs a new instance of [ModelUser],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelUser.of(
    ModelUser another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelUser.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelUser],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelUser? ofOrNull(
    ModelUser? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelUser],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelUser.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelUser.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelUser],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelUser? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ModelUser.fromJson(decoded);
      } else {
        return ModelUser.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelUser],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelUser.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelUser.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelUser],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelUser? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final ref = dataRefFromString(json?['ref']?.toString());
      final firstName = json?['firstName']?.toString().trim().nullIfEmpty;
      final lastName = json?['lastName']?.toString().trim().nullIfEmpty;
      return ModelUser(
        ref: ref,
        firstName: firstName,
        lastName: lastName,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelUser],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelUser.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelUser.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelUser],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelUser? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ModelUser.fromJson(uri.queryParameters);
      } else {
        return ModelUser.assertRequired();
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
      final ref0 = ref?.path;
      final firstName0 = firstName?.trim().nullIfEmpty;
      final lastName0 = lastName?.trim().nullIfEmpty;
      final withNulls = {
        'ref': ref0,
        'lastName': lastName0,
        'firstName': firstName0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelUser.toJson: $e');
      rethrow;
    }
  }

  @override
  T mergeWith<T extends BaseModel>(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelUser.fromJson(data.cast()) as T;
  }

  /// Creates a copy of this instance, replacing the specified fields.
  static ModelUser copyWith(
    ModelUser src, {
    DataRefModel? ref,
    String? firstName,
    String? lastName,
  }) {
    return ModelUser.assertRequired(
      ref: ref ?? src.ref,
      firstName: firstName ?? src.firstName,
      lastName: lastName ?? src.lastName,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  static ModelUser copyWithout(
    ModelUser src, {
    bool ref = true,
    bool firstName = true,
    bool lastName = true,
  }) {
    return ModelUser.assertRequired(
      ref: ref ? src.ref : null,
      firstName: firstName ? src.firstName : null,
      lastName: lastName ? src.lastName : null,
    );
  }

  /// Returns the value of the [ref] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  DataRefModel get ref$ => ref!;

  /// Returns the value of the [firstName] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get firstName$ => firstName;

  /// Returns the value of the [lastName] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get lastName$ => lastName;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelUserFieldNames {
  /// The field name of [ModelUser.ref].
  static const ref = 'ref';

  /// The field name of [ModelUser.firstName].
  static const firstName = 'firstName';

  /// The field name of [ModelUser.lastName].
  static const lastName = 'lastName';
}
