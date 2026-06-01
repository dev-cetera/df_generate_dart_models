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

part of 'model_feed_cache.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelFeedCache].
class ModelFeedCache extends _ModelFeedCache with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelFeedCache';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, postId, authorId, caption, visibility, media, isUnread, likeCount, fetchedAt, expiresAt, previewBlob];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final int? id;

  /// No description provided.
final String? postId;

  /// No description provided.
final String? authorId;

  /// No description provided.
final String? caption;

  /// No description provided.
final String? visibility;

  /// No description provided.
final List<ModelMediaItem>? media;

  /// No description provided.
final bool? isUnread;

  /// No description provided.
final int? likeCount;

  /// No description provided.
final DateTime? fetchedAt;

  /// No description provided.
final DateTime? expiresAt;

  /// No description provided.
final Uint8List? previewBlob;


  /// Constructs a new instance of [ModelFeedCache]
  /// from optional and required parameters.
  const ModelFeedCache({
    required this.id,
required this.postId,
required this.authorId,
 this.caption,
 this.visibility,
 this.media,
 this.isUnread,
 this.likeCount,
required this.fetchedAt,
 this.expiresAt,
 this.previewBlob,
  }) ;

  /// Construcs a new instance of [ModelFeedCache],
  /// forcing all parameters to be optional.
  const ModelFeedCache.optional({
    this.id,
this.postId,
this.authorId,
this.caption,
this.visibility,
this.media,
this.isUnread,
this.likeCount,
this.fetchedAt,
this.expiresAt,
this.previewBlob,
  }) ;


  /// Constructs a new instance of [ModelFeedCache],
  /// and asserts that all required parameters are not null.
  factory ModelFeedCache.assertRequired({
    int? id,
String? postId,
String? authorId,
String? caption,
String? visibility,
List<ModelMediaItem>? media,
bool? isUnread,
int? likeCount,
DateTime? fetchedAt,
DateTime? expiresAt,
Uint8List? previewBlob,
  }) {
    assert(id != null);
assert(postId != null);
assert(authorId != null);





assert(fetchedAt != null);


    return ModelFeedCache(
      id: id,
postId: postId,
authorId: authorId,
caption: caption,
visibility: visibility,
media: media,
isUnread: isUnread,
likeCount: likeCount,
fetchedAt: fetchedAt,
expiresAt: expiresAt,
previewBlob: previewBlob,
    );
  }

  /// Constructs a new instance of [ModelFeedCache],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelFeedCache.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelFeedCache.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFeedCache],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelFeedCache? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }


  /// Constructs a new instance of [ModelFeedCache],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelFeedCache.of(
    ModelFeedCache another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelFeedCache.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFeedCache],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelFeedCache? ofOrNull(
    ModelFeedCache? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelFeedCache],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelFeedCache.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelFeedCache.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFeedCache],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelFeedCache? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ModelFeedCache.fromJson(decoded);
      } else {
        return ModelFeedCache.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelFeedCache],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelFeedCache.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelFeedCache.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFeedCache],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelFeedCache? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = letIntOrNull(json?['id']);
