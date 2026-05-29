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

/// Generated class for [_ModelPgPost].
class ModelPgPost extends _ModelPgPost with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelPgPost';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, authorId, title, body, status, tags, extra, metadata, createdAt, updatedAt];

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
final String? title;

  /// No description provided.
final String? body;

  /// No description provided.
final PostStatusKindType? status;

  /// No description provided.
final List<String>? tags;

  /// No description provided.
final Map<String,dynamic>? extra;

  /// No description provided.
final ModelPostMetadata? metadata;

  /// No description provided.
final DateTime? createdAt;

  /// No description provided.
final DateTime? updatedAt;


  /// Constructs a new instance of [ModelPgPost]
  /// from optional and required parameters.
  const ModelPgPost({
    required this.id,
required this.authorId,
required this.title,
 this.body,
 this.status,
 this.tags,
 this.extra,
 this.metadata,
required this.createdAt,
required this.updatedAt,
  }) ;

  /// Construcs a new instance of [ModelPgPost],
  /// forcing all parameters to be optional.
  const ModelPgPost.optional({
    this.id,
this.authorId,
this.title,
this.body,
this.status,
this.tags,
this.extra,
this.metadata,
this.createdAt,
this.updatedAt,
  }) ;


  /// Constructs a new instance of [ModelPgPost],
  /// and asserts that all required parameters are not null.
  factory ModelPgPost.assertRequired({
    String? id,
String? authorId,
String? title,
String? body,
PostStatusKindType? status,
List<String>? tags,
Map<String,dynamic>? extra,
ModelPostMetadata? metadata,
DateTime? createdAt,
DateTime? updatedAt,
  }) {
    assert(id != null);
assert(authorId != null);
assert(title != null);





assert(createdAt != null);
assert(updatedAt != null);
    return ModelPgPost(
      id: id,
authorId: authorId,
title: title,
body: body,
status: status,
tags: tags,
extra: extra,
metadata: metadata,
createdAt: createdAt,
updatedAt: updatedAt,
    );
  }

  /// Constructs a new instance of [ModelPgPost],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelPgPost.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelPgPost.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPgPost],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelPgPost? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }


  /// Constructs a new instance of [ModelPgPost],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelPgPost.of(
    ModelPgPost another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelPgPost.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPgPost],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelPgPost? ofOrNull(
    ModelPgPost? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelPgPost],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelPgPost.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelPgPost.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPgPost],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelPgPost? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ModelPgPost.fromJson(decoded);
      } else {
        return ModelPgPost.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelPgPost],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelPgPost.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelPgPost.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPgPost],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelPgPost? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
