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

part of 'model_local_draft.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelLocalDraft].
class ModelLocalDraft extends _ModelLocalDraft with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelLocalDraft';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, caption, hashtags, media, scheduledFor, isDirty, updatedAt];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final int? id;

  /// No description provided.
final String? caption;

  /// No description provided.
final List<String>? hashtags;

  /// No description provided.
final List<ModelMediaItem>? media;

  /// No description provided.
final DateTime? scheduledFor;

  /// No description provided.
final bool? isDirty;

  /// No description provided.
final DateTime? updatedAt;


  /// Constructs a new instance of [ModelLocalDraft]
  /// from optional and required parameters.
  const ModelLocalDraft({
    required this.id,
 this.caption,
 this.hashtags,
 this.media,
 this.scheduledFor,
 this.isDirty,
required this.updatedAt,
  }) ;

  /// Construcs a new instance of [ModelLocalDraft],
  /// forcing all parameters to be optional.
  const ModelLocalDraft.optional({
    this.id,
this.caption,
this.hashtags,
this.media,
this.scheduledFor,
this.isDirty,
this.updatedAt,
  }) ;


  /// Constructs a new instance of [ModelLocalDraft],
  /// and asserts that all required parameters are not null.
  factory ModelLocalDraft.assertRequired({
    int? id,
String? caption,
List<String>? hashtags,
List<ModelMediaItem>? media,
DateTime? scheduledFor,
bool? isDirty,
DateTime? updatedAt,
  }) {
    assert(id != null);





assert(updatedAt != null);
    return ModelLocalDraft(
      id: id,
caption: caption,
hashtags: hashtags,
media: media,
scheduledFor: scheduledFor,
isDirty: isDirty,
updatedAt: updatedAt,
    );
  }

  /// Constructs a new instance of [ModelLocalDraft],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelLocalDraft.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelLocalDraft.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelLocalDraft],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelLocalDraft? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }


  /// Constructs a new instance of [ModelLocalDraft],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelLocalDraft.of(
    ModelLocalDraft another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelLocalDraft.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelLocalDraft],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelLocalDraft? ofOrNull(
    ModelLocalDraft? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelLocalDraft],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelLocalDraft.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelLocalDraft.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelLocalDraft],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelLocalDraft? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ModelLocalDraft.fromJson(decoded);
      } else {
        return ModelLocalDraft.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelLocalDraft],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelLocalDraft.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelLocalDraft.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelLocalDraft],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelLocalDraft? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = letIntOrNull(json?['id']);
final caption = json?['caption']?.toString().trim().nullIfEmpty;
final hashtags = letListOrNull<dynamic>(json?['hashtags'])?.map((p0) => p0?.toString().trim().nullIfEmpty,).nonNulls.nullIfEmpty?.toList().unmodifiable;
final media = letListOrNull<dynamic>(json?['media'])?.map((p0) => () { final a = letMapOrNull<String, dynamic>(p0); return a != null ? ModelMediaItem.fromJson(a): null; }(),).nonNulls.nullIfEmpty?.toList().unmodifiable;
final scheduledFor = (){ final a = letIntOrNull(json?['scheduled_for']); return a != null ? DateTime.fromMillisecondsSinceEpoch(a, isUtc: true) : null; }();
final isDirty = letBoolOrNull(json?['is_dirty']);
final updatedAt = (){ final a = letIntOrNull(json?['updated_at']); return a != null ? DateTime.fromMillisecondsSinceEpoch(a, isUtc: true) : null; }();
      return ModelLocalDraft(
        id: id,
caption: caption,
hashtags: hashtags,
media: media,
scheduledFor: scheduledFor,
isDirty: isDirty,
updatedAt: updatedAt,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelLocalDraft],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelLocalDraft.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelLocalDraft.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelLocalDraft],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelLocalDraft? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ModelLocalDraft.fromJson(uri.queryParameters);
      } else {
        return ModelLocalDraft.assertRequired();
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
final caption0 = caption?.trim().nullIfEmpty;
final hashtags0 = (){ final a = hashtags; return a != null ? jsonEncode(a.map((p0) => p0?.trim().nullIfEmpty,).nonNulls.nullIfEmpty?.toList()) : null; }();
final media0 = (){ final a = media; return a != null ? jsonEncode(a.map((p0) => p0?.toJson(),).nonNulls.nullIfEmpty?.toList()) : null; }();
final scheduledFor0 = scheduledFor?.toUtc().millisecondsSinceEpoch;
final isDirty0 = isDirty == null ? null : (isDirty! ? 1 : 0);
final updatedAt0 = updatedAt?.toUtc().millisecondsSinceEpoch;
      final withNulls = {
        'updated_at': updatedAt0,'scheduled_for': scheduledFor0,'media': media0,'is_dirty': isDirty0,'id': id0,'hashtags': hashtags0,'caption': caption0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelLocalDraft.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
int get id$ => id!;

  /// Returns the value of the [caption] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get caption$ => caption;

  /// Returns the value of the [hashtags] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
List<String>? get hashtags$ => hashtags;

  /// Returns the value of the [media] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
List<ModelMediaItem>? get media$ => media;

  /// Returns the value of the [scheduledFor] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime? get scheduledFor$ => scheduledFor;

  /// Returns the value of the [isDirty] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
bool? get isDirty$ => isDirty;

  /// Returns the value of the [updatedAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime get updatedAt$ => updatedAt!;

}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelLocalDraftFieldNames {
    /// The field name of [ModelLocalDraft.id].
static const id = 'id';

  /// The field name of [ModelLocalDraft.caption].
static const caption = 'caption';

  /// The field name of [ModelLocalDraft.hashtags].
static const hashtags = 'hashtags';

  /// The field name of [ModelLocalDraft.media].
static const media = 'media';

  /// The field name of [ModelLocalDraft.scheduledFor].
static const scheduledFor = 'scheduled_for';

  /// The field name of [ModelLocalDraft.isDirty].
static const isDirty = 'is_dirty';

  /// The field name of [ModelLocalDraft.updatedAt].
static const updatedAt = 'updated_at';

}

extension ModelLocalDraftX on ModelLocalDraft {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelLocalDraft mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelLocalDraft.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelLocalDraft copyWith({
    int? id,
String? caption,
List<String>? hashtags,
List<ModelMediaItem>? media,
DateTime? scheduledFor,
bool? isDirty,
DateTime? updatedAt,
  }) {
    return ModelLocalDraft.assertRequired(
      id: id ?? this.id,
caption: caption ?? this.caption,
hashtags: hashtags ?? this.hashtags,
media: media ?? this.media,
scheduledFor: scheduledFor ?? this.scheduledFor,
isDirty: isDirty ?? this.isDirty,
updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelLocalDraft copyWithout({
    bool id = true,
bool caption = true,
bool hashtags = true,
bool media = true,
bool scheduledFor = true,
bool isDirty = true,
bool updatedAt = true,
  }) {
    return ModelLocalDraft.assertRequired(
      id: id ? this.id: null,
caption: caption ? this.caption: null,
hashtags: hashtags ? this.hashtags: null,
media: media ? this.media: null,
scheduledFor: scheduledFor ? this.scheduledFor: null,
isDirty: isDirty ? this.isDirty: null,
updatedAt: updatedAt ? this.updatedAt: null,
    );
  }
}