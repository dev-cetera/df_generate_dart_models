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

part of 'model_post.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelPost].
class ModelPost extends _ModelPost with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelPost';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, authorId, visibility, caption, hashtags, media, location, likeCount, createdAt, updatedAt, deletedAt];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final String? id;

  /// No description provided.
final String? authorId;

  /// No description provided.
final PostVisibilityType? visibility;

  /// No description provided.
final String? caption;

  /// No description provided.
final List<String>? hashtags;

  /// No description provided.
final List<ModelMediaItem>? media;

  /// No description provided.
final ModelLocation? location;

  /// No description provided.
final int? likeCount;

  /// No description provided.
final DateTime? createdAt;

  /// No description provided.
final DateTime? updatedAt;

  /// No description provided.
final DateTime? deletedAt;


  /// Constructs a new instance of [ModelPost]
  /// from optional and required parameters.
  const ModelPost({
    required this.id,
required this.authorId,
 this.visibility,
 this.caption,
 this.hashtags,
 this.media,
 this.location,
 this.likeCount,
required this.createdAt,
required this.updatedAt,
 this.deletedAt,
  }) ;

  /// Construcs a new instance of [ModelPost],
  /// forcing all parameters to be optional.
  const ModelPost.optional({
    this.id,
this.authorId,
this.visibility,
this.caption,
this.hashtags,
this.media,
this.location,
this.likeCount,
this.createdAt,
this.updatedAt,
this.deletedAt,
  }) ;


  /// Constructs a new instance of [ModelPost],
  /// and asserts that all required parameters are not null.
  factory ModelPost.assertRequired({
    String? id,
String? authorId,
PostVisibilityType? visibility,
String? caption,
List<String>? hashtags,
List<ModelMediaItem>? media,
ModelLocation? location,
int? likeCount,
DateTime? createdAt,
DateTime? updatedAt,
DateTime? deletedAt,
  }) {
    assert(id != null);
assert(authorId != null);






assert(createdAt != null);
assert(updatedAt != null);

    return ModelPost(
      id: id,
authorId: authorId,
visibility: visibility,
caption: caption,
hashtags: hashtags,
media: media,
location: location,
likeCount: likeCount,
createdAt: createdAt,
updatedAt: updatedAt,
deletedAt: deletedAt,
    );
  }

  /// Constructs a new instance of [ModelPost],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelPost.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelPost.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPost],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelPost? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }


  /// Constructs a new instance of [ModelPost],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelPost.of(
    ModelPost another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelPost.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPost],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelPost? ofOrNull(
    ModelPost? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelPost],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelPost.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelPost.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPost],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelPost? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ModelPost.fromJson(decoded);
      } else {
        return ModelPost.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelPost],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelPost.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelPost.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPost],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelPost? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
