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

part of 'model_sqlite_settings.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelSqliteSettings].
class ModelSqliteSettings extends _ModelSqliteSettings with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelSqliteSettings';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, userId, notificationsEnabled, theme, lastSyncedAt, legacyCreatedAt, preferences, avatarCache];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final int? id;

  /// No description provided.
final String? userId;

  /// No description provided.
final bool? notificationsEnabled;

  /// No description provided.
final String? theme;

  /// No description provided.
final DateTime? lastSyncedAt;

  /// No description provided.
final DateTime? legacyCreatedAt;

  /// No description provided.
final Map<String,dynamic>? preferences;

  /// No description provided.
final Uint8List? avatarCache;


  /// Constructs a new instance of [ModelSqliteSettings]
  /// from optional and required parameters.
  const ModelSqliteSettings({
    required this.id,
required this.userId,
 this.notificationsEnabled,
 this.theme,
 this.lastSyncedAt,
 this.legacyCreatedAt,
 this.preferences,
 this.avatarCache,
  }) ;

  /// Construcs a new instance of [ModelSqliteSettings],
  /// forcing all parameters to be optional.
  const ModelSqliteSettings.optional({
    this.id,
this.userId,
this.notificationsEnabled,
this.theme,
this.lastSyncedAt,
this.legacyCreatedAt,
this.preferences,
this.avatarCache,
  }) ;


  /// Constructs a new instance of [ModelSqliteSettings],
  /// and asserts that all required parameters are not null.
  factory ModelSqliteSettings.assertRequired({
    int? id,
String? userId,
bool? notificationsEnabled,
String? theme,
DateTime? lastSyncedAt,
DateTime? legacyCreatedAt,
Map<String,dynamic>? preferences,
Uint8List? avatarCache,
  }) {
    assert(id != null);
assert(userId != null);






    return ModelSqliteSettings(
      id: id,
userId: userId,
notificationsEnabled: notificationsEnabled,
theme: theme,
lastSyncedAt: lastSyncedAt,
legacyCreatedAt: legacyCreatedAt,
preferences: preferences,
avatarCache: avatarCache,
    );
  }

  /// Constructs a new instance of [ModelSqliteSettings],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelSqliteSettings.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelSqliteSettings.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelSqliteSettings],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelSqliteSettings? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }


  /// Constructs a new instance of [ModelSqliteSettings],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelSqliteSettings.of(
    ModelSqliteSettings another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelSqliteSettings.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelSqliteSettings],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelSqliteSettings? ofOrNull(
    ModelSqliteSettings? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelSqliteSettings],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelSqliteSettings.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelSqliteSettings.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelSqliteSettings],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelSqliteSettings? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ModelSqliteSettings.fromJson(decoded);
      } else {
        return ModelSqliteSettings.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelSqliteSettings],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelSqliteSettings.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelSqliteSettings.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelSqliteSettings],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelSqliteSettings? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = letIntOrNull(json?['id']);