final authorId = json?['author_id']?.toString().trim().nullIfEmpty;
final title = json?['title']?.toString().trim().nullIfEmpty;
final body = json?['body']?.toString().trim().nullIfEmpty;
final status = PostStatusKindType.values.valueOf(json?['status']?.toString()) ?? PostStatusKindType.draft;
final tags = letListOrNull<dynamic>(json?['tags'])?.map((p0) => p0?.toString().trim().nullIfEmpty,).nonNulls.nullIfEmpty?.toList().unmodifiable;
final extra = letMapOrNull<dynamic, dynamic>(json?['extra'])?.map((p0, p1) => MapEntry(p0?.toString().trim().nullIfEmpty, p1,),).nonNulls.nullIfEmpty?.unmodifiable;
final metadata = () { final a = letMapOrNull<String, dynamic>(json?['metadata']); return a != null ? ModelPostMetadata.fromJson(a): null; }();
final createdAt = (){ final a = json?['created_at']?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }();
final updatedAt = (){ final a = json?['updated_at']?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }();
      return ModelPgPost(
        id: id,
authorId: authorId,
title: title,
body: body,
status: status,
tags: tags,
extra: extra,
metadata: metadata,
createdAt: createdAt,
updatedAt: updatedAt,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelPgPost],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelPgPost.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelPgPost.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelPgPost],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelPgPost? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ModelPgPost.fromJson(uri.queryParameters);
      } else {
        return ModelPgPost.assertRequired();
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
final title0 = title?.trim().nullIfEmpty;
final body0 = body?.trim().nullIfEmpty;
final status0 = status?.name;
final tags0 = tags?.map((p0) => p0?.trim().nullIfEmpty,).nonNulls.nullIfEmpty?.toList();
final extra0 = (){ final a = extra; return a != null ? jsonEncode(a.map((p0, p1) => MapEntry(p0?.trim().nullIfEmpty, p1,)).nonNulls.nullIfEmpty) : null; }();
final metadata0 = metadata != null ? jsonEncode(metadata!.toJson()) : null;
final createdAt0 = createdAt?.toUtc().toIso8601String();
final updatedAt0 = updatedAt?.toUtc().toIso8601String();
      final withNulls = {
        'updated_at': updatedAt0,'title': title0,'tags': tags0,'status': status0,'metadata': metadata0,'id': id0,'extra': extra0,'created_at': createdAt0,'body': body0,'author_id': authorId0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelPgPost.toJson: $e');
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

  /// Returns the value of the [title] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get title$ => title!;

  /// Returns the value of the [body] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get body$ => body;

  /// Returns the value of the [status] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
PostStatusKindType? get status$ => status;

  /// Returns the value of the [tags] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
List<String>? get tags$ => tags;

  /// Returns the value of the [extra] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
Map<String,dynamic>? get extra$ => extra;

  /// Returns the value of the [metadata] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
ModelPostMetadata? get metadata$ => metadata;

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

abstract final class ModelPgPostFieldNames {
    /// The field name of [ModelPgPost.id].
static const id = 'id';

  /// The field name of [ModelPgPost.authorId].
static const authorId = 'author_id';

  /// The field name of [ModelPgPost.title].
static const title = 'title';

  /// The field name of [ModelPgPost.body].
static const body = 'body';

  /// The field name of [ModelPgPost.status].
static const status = 'status';

  /// The field name of [ModelPgPost.tags].
static const tags = 'tags';

  /// The field name of [ModelPgPost.extra].
static const extra = 'extra';

  /// The field name of [ModelPgPost.metadata].
static const metadata = 'metadata';

  /// The field name of [ModelPgPost.createdAt].
static const createdAt = 'created_at';

  /// The field name of [ModelPgPost.updatedAt].
static const updatedAt = 'updated_at';

}

extension ModelPgPostX on ModelPgPost {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelPgPost mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelPgPost.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelPgPost copyWith({
    String? id,
String? authorId,
String? title,
String? body,
PostStatusKindType? status,
List<String>? tags,
Map<String,dynamic>? extra,
ModelPostMetadata? metadata,
DateTime? createdAt,
DateTime? updatedAt,
  }) {
    return ModelPgPost.assertRequired(
      id: id ?? this.id,
authorId: authorId ?? this.authorId,
title: title ?? this.title,
body: body ?? this.body,
status: status ?? this.status,
tags: tags ?? this.tags,
extra: extra ?? this.extra,
metadata: metadata ?? this.metadata,
createdAt: createdAt ?? this.createdAt,
updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelPgPost copyWithout({
    bool id = true,
bool authorId = true,
bool title = true,
bool body = true,
bool status = true,
bool tags = true,
bool extra = true,
bool metadata = true,
bool createdAt = true,
bool updatedAt = true,
  }) {
    return ModelPgPost.assertRequired(
      id: id ? this.id: null,
authorId: authorId ? this.authorId: null,
title: title ? this.title: null,
body: body ? this.body: null,
status: status ? this.status: null,
tags: tags ? this.tags: null,
extra: extra ? this.extra: null,
metadata: metadata ? this.metadata: null,
createdAt: createdAt ? this.createdAt: null,
updatedAt: updatedAt ? this.updatedAt: null,
    );
  }
}