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

part of 'model_follow_edge.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelFollowEdge].
class ModelFollowEdge extends _ModelFollowEdge with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelFollowEdge';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, followerId, followeeId, status, createdAt];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final String? id;

  /// No description provided.
final String? followerId;

  /// No description provided.
final String? followeeId;

  /// No description provided.
final FollowStatusType? status;

  /// No description provided.
final DateTime? createdAt;


  /// Constructs a new instance of [ModelFollowEdge]
  /// from optional and required parameters.
  const ModelFollowEdge({
    required this.id,
required this.followerId,
required this.followeeId,
 this.status,
required this.createdAt,
  }) ;

  /// Construcs a new instance of [ModelFollowEdge],
  /// forcing all parameters to be optional.
  const ModelFollowEdge.optional({
    this.id,
this.followerId,
this.followeeId,
this.status,
this.createdAt,
  }) ;


  /// Constructs a new instance of [ModelFollowEdge],
  /// and asserts that all required parameters are not null.
  factory ModelFollowEdge.assertRequired({
    String? id,
String? followerId,
String? followeeId,
FollowStatusType? status,
DateTime? createdAt,
  }) {
    assert(id != null);
assert(followerId != null);
assert(followeeId != null);

assert(createdAt != null);
    return ModelFollowEdge(
      id: id,
followerId: followerId,
followeeId: followeeId,
status: status,
createdAt: createdAt,
    );
  }

  /// Constructs a new instance of [ModelFollowEdge],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelFollowEdge.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelFollowEdge.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFollowEdge],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelFollowEdge? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }


  /// Constructs a new instance of [ModelFollowEdge],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelFollowEdge.of(
    ModelFollowEdge another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelFollowEdge.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFollowEdge],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelFollowEdge? ofOrNull(
    ModelFollowEdge? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelFollowEdge],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelFollowEdge.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelFollowEdge.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFollowEdge],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelFollowEdge? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ModelFollowEdge.fromJson(decoded);
      } else {
        return ModelFollowEdge.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelFollowEdge],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelFollowEdge.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelFollowEdge.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFollowEdge],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelFollowEdge? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
final followerId = json?['follower_id']?.toString().trim().nullIfEmpty;
final followeeId = json?['followee_id']?.toString().trim().nullIfEmpty;
final status = FollowStatusType.values.valueOf(json?['status']?.toString()) ?? 'accepted';
final createdAt = (){ final a = json?['created_at']?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }();
      return ModelFollowEdge(
        id: id,
followerId: followerId,
followeeId: followeeId,
status: status,
createdAt: createdAt,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelFollowEdge],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelFollowEdge.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelFollowEdge.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFollowEdge],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelFollowEdge? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ModelFollowEdge.fromJson(uri.queryParameters);
      } else {
        return ModelFollowEdge.assertRequired();
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
final followerId0 = followerId?.trim().nullIfEmpty;
final followeeId0 = followeeId?.trim().nullIfEmpty;
final status0 = status?.name;
final createdAt0 = createdAt?.toUtc().toIso8601String();
      final withNulls = {
        'status': status0,'id': id0,'follower_id': followerId0,'followee_id': followeeId0,'created_at': createdAt0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelFollowEdge.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get id$ => id!;

  /// Returns the value of the [followerId] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get followerId$ => followerId!;

  /// Returns the value of the [followeeId] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get followeeId$ => followeeId!;

  /// Returns the value of the [status] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
FollowStatusType? get status$ => status;

  /// Returns the value of the [createdAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime get createdAt$ => createdAt!;

}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelFollowEdgeFieldNames {
    /// The field name of [ModelFollowEdge.id].
static const id = 'id';

  /// The field name of [ModelFollowEdge.followerId].
static const followerId = 'follower_id';

  /// The field name of [ModelFollowEdge.followeeId].
static const followeeId = 'followee_id';

  /// The field name of [ModelFollowEdge.status].
static const status = 'status';

  /// The field name of [ModelFollowEdge.createdAt].
static const createdAt = 'created_at';

}

extension ModelFollowEdgeX on ModelFollowEdge {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelFollowEdge mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelFollowEdge.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelFollowEdge copyWith({
    String? id,
String? followerId,
String? followeeId,
FollowStatusType? status,
DateTime? createdAt,
  }) {
    return ModelFollowEdge.assertRequired(
      id: id ?? this.id,
followerId: followerId ?? this.followerId,
followeeId: followeeId ?? this.followeeId,
status: status ?? this.status,
createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelFollowEdge copyWithout({
    bool id = true,
bool followerId = true,
bool followeeId = true,
bool status = true,
bool createdAt = true,
  }) {
    return ModelFollowEdge.assertRequired(
      id: id ? this.id: null,
followerId: followerId ? this.followerId: null,
followeeId: followeeId ? this.followeeId: null,
status: status ? this.status: null,
createdAt: createdAt ? this.createdAt: null,
    );
  }
}