final authorId = json?['author_id']?.toString().trim().nullIfEmpty;
final visibility = PostVisibilityType.values.valueOf(json?['visibility']?.toString());
final caption = json?['caption']?.toString().trim().nullIfEmpty;
final hashtags = letListOrNull<dynamic>(json?['hashtags'])?.map((p0) => p0?.toString().trim().nullIfEmpty,).nonNulls.nullIfEmpty?.toList().unmodifiable;
final media = letListOrNull<dynamic>(json?['media'])?.map((p0) => () { final a = letMapOrNull<String, dynamic>(p0); return a != null ? ModelMediaItem.fromJson(a): null; }(),).nonNulls.nullIfEmpty?.toList().unmodifiable;
final location = () { final a = letMapOrNull<String, dynamic>(json?['location']); return a != null ? ModelLocation.fromJson(a): null; }();
final likeCount = letIntOrNull(json?['like_count']);
final createdAt = (){ final a = json?['created_at']?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }();
final updatedAt = (){ final a = json?['updated_at']?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }();
final deletedAt = (){ final a = json?['deleted_at']?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }();
      return ModelPost(
        id: id,
authorId: authorId,
visibility: visibility,
caption: caption,
hashtags: hashtags,
media: media,
location: location,
likeCount: likeCount,
createdAt: createdAt,
updatedAt: updatedAt,
deletedAt: deletedAt,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelPost],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelPost.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelPost.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPost],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelPost? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ModelPost.fromJson(uri.queryParameters);
      } else {
        return ModelPost.assertRequired();
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
final authorId0 = authorId?.trim().nullIfEmpty;
final visibility0 = visibility?.name;
final caption0 = caption?.trim().nullIfEmpty;
final hashtags0 = hashtags?.map((p0) => p0?.trim().nullIfEmpty,).nonNulls.nullIfEmpty?.toList();
final media0 = (){ final a = media; return a != null ? jsonEncode(a.map((p0) => p0?.toJson(),).nonNulls.nullIfEmpty?.toList()) : null; }();
final location0 = location != null ? jsonEncode(location!.toJson()) : null;
final likeCount0 = likeCount;
final createdAt0 = createdAt?.toUtc().toIso8601String();
final updatedAt0 = updatedAt?.toUtc().toIso8601String();
final deletedAt0 = deletedAt?.toUtc().toIso8601String();
      final withNulls = {
        'visibility': visibility0,'updated_at': updatedAt0,'media': media0,'location': location0,'like_count': likeCount0,'id': id0,'hashtags': hashtags0,'deleted_at': deletedAt0,'created_at': createdAt0,'caption': caption0,'author_id': authorId0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelPost.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get id$ => id!;

  /// Returns the value of the [authorId] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get authorId$ => authorId!;

  /// Returns the value of the [visibility] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
PostVisibilityType? get visibility$ => visibility;

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

  /// Returns the value of the [location] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
ModelLocation? get location$ => location;

  /// Returns the value of the [likeCount] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
int? get likeCount$ => likeCount;

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

abstract final class ModelPostFieldNames {
    /// The field name of [ModelPost.id].
static const id = 'id';

  /// The field name of [ModelPost.authorId].
static const authorId = 'author_id';

  /// The field name of [ModelPost.visibility].
static const visibility = 'visibility';

  /// The field name of [ModelPost.caption].
static const caption = 'caption';

  /// The field name of [ModelPost.hashtags].
static const hashtags = 'hashtags';

  /// The field name of [ModelPost.media].
static const media = 'media';

  /// The field name of [ModelPost.location].
static const location = 'location';

  /// The field name of [ModelPost.likeCount].
static const likeCount = 'like_count';

  /// The field name of [ModelPost.createdAt].
static const createdAt = 'created_at';

  /// The field name of [ModelPost.updatedAt].
static const updatedAt = 'updated_at';

  /// The field name of [ModelPost.deletedAt].
static const deletedAt = 'deleted_at';

}

extension ModelPostX on ModelPost {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelPost mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelPost.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelPost copyWith({
    String? id,
String? authorId,
PostVisibilityType? visibility,
String? caption,
List<String>? hashtags,
List<ModelMediaItem>? media,
ModelLocation? location,
int? likeCount,
DateTime? createdAt,
DateTime? updatedAt,
DateTime? deletedAt,
  }) {
    return ModelPost.assertRequired(
      id: id ?? this.id,
authorId: authorId ?? this.authorId,
visibility: visibility ?? this.visibility,
caption: caption ?? this.caption,
hashtags: hashtags ?? this.hashtags,
media: media ?? this.media,
location: location ?? this.location,
likeCount: likeCount ?? this.likeCount,
createdAt: createdAt ?? this.createdAt,
updatedAt: updatedAt ?? this.updatedAt,
deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelPost copyWithout({
    bool id = true,
bool authorId = true,
bool visibility = true,
bool caption = true,
bool hashtags = true,
bool media = true,
bool location = true,
bool likeCount = true,
bool createdAt = true,
bool updatedAt = true,
bool deletedAt = true,
  }) {
    return ModelPost.assertRequired(
      id: id ? this.id: null,
authorId: authorId ? this.authorId: null,
visibility: visibility ? this.visibility: null,
caption: caption ? this.caption: null,
hashtags: hashtags ? this.hashtags: null,
media: media ? this.media: null,
location: location ? this.location: null,
likeCount: likeCount ? this.likeCount: null,
createdAt: createdAt ? this.createdAt: null,
updatedAt: updatedAt ? this.updatedAt: null,
deletedAt: deletedAt ? this.deletedAt: null,
    );
  }
}