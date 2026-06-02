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

part of 'model_comment.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelComment].
class ModelComment extends _ModelComment with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelComment';

  @override
  String get $className => CLASS_NAME;

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [
        id,
        postId,
        authorId,
        parentId,
        body,
        status,
        likeCount,
        createdAt,
        updatedAt
      ];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

  /// No description provided.
  final String? id;

  /// No description provided.
  final String? postId;

  /// No description provided.
  final String? authorId;

  /// No description provided.
  final String? parentId;

  /// No description provided.
  final String? body;

  /// No description provided.
  final CommentStatusType? status;

  /// No description provided.
  final int? likeCount;

  /// No description provided.
  final DateTime? createdAt;

  /// No description provided.
  final DateTime? updatedAt;

  /// Constructs a new instance of [ModelComment]
  /// from optional and required parameters.
  const ModelComment({
    required this.id,
    required this.postId,
    required this.authorId,
    this.parentId,
    required this.body,
    this.status,
    this.likeCount,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Construcs a new instance of [ModelComment],
  /// forcing all parameters to be optional.
  const ModelComment.optional({
    this.id,
    this.postId,
    this.authorId,
    this.parentId,
    this.body,
    this.status,
    this.likeCount,
    this.createdAt,
    this.updatedAt,
  });

  /// Constructs a new instance of [ModelComment],
  /// and asserts that all required parameters are not null.
  factory ModelComment.assertRequired({
    String? id,
    String? postId,
    String? authorId,
    String? parentId,
    String? body,
    CommentStatusType? status,
    int? likeCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    assert(id != null);
    assert(postId != null);
    assert(authorId != null);

    assert(body != null);

    assert(createdAt != null);
    assert(updatedAt != null);
    return ModelComment(
      id: id,
      postId: postId,
      authorId: authorId,
      parentId: parentId,
      body: body,
      status: status,
      likeCount: likeCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Constructs a new instance of [ModelComment],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelComment.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelComment.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelComment],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelComment? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [ModelComment],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelComment.of(
    ModelComment another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelComment.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelComment],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelComment? ofOrNull(
    ModelComment? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelComment],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelComment.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelComment.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelComment],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelComment? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelComment.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelComment],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelComment.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelComment.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelComment],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelComment? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
      final postId = json?['post_id']?.toString().trim().nullIfEmpty;
      final authorId = json?['author_id']?.toString().trim().nullIfEmpty;
      final parentId = json?['parent_id']?.toString().trim().nullIfEmpty;
      final body = json?['body']?.toString().trim().nullIfEmpty;
      final status =
          CommentStatusType.values.valueOf(json?['status']?.toString());
      final likeCount = letIntOrNull(json?['like_count']);
      final createdAt = () {
        final a = json?['created_at']?.toString().trim().nullIfEmpty;
        return a != null ? DateTime.tryParse(a)?.toUtc() : null;
      }();
      final updatedAt = () {
        final a = json?['updated_at']?.toString().trim().nullIfEmpty;
        return a != null ? DateTime.tryParse(a)?.toUtc() : null;
      }();
      return ModelComment(
        id: id,
        postId: postId,
        authorId: authorId,
        parentId: parentId,
        body: body,
        status: status,
        likeCount: likeCount,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelComment],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelComment.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelComment.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelComment],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelComment? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelComment.fromJsonOrNull(uri.queryParameters);
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
      final postId0 = postId?.trim().nullIfEmpty;
      final authorId0 = authorId?.trim().nullIfEmpty;
      final parentId0 = parentId?.trim().nullIfEmpty;
      final body0 = body?.trim().nullIfEmpty;
      final status0 = status?.name;
      final likeCount0 = likeCount;
      final createdAt0 = createdAt?.toUtc().toIso8601String();
      final updatedAt0 = updatedAt?.toUtc().toIso8601String();
      final withNulls = {
        'updated_at': updatedAt0,
        'status': status0,
        'post_id': postId0,
        'parent_id': parentId0,
        'like_count': likeCount0,
        'id': id0,
        'created_at': createdAt0,
        'body': body0,
        'author_id': authorId0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelComment.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String get id$ => id!;

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

  /// Returns the value of the [parentId] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get parentId$ => parentId;

  /// Returns the value of the [body] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String get body$ => body!;

  /// Returns the value of the [status] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  CommentStatusType? get status$ => status;

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
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelCommentFieldNames {
  /// The field name of [ModelComment.id].
  static const id = 'id';

  /// The field name of [ModelComment.postId].
  static const postId = 'post_id';

  /// The field name of [ModelComment.authorId].
  static const authorId = 'author_id';

  /// The field name of [ModelComment.parentId].
  static const parentId = 'parent_id';

  /// The field name of [ModelComment.body].
  static const body = 'body';

  /// The field name of [ModelComment.status].
  static const status = 'status';

  /// The field name of [ModelComment.likeCount].
  static const likeCount = 'like_count';

  /// The field name of [ModelComment.createdAt].
  static const createdAt = 'created_at';

  /// The field name of [ModelComment.updatedAt].
  static const updatedAt = 'updated_at';
}

extension ModelCommentX on ModelComment {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelComment mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelComment.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelComment copyWith({
    String? id,
    String? postId,
    String? authorId,
    String? parentId,
    String? body,
    CommentStatusType? status,
    int? likeCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ModelComment.assertRequired(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      authorId: authorId ?? this.authorId,
      parentId: parentId ?? this.parentId,
      body: body ?? this.body,
      status: status ?? this.status,
      likeCount: likeCount ?? this.likeCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelComment copyWithout({
    bool id = true,
    bool postId = true,
    bool authorId = true,
    bool parentId = true,
    bool body = true,
    bool status = true,
    bool likeCount = true,
    bool createdAt = true,
    bool updatedAt = true,
  }) {
    return ModelComment.assertRequired(
      id: id ? this.id : null,
      postId: postId ? this.postId : null,
      authorId: authorId ? this.authorId : null,
      parentId: parentId ? this.parentId : null,
      body: body ? this.body : null,
      status: status ? this.status : null,
      likeCount: likeCount ? this.likeCount : null,
      createdAt: createdAt ? this.createdAt : null,
      updatedAt: updatedAt ? this.updatedAt : null,
    );
  }
}
