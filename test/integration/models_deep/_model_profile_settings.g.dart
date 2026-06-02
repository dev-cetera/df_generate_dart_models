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

/// Generated class for [_ModelProfileSettings].
class ModelProfileSettings extends _ModelProfileSettings with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelProfileSettings';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [defaultVisibility, language, timezone, marketingOptIn];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final PostVisibilityType? defaultVisibility;

  /// No description provided.
final String? language;

  /// No description provided.
final String? timezone;

  /// No description provided.
final bool? marketingOptIn;


  /// Constructs a new instance of [ModelProfileSettings]
  /// from optional and required parameters.
  const ModelProfileSettings({
     this.defaultVisibility,
 this.language,
 this.timezone,
 this.marketingOptIn,
  }) ;

  /// Construcs a new instance of [ModelProfileSettings],
  /// forcing all parameters to be optional.
  const ModelProfileSettings.optional({
    this.defaultVisibility,
this.language,
this.timezone,
this.marketingOptIn,
  }) ;


  /// Constructs a new instance of [ModelProfileSettings],
  /// and asserts that all required parameters are not null.
  factory ModelProfileSettings.assertRequired({
    PostVisibilityType? defaultVisibility,
String? language,
String? timezone,
bool? marketingOptIn,
  }) {
    



    return ModelProfileSettings(
      defaultVisibility: defaultVisibility,
language: language,
timezone: timezone,
marketingOptIn: marketingOptIn,
    );
  }

  /// Constructs a new instance of [ModelProfileSettings],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelProfileSettings.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelProfileSettings.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelProfileSettings],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelProfileSettings? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }


  /// Constructs a new instance of [ModelProfileSettings],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelProfileSettings.of(
    ModelProfileSettings another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelProfileSettings.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelProfileSettings],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelProfileSettings? ofOrNull(
    ModelProfileSettings? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelProfileSettings],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelProfileSettings.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelProfileSettings.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelProfileSettings],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelProfileSettings? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelProfileSettings.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelProfileSettings],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelProfileSettings.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelProfileSettings.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelProfileSettings],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelProfileSettings? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final defaultVisibility = PostVisibilityType.values.valueOf(json?['default_visibility']?.toString());
final language = json?['language']?.toString().trim().nullIfEmpty;
final timezone = json?['timezone']?.toString().trim().nullIfEmpty;
final marketingOptIn = letBoolOrNull(json?['marketing_opt_in']);
      return ModelProfileSettings(
        defaultVisibility: defaultVisibility,
language: language,
timezone: timezone,
marketingOptIn: marketingOptIn,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelProfileSettings],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelProfileSettings.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelProfileSettings.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelProfileSettings],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelProfileSettings? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelProfileSettings.fromJsonOrNull(uri.queryParameters);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson({
    bool includeNulls = false,
  }) {
    try {
      final defaultVisibility0 = defaultVisibility?.name;
final language0 = language?.trim().nullIfEmpty;
final timezone0 = timezone?.trim().nullIfEmpty;
final marketingOptIn0 = marketingOptIn;
      final withNulls = {
        'timezone': timezone0,'marketing_opt_in': marketingOptIn0,'language': language0,'default_visibility': defaultVisibility0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelProfileSettings.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [defaultVisibility] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
PostVisibilityType? get defaultVisibility$ => defaultVisibility;

  /// Returns the value of the [language] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get language$ => language;

  /// Returns the value of the [timezone] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get timezone$ => timezone;

  /// Returns the value of the [marketingOptIn] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
bool? get marketingOptIn$ => marketingOptIn;

}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelProfileSettingsFieldNames {
    /// The field name of [ModelProfileSettings.defaultVisibility].
static const defaultVisibility = 'default_visibility';

  /// The field name of [ModelProfileSettings.language].
static const language = 'language';

  /// The field name of [ModelProfileSettings.timezone].
static const timezone = 'timezone';

  /// The field name of [ModelProfileSettings.marketingOptIn].
static const marketingOptIn = 'marketing_opt_in';

}

extension ModelProfileSettingsX on ModelProfileSettings {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelProfileSettings mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelProfileSettings.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelProfileSettings copyWith({
    PostVisibilityType? defaultVisibility,
String? language,
String? timezone,
bool? marketingOptIn,
  }) {
    return ModelProfileSettings.assertRequired(
      defaultVisibility: defaultVisibility ?? this.defaultVisibility,
language: language ?? this.language,
timezone: timezone ?? this.timezone,
marketingOptIn: marketingOptIn ?? this.marketingOptIn,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelProfileSettings copyWithout({
    bool defaultVisibility = true,
bool language = true,
bool timezone = true,
bool marketingOptIn = true,
  }) {
    return ModelProfileSettings.assertRequired(
      defaultVisibility: defaultVisibility ? this.defaultVisibility: null,
language: language ? this.language: null,
timezone: timezone ? this.timezone: null,
marketingOptIn: marketingOptIn ? this.marketingOptIn: null,
    );
  }
}