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

part of 'model_pg_post.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelPostMetadata].
class ModelPostMetadata extends _ModelPostMetadata with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelPostMetadata';

  @override
  String get $className => CLASS_NAME;

  /// The database table name this model maps to, mirroring `tableName:` on
  /// the annotation. When the annotation omits `tableName:`, this is derived
  /// from the class name (Model prefix/suffix stripped, snake-cased) — no
  /// automatic pluralisation.
  static const tableName = 'post_metadata';

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [format, wordCount, language];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

  /// No description provided.
  final String? format;

  /// No description provided.
  final int? wordCount;

  /// No description provided.
  final String? language;

  /// Constructs a new instance of [ModelPostMetadata]
  /// from optional and required parameters.
  const ModelPostMetadata({
    required this.format,
    this.wordCount,
    this.language,
  });

  /// Construcs a new instance of [ModelPostMetadata],
  /// forcing all parameters to be optional.
  const ModelPostMetadata.optional({
    this.format,
    this.wordCount,
    this.language,
  });

  /// Constructs a new instance of [ModelPostMetadata],
  /// and asserts that all required parameters are not null.
  factory ModelPostMetadata.assertRequired({
    String? format,
    int? wordCount,
    String? language,
  }) {
    assert(format != null);

    return ModelPostMetadata(
      format: format,
      wordCount: wordCount,
      language: language,
    );
  }

  /// Constructs a new instance of [ModelPostMetadata],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelPostMetadata.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelPostMetadata.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPostMetadata],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelPostMetadata? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [ModelPostMetadata],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelPostMetadata.of(
    ModelPostMetadata another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelPostMetadata.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPostMetadata],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelPostMetadata? ofOrNull(
    ModelPostMetadata? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelPostMetadata],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelPostMetadata.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelPostMetadata.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPostMetadata],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelPostMetadata? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelPostMetadata.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelPostMetadata],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelPostMetadata.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelPostMetadata.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPostMetadata],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelPostMetadata? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final format = json?['format']?.toString().trim().nullIfEmpty;
      final wordCount = letIntOrNull(json?['word_count']);
      final language = json?['language']?.toString().trim().nullIfEmpty;
      return ModelPostMetadata(
        format: format,
        wordCount: wordCount,
        language: language,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelPostMetadata],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelPostMetadata.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelPostMetadata.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPostMetadata],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelPostMetadata? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelPostMetadata.fromJsonOrNull(uri.queryParameters);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson({
    bool includeNulls = false,
  }) {
    try {
      final format0 = format?.trim().nullIfEmpty;
      final wordCount0 = wordCount;
      final language0 = language?.trim().nullIfEmpty;
      final withNulls = {
        'word_count': wordCount0,
        'language': language0,
        'format': format0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelPostMetadata.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [format] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String get format$ => format!;

  /// Returns the value of the [wordCount] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  int? get wordCount$ => wordCount;

  /// Returns the value of the [language] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get language$ => language;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelPostMetadataFieldNames {
  /// The field name of [ModelPostMetadata.format].
  static const format = 'format';

  /// The field name of [ModelPostMetadata.wordCount].
  static const wordCount = 'word_count';

  /// The field name of [ModelPostMetadata.language].
  static const language = 'language';

  /// Every declared field-name constant in declaration order. Mirrors
  /// `enum.values` so consumers can iterate the schema without reflection.
  static const List<String> $values = [format, wordCount, language];

  /// The field marked `primaryKey: true`, or `null` if none was declared.
  static const String? $primaryKey = null;

  /// Foreign-key fields mapped to the referenced class name (as a String).
  /// Empty when no field uses `foreignKey:` / `references:`.
  static const Map<String, String> $foreignKeys = {};
}

extension ModelPostMetadataX on ModelPostMetadata {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelPostMetadata mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelPostMetadata.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelPostMetadata copyWith({
    String? format,
    int? wordCount,
    String? language,
  }) {
    return ModelPostMetadata.assertRequired(
      format: format ?? this.format,
      wordCount: wordCount ?? this.wordCount,
      language: language ?? this.language,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelPostMetadata copyWithout({
    bool format = true,
    bool wordCount = true,
    bool language = true,
  }) {
    return ModelPostMetadata.assertRequired(
      format: format ? this.format : null,
      wordCount: wordCount ? this.wordCount : null,
      language: language ? this.language : null,
    );
  }
}
