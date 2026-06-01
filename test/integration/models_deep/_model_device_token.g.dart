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

part of 'model_device_token.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelDeviceToken].
class ModelDeviceToken extends _ModelDeviceToken with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelDeviceToken';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, accountRef, token, kind, locale, lastSeenAt, createdAt, lastLocation];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final String? id;

  /// No description provided.
final String? accountRef;

  /// No description provided.
final String? token;

  /// No description provided.
final DeviceKindType? kind;

  /// No description provided.
final String? locale;

  /// No description provided.
final DateTime? lastSeenAt;

  /// No description provided.
final DateTime? createdAt;

  /// No description provided.
final GeoPoint? lastLocation;


  /// Constructs a new instance of [ModelDeviceToken]
  /// from optional and required parameters.
  const ModelDeviceToken({
    required this.id,
required this.accountRef,
required this.token,
required this.kind,
 this.locale,
 this.lastSeenAt,
 this.createdAt,
 this.lastLocation,
  }) ;

  /// Construcs a new instance of [ModelDeviceToken],
  /// forcing all parameters to be optional.
  const ModelDeviceToken.optional({
    this.id,
this.accountRef,
this.token,
this.kind,
this.locale,
this.lastSeenAt,
this.createdAt,
this.lastLocation,
  }) ;


  /// Constructs a new instance of [ModelDeviceToken],
  /// and asserts that all required parameters are not null.
  factory ModelDeviceToken.assertRequired({
    String? id,
String? accountRef,
String? token,
DeviceKindType? kind,
String? locale,
DateTime? lastSeenAt,
DateTime? createdAt,
GeoPoint? lastLocation,
  }) {
    assert(id != null);
assert(accountRef != null);
assert(token != null);
assert(kind != null);




    return ModelDeviceToken(
      id: id,
accountRef: accountRef,
token: token,
kind: kind,
locale: locale,
lastSeenAt: lastSeenAt,
createdAt: createdAt,
lastLocation: lastLocation,
    );
  }

  /// Constructs a new instance of [ModelDeviceToken],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelDeviceToken.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelDeviceToken.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelDeviceToken],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelDeviceToken? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }


  /// Constructs a new instance of [ModelDeviceToken],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelDeviceToken.of(
    ModelDeviceToken another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelDeviceToken.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelDeviceToken],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelDeviceToken? ofOrNull(
    ModelDeviceToken? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelDeviceToken],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelDeviceToken.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelDeviceToken.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelDeviceToken],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelDeviceToken? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ModelDeviceToken.fromJson(decoded);
      } else {
        return ModelDeviceToken.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelDeviceToken],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelDeviceToken.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelDeviceToken.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelDeviceToken],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelDeviceToken? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
final accountRef = (){ final a = letAsOrNull<DocumentReference>(json?['accountRef']); return a != null ? a.path : json?['accountRef']?.toString().trim().nullIfEmpty; }();
final token = json?['token']?.toString().trim().nullIfEmpty;
final kind = DeviceKindType.values.valueOf(json?['kind']?.toString());
final locale = json?['locale']?.toString().trim().nullIfEmpty ?? 'en';
final lastSeenAt = (){ final a = letAsOrNull<Timestamp>(json?['lastSeenAt']); return a != null ? a.toDate().toUtc() : null; }();
final createdAt = (){ final a = letAsOrNull<Timestamp>(json?['createdAt']); return a != null ? a.toDate().toUtc() : null; }();
final lastLocation = letAsOrNull<GeoPoint>(json?['lastLocation']);
      return ModelDeviceToken(
        id: id,
accountRef: accountRef,
token: token,
kind: kind,
locale: locale,
lastSeenAt: lastSeenAt,
createdAt: createdAt,
lastLocation: lastLocation,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelDeviceToken],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelDeviceToken.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelDeviceToken.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelDeviceToken],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelDeviceToken? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ModelDeviceToken.fromJson(uri.queryParameters);
      } else {
        return ModelDeviceToken.assertRequired();
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
final accountRef0 = accountRef?.trim().nullIfEmpty;
final token0 = token?.trim().nullIfEmpty;
final kind0 = kind?.name;
final locale0 = locale?.trim().nullIfEmpty;
final lastSeenAt0 = lastSeenAt != null ? Timestamp.fromDate(lastSeenAt!.toUtc()) : null;
final createdAt0 = FieldValue.serverTimestamp();
final lastLocation0 = lastLocation;
      final withNulls = {
        'token': token0,'locale': locale0,'lastSeenAt': lastSeenAt0,'lastLocation': lastLocation0,'kind': kind0,'id': id0,'createdAt': createdAt0,'accountRef': accountRef0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelDeviceToken.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get id$ => id!;

  /// Returns the value of the [accountRef] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get accountRef$ => accountRef!;

  /// Returns the value of the [token] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get token$ => token!;

  /// Returns the value of the [kind] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DeviceKindType get kind$ => kind!;

  /// Returns the value of the [locale] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get locale$ => locale;

  /// Returns the value of the [lastSeenAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime? get lastSeenAt$ => lastSeenAt;

  /// Returns the value of the [createdAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime? get createdAt$ => createdAt;

  /// Returns the value of the [lastLocation] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
GeoPoint? get lastLocation$ => lastLocation;

}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelDeviceTokenFieldNames {
    /// The field name of [ModelDeviceToken.id].
static const id = 'id';

  /// The field name of [ModelDeviceToken.accountRef].
static const accountRef = 'accountRef';

  /// The field name of [ModelDeviceToken.token].
static const token = 'token';

  /// The field name of [ModelDeviceToken.kind].
static const kind = 'kind';

  /// The field name of [ModelDeviceToken.locale].
static const locale = 'locale';

  /// The field name of [ModelDeviceToken.lastSeenAt].
static const lastSeenAt = 'lastSeenAt';

  /// The field name of [ModelDeviceToken.createdAt].
static const createdAt = 'createdAt';

  /// The field name of [ModelDeviceToken.lastLocation].
static const lastLocation = 'lastLocation';

}

extension ModelDeviceTokenX on ModelDeviceToken {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelDeviceToken mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelDeviceToken.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelDeviceToken copyWith({
    String? id,
String? accountRef,
String? token,
DeviceKindType? kind,
String? locale,
DateTime? lastSeenAt,
DateTime? createdAt,
GeoPoint? lastLocation,
  }) {
    return ModelDeviceToken.assertRequired(
      id: id ?? this.id,
accountRef: accountRef ?? this.accountRef,
token: token ?? this.token,
kind: kind ?? this.kind,
locale: locale ?? this.locale,
lastSeenAt: lastSeenAt ?? this.lastSeenAt,
createdAt: createdAt ?? this.createdAt,
lastLocation: lastLocation ?? this.lastLocation,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelDeviceToken copyWithout({
    bool id = true,
bool accountRef = true,
bool token = true,
bool kind = true,
bool locale = true,
bool lastSeenAt = true,
bool createdAt = true,
bool lastLocation = true,
  }) {
    return ModelDeviceToken.assertRequired(
      id: id ? this.id: null,
accountRef: accountRef ? this.accountRef: null,
token: token ? this.token: null,
kind: kind ? this.kind: null,
locale: locale ? this.locale: null,
lastSeenAt: lastSeenAt ? this.lastSeenAt: null,
createdAt: createdAt ? this.createdAt: null,
lastLocation: lastLocation ? this.lastLocation: null,
    );
  }
}