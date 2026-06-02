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

part of 'model_thread.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelThread].
class ModelThread extends _ModelThread with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelThread';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, creatorId, title, comments, unreadCount, cacheToken, createdAt];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final String? id;

  /// No description provided.
final String? creatorId;

  /// No description provided.
final String? title;

  /// No description provided.
final List<ModelComment>? comments;

  /// No description provided.
final int? unreadCount;

  /// No description provided.
final String? cacheToken;

  /// No description provided.
final DateTime? createdAt;


  /// Constructs a new instance of [ModelThread]
  /// from optional and required parameters.
  const ModelThread({
    required this.id,
required this.creatorId,
required this.title,
 this.comments,
 this.unreadCount,
 this.cacheToken,
required this.createdAt,
  }) ;

  /// Construcs a new instance of [ModelThread],
  /// forcing all parameters to be optional.
  const ModelThread.optional({
    this.id,
this.creatorId,
this.title,
this.comments,
this.unreadCount,
this.cacheToken,
this.createdAt,
  }) ;


  /// Constructs a new instance of [ModelThread],
  /// and asserts that all required parameters are not null.
  factory ModelThread.assertRequired({
    String? id,
String? creatorId,
String? title,
List<ModelComment>? comments,
int? unreadCount,
String? cacheToken,
DateTime? createdAt,
  }) {
    assert(id != null);
assert(creatorId != null);
assert(title != null);



assert(createdAt != null);
    return ModelThread(
      id: id,
creatorId: creatorId,
title: title,
comments: comments,
unreadCount: unreadCount,
cacheToken: cacheToken,
createdAt: createdAt,
    );
  }

  /// Constructs a new instance of [ModelThread],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelThread.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelThread.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelThread],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelThread? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }


  /// Constructs a new instance of [ModelThread],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelThread.of(
    ModelThread another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelThread.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelThread],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelThread? ofOrNull(
    ModelThread? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelThread],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelThread.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelThread.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelThread],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelThread? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelThread.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelThread],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelThread.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelThread.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelThread],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelThread? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
final creatorId = json?['creator_id']?.toString().trim().nullIfEmpty;
final title = json?['title']?.toString().trim().nullIfEmpty;
final comments = letListOrNull<dynamic>(json?['comments'])?.map((p0) => () { final a = letMapOrNull<String, dynamic>(p0); return a != null ? ModelComment.fromJson(a): null; }(),).nonNulls.nullIfEmpty?.toList().unmodifiable;
final unreadCount = letIntOrNull(json?['unread_count']);
final cacheToken = json?['cache_token']?.toString().trim().nullIfEmpty;
final createdAt = (){ final a = json?['created_at']?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }();
      return ModelThread(
        id: id,
creatorId: creatorId,
title: title,
comments: comments,
unreadCount: unreadCount,
cacheToken: cacheToken,
createdAt: createdAt,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelThread],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelThread.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelThread.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelThread],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelThread? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelThread.fromJsonOrNull(uri.queryParameters);
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
final creatorId0 = creatorId?.trim().nullIfEmpty;
final title0 = title?.trim().nullIfEmpty;
final comments0 = (){ final a = comments; return a != null ? jsonEncode(a.map((p0) => p0?.toJson(),).nonNulls.nullIfEmpty?.toList()) : null; }();
final unreadCount0 = unreadCount;
final cacheToken0 = cacheToken?.trim().nullIfEmpty;
final createdAt0 = createdAt?.toUtc().toIso8601String();
      final withNulls = {
        'unread_count': unreadCount0,'title': title0,'id': id0,'creator_id': creatorId0,'created_at': createdAt0,'comments': comments0,'cache_token': cacheToken0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelThread.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get id$ => id!;

  /// Returns the value of the [creatorId] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get creatorId$ => creatorId!;

  /// Returns the value of the [title] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get title$ => title!;

  /// Returns the value of the [comments] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
List<ModelComment>? get comments$ => comments;

  /// Returns the value of the [unreadCount] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
int? get unreadCount$ => unreadCount;

  /// Returns the value of the [cacheToken] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get cacheToken$ => cacheToken;

  /// Returns the value of the [createdAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime get createdAt$ => createdAt!;

}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelThreadFieldNames {
    /// The field name of [ModelThread.id].
static const id = 'id';

  /// The field name of [ModelThread.creatorId].
static const creatorId = 'creator_id';

  /// The field name of [ModelThread.title].
static const title = 'title';

  /// The field name of [ModelThread.comments].
static const comments = 'comments';

  /// The field name of [ModelThread.unreadCount].
static const unreadCount = 'unread_count';

  /// The field name of [ModelThread.cacheToken].
static const cacheToken = 'cache_token';

  /// The field name of [ModelThread.createdAt].
static const createdAt = 'created_at';

}

extension ModelThreadX on ModelThread {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelThread mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelThread.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelThread copyWith({
    String? id,
String? creatorId,
String? title,
List<ModelComment>? comments,
int? unreadCount,
String? cacheToken,
DateTime? createdAt,
  }) {
    return ModelThread.assertRequired(
      id: id ?? this.id,
creatorId: creatorId ?? this.creatorId,
title: title ?? this.title,
comments: comments ?? this.comments,
unreadCount: unreadCount ?? this.unreadCount,
cacheToken: cacheToken ?? this.cacheToken,
createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelThread copyWithout({
    bool id = true,
bool creatorId = true,
bool title = true,
bool comments = true,
bool unreadCount = true,
bool cacheToken = true,
bool createdAt = true,
  }) {
    return ModelThread.assertRequired(
      id: id ? this.id: null,
creatorId: creatorId ? this.creatorId: null,
title: title ? this.title: null,
comments: comments ? this.comments: null,
unreadCount: unreadCount ? this.unreadCount: null,
cacheToken: cacheToken ? this.cacheToken: null,
createdAt: createdAt ? this.createdAt: null,
    );
  }
}