final userId = json?['user_id']?.toString().trim().nullIfEmpty;
final notificationsEnabled = letBoolOrNull(json?['notifications_enabled']);
final theme = json?['theme']?.toString().trim().nullIfEmpty;
final lastSyncedAt = (){ final a = letIntOrNull(json?['last_synced_at']); return a != null ? DateTime.fromMillisecondsSinceEpoch(a, isUtc: true) : null; }();
final legacyCreatedAt = (){ final a = json?['legacy_created_at']?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }();
final preferences = letMapOrNull<dynamic, dynamic>(json?['preferences'])?.map((p0, p1) => MapEntry(p0?.toString().trim().nullIfEmpty, p1,),).nonNulls.nullIfEmpty?.unmodifiable;
final avatarCache = letAsOrNull<Uint8List>(json?['avatar_cache']);
      return ModelSqliteSettings(
        id: id,
userId: userId,
notificationsEnabled: notificationsEnabled,
theme: theme,
lastSyncedAt: lastSyncedAt,
legacyCreatedAt: legacyCreatedAt,
preferences: preferences,
avatarCache: avatarCache,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelSqliteSettings],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelSqliteSettings.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelSqliteSettings.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelSqliteSettings],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelSqliteSettings? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ModelSqliteSettings.fromJson(uri.queryParameters);
      } else {
        return ModelSqliteSettings.assertRequired();
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
      final id0 = id;
final userId0 = userId?.trim().nullIfEmpty;
final notificationsEnabled0 = notificationsEnabled == null ? null : (notificationsEnabled! ? 1 : 0);
final theme0 = theme?.trim().nullIfEmpty;
final lastSyncedAt0 = lastSyncedAt?.toUtc().millisecondsSinceEpoch;
final legacyCreatedAt0 = legacyCreatedAt?.toUtc().toIso8601String();
final preferences0 = (){ final a = preferences; return a != null ? jsonEncode(a.map((p0, p1) => MapEntry(p0?.trim().nullIfEmpty, p1,)).nonNulls.nullIfEmpty) : null; }();
final avatarCache0 = avatarCache;
      final withNulls = {
        'user_id': userId0,'theme': theme0,'preferences': preferences0,'notifications_enabled': notificationsEnabled0,'legacy_created_at': legacyCreatedAt0,'last_synced_at': lastSyncedAt0,'id': id0,'avatar_cache': avatarCache0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelSqliteSettings.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
int get id$ => id!;

  /// Returns the value of the [userId] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get userId$ => userId!;

  /// Returns the value of the [notificationsEnabled] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
bool? get notificationsEnabled$ => notificationsEnabled;

  /// Returns the value of the [theme] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get theme$ => theme;

  /// Returns the value of the [lastSyncedAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime? get lastSyncedAt$ => lastSyncedAt;

  /// Returns the value of the [legacyCreatedAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime? get legacyCreatedAt$ => legacyCreatedAt;

  /// Returns the value of the [preferences] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
Map<String,dynamic>? get preferences$ => preferences;

  /// Returns the value of the [avatarCache] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
Uint8List? get avatarCache$ => avatarCache;

}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelSqliteSettingsFieldNames {
    /// The field name of [ModelSqliteSettings.id].
static const id = 'id';

  /// The field name of [ModelSqliteSettings.userId].
static const userId = 'user_id';

  /// The field name of [ModelSqliteSettings.notificationsEnabled].
static const notificationsEnabled = 'notifications_enabled';

  /// The field name of [ModelSqliteSettings.theme].
static const theme = 'theme';

  /// The field name of [ModelSqliteSettings.lastSyncedAt].
static const lastSyncedAt = 'last_synced_at';

  /// The field name of [ModelSqliteSettings.legacyCreatedAt].
static const legacyCreatedAt = 'legacy_created_at';

  /// The field name of [ModelSqliteSettings.preferences].
static const preferences = 'preferences';

  /// The field name of [ModelSqliteSettings.avatarCache].
static const avatarCache = 'avatar_cache';

}

extension ModelSqliteSettingsX on ModelSqliteSettings {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelSqliteSettings mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelSqliteSettings.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelSqliteSettings copyWith({
    int? id,
String? userId,
bool? notificationsEnabled,
String? theme,
DateTime? lastSyncedAt,
DateTime? legacyCreatedAt,
Map<String,dynamic>? preferences,
Uint8List? avatarCache,
  }) {
    return ModelSqliteSettings.assertRequired(
      id: id ?? this.id,
userId: userId ?? this.userId,
notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
theme: theme ?? this.theme,
lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
legacyCreatedAt: legacyCreatedAt ?? this.legacyCreatedAt,
preferences: preferences ?? this.preferences,
avatarCache: avatarCache ?? this.avatarCache,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelSqliteSettings copyWithout({
    bool id = true,
bool userId = true,
bool notificationsEnabled = true,
bool theme = true,
bool lastSyncedAt = true,
bool legacyCreatedAt = true,
bool preferences = true,
bool avatarCache = true,
  }) {
    return ModelSqliteSettings.assertRequired(
      id: id ? this.id: null,
userId: userId ? this.userId: null,
notificationsEnabled: notificationsEnabled ? this.notificationsEnabled: null,
theme: theme ? this.theme: null,
lastSyncedAt: lastSyncedAt ? this.lastSyncedAt: null,
legacyCreatedAt: legacyCreatedAt ? this.legacyCreatedAt: null,
preferences: preferences ? this.preferences: null,
avatarCache: avatarCache ? this.avatarCache: null,
    );
  }
}