final postId = json?['post_id']?.toString().trim().nullIfEmpty;
final authorId = json?['author_id']?.toString().trim().nullIfEmpty;
final caption = json?['caption']?.toString().trim().nullIfEmpty;
final visibility = json?['visibility']?.toString().trim().nullIfEmpty;
final media = letListOrNull<dynamic>(json?['media'])?.map((p0) => () { final a = letMapOrNull<String, dynamic>(p0); return a != null ? ModelMediaItem.fromJson(a): null; }(),).nonNulls.nullIfEmpty?.toList().unmodifiable;
final isUnread = letBoolOrNull(json?['is_unread']);
final likeCount = letIntOrNull(json?['like_count']);
final fetchedAt = (){ final a = letIntOrNull(json?['fetched_at']); return a != null ? DateTime.fromMillisecondsSinceEpoch(a, isUtc: true) : null; }();
final expiresAt = (){ final a = letIntOrNull(json?['expires_at']); return a != null ? DateTime.fromMillisecondsSinceEpoch(a, isUtc: true) : null; }();
final previewBlob = letAsOrNull<Uint8List>(json?['preview_blob']);
      return ModelFeedCache(
        id: id,
postId: postId,
authorId: authorId,
caption: caption,
visibility: visibility,
media: media,
isUnread: isUnread,
likeCount: likeCount,
fetchedAt: fetchedAt,
expiresAt: expiresAt,
previewBlob: previewBlob,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelFeedCache],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelFeedCache.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelFeedCache.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFeedCache],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelFeedCache? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ModelFeedCache.fromJson(uri.queryParameters);
      } else {
        return ModelFeedCache.assertRequired();
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
final postId0 = postId?.trim().nullIfEmpty;
final authorId0 = authorId?.trim().nullIfEmpty;
final caption0 = caption?.trim().nullIfEmpty;
final visibility0 = visibility?.trim().nullIfEmpty;
final media0 = (){ final a = media; return a != null ? jsonEncode(a.map((p0) => p0?.toJson(),).nonNulls.nullIfEmpty?.toList()) : null; }();
final isUnread0 = isUnread == null ? null : (isUnread! ? 1 : 0);
final likeCount0 = likeCount;
final fetchedAt0 = fetchedAt?.toUtc().millisecondsSinceEpoch;
final expiresAt0 = expiresAt?.toUtc().millisecondsSinceEpoch;
final previewBlob0 = previewBlob;
      final withNulls = {
        'visibility': visibility0,'preview_blob': previewBlob0,'post_id': postId0,'media': media0,'like_count': likeCount0,'is_unread': isUnread0,'id': id0,'fetched_at': fetchedAt0,'expires_at': expiresAt0,'caption': caption0,'author_id': authorId0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelFeedCache.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
int get id$ => id!;

  /// Returns the value of the [postId] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get postId$ => postId!;

  /// Returns the value of the [authorId] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get authorId$ => authorId!;

  /// Returns the value of the [caption] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get caption$ => caption;

  /// Returns the value of the [visibility] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get visibility$ => visibility;

  /// Returns the value of the [media] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
List<ModelMediaItem>? get media$ => media;

  /// Returns the value of the [isUnread] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
bool? get isUnread$ => isUnread;

  /// Returns the value of the [likeCount] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
int? get likeCount$ => likeCount;

  /// Returns the value of the [fetchedAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime get fetchedAt$ => fetchedAt!;

  /// Returns the value of the [expiresAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime? get expiresAt$ => expiresAt;

  /// Returns the value of the [previewBlob] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
Uint8List? get previewBlob$ => previewBlob;

}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelFeedCacheFieldNames {
    /// The field name of [ModelFeedCache.id].
static const id = 'id';

  /// The field name of [ModelFeedCache.postId].
static const postId = 'post_id';

  /// The field name of [ModelFeedCache.authorId].
static const authorId = 'author_id';

  /// The field name of [ModelFeedCache.caption].
static const caption = 'caption';

  /// The field name of [ModelFeedCache.visibility].
static const visibility = 'visibility';

  /// The field name of [ModelFeedCache.media].
static const media = 'media';

  /// The field name of [ModelFeedCache.isUnread].
static const isUnread = 'is_unread';

  /// The field name of [ModelFeedCache.likeCount].
static const likeCount = 'like_count';

  /// The field name of [ModelFeedCache.fetchedAt].
static const fetchedAt = 'fetched_at';

  /// The field name of [ModelFeedCache.expiresAt].
static const expiresAt = 'expires_at';

  /// The field name of [ModelFeedCache.previewBlob].
static const previewBlob = 'preview_blob';

}

extension ModelFeedCacheX on ModelFeedCache {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelFeedCache mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelFeedCache.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelFeedCache copyWith({
    int? id,
String? postId,
String? authorId,
String? caption,
String? visibility,
List<ModelMediaItem>? media,
bool? isUnread,
int? likeCount,
DateTime? fetchedAt,
DateTime? expiresAt,
Uint8List? previewBlob,
  }) {
    return ModelFeedCache.assertRequired(
      id: id ?? this.id,
postId: postId ?? this.postId,
authorId: authorId ?? this.authorId,
caption: caption ?? this.caption,
visibility: visibility ?? this.visibility,
media: media ?? this.media,
isUnread: isUnread ?? this.isUnread,
likeCount: likeCount ?? this.likeCount,
fetchedAt: fetchedAt ?? this.fetchedAt,
expiresAt: expiresAt ?? this.expiresAt,
previewBlob: previewBlob ?? this.previewBlob,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelFeedCache copyWithout({
    bool id = true,
bool postId = true,
bool authorId = true,
bool caption = true,
bool visibility = true,
bool media = true,
bool isUnread = true,
bool likeCount = true,
bool fetchedAt = true,
bool expiresAt = true,
bool previewBlob = true,
  }) {
    return ModelFeedCache.assertRequired(
      id: id ? this.id: null,
postId: postId ? this.postId: null,
authorId: authorId ? this.authorId: null,
caption: caption ? this.caption: null,
visibility: visibility ? this.visibility: null,
media: media ? this.media: null,
isUnread: isUnread ? this.isUnread: null,
likeCount: likeCount ? this.likeCount: null,
fetchedAt: fetchedAt ? this.fetchedAt: null,
expiresAt: expiresAt ? this.expiresAt: null,
previewBlob: previewBlob ? this.previewBlob: null,
    );
  }
}