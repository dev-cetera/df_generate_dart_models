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

part of 'model_notification.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelNotification].
class ModelNotification extends _ModelNotification with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelNotification';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, recipientRef, actorRef, kind, title, body, previewMedia, readAt, createdAt];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final String? id;

  /// No description provided.
final String? recipientRef;

  /// No description provided.
final String? actorRef;

  /// No description provided.
final NotificationKindType? kind;

  /// No description provided.
final String? title;

  /// No description provided.
final String? body;

  /// No description provided.
final ModelMediaItem? previewMedia;

  /// No description provided.
final DateTime? readAt;

  /// No description provided.
final DateTime? createdAt;


  /// Constructs a new instance of [ModelNotification]
  /// from optional and required parameters.
  const ModelNotification({
    required this.id,
required this.recipientRef,
 this.actorRef,
required this.kind,
required this.title,
 this.body,
 this.previewMedia,
 this.readAt,
 this.createdAt,
  }) ;

  /// Construcs a new instance of [ModelNotification],
  /// forcing all parameters to be optional.
  const ModelNotification.optional({
    this.id,
this.recipientRef,
this.actorRef,
this.kind,
this.title,
this.body,
this.previewMedia,
this.readAt,
this.createdAt,
  }) ;


  /// Constructs a new instance of [ModelNotification],
  /// and asserts that all required parameters are not null.
  factory ModelNotification.assertRequired({
    String? id,
String? recipientRef,
String? actorRef,
NotificationKindType? kind,
String? title,
String? body,
ModelMediaItem? previewMedia,
DateTime? readAt,
DateTime? createdAt,
  }) {
    assert(id != null);
assert(recipientRef != null);

assert(kind != null);
assert(title != null);




    return ModelNotification(
      id: id,
recipientRef: recipientRef,
actorRef: actorRef,
kind: kind,
title: title,
body: body,
previewMedia: previewMedia,
readAt: readAt,
createdAt: createdAt,
    );
  }

  /// Constructs a new instance of [ModelNotification],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelNotification.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelNotification.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelNotification],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelNotification? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }


  /// Constructs a new instance of [ModelNotification],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelNotification.of(
    ModelNotification another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelNotification.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelNotification],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelNotification? ofOrNull(
    ModelNotification? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelNotification],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelNotification.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelNotification.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelNotification],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelNotification? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ModelNotification.fromJson(decoded);
      } else {
        return ModelNotification.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelNotification],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelNotification.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelNotification.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelNotification],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelNotification? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
final recipientRef = letAsOrNull<DocumentReference>(json?['recipientRef'])?.path ?? json?['recipientRef']?.toString().trim().nullIfEmpty;
final actorRef = letAsOrNull<DocumentReference>(json?['actorRef'])?.path ?? json?['actorRef']?.toString().trim().nullIfEmpty;
final kind = NotificationKindType.values.valueOf(json?['kind']?.toString());
final title = json?['title']?.toString().trim().nullIfEmpty;
final body = json?['body']?.toString().trim().nullIfEmpty;
final previewMedia = () { final a = letMapOrNull<String, dynamic>(json?['previewMedia']); return a != null ? ModelMediaItem.fromJson(a): null; }();
final readAt = letAsOrNull<Timestamp>(json?['readAt'])?.toDate().toUtc();
final createdAt = letAsOrNull<Timestamp>(json?['createdAt'])?.toDate().toUtc();
      return ModelNotification(
        id: id,
recipientRef: recipientRef,
actorRef: actorRef,
kind: kind,
title: title,
body: body,
previewMedia: previewMedia,
readAt: readAt,
createdAt: createdAt,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelNotification],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelNotification.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelNotification.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelNotification],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelNotification? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ModelNotification.fromJson(uri.queryParameters);
      } else {
        return ModelNotification.assertRequired();
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
final recipientRef0 = recipientRef?.trim().nullIfEmpty;
final actorRef0 = actorRef?.trim().nullIfEmpty;
final kind0 = kind?.name;
final title0 = title?.trim().nullIfEmpty;
final body0 = body?.trim().nullIfEmpty;
final previewMedia0 = previewMedia?.toJson();
final readAt0 = readAt != null ? Timestamp.fromDate(readAt!.toUtc()) : null;
final createdAt0 = FieldValue.serverTimestamp();
      final withNulls = {
        'title': title0,'recipientRef': recipientRef0,'readAt': readAt0,'previewMedia': previewMedia0,'kind': kind0,'id': id0,'createdAt': createdAt0,'body': body0,'actorRef': actorRef0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelNotification.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get id$ => id!;

  /// Returns the value of the [recipientRef] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get recipientRef$ => recipientRef!;

  /// Returns the value of the [actorRef] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get actorRef$ => actorRef;

  /// Returns the value of the [kind] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
NotificationKindType get kind$ => kind!;

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

  /// Returns the value of the [previewMedia] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
ModelMediaItem? get previewMedia$ => previewMedia;

  /// Returns the value of the [readAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime? get readAt$ => readAt;

  /// Returns the value of the [createdAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
DateTime? get createdAt$ => createdAt;

}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelNotificationFieldNames {
    /// The field name of [ModelNotification.id].
static const id = 'id';

  /// The field name of [ModelNotification.recipientRef].
static const recipientRef = 'recipientRef';

  /// The field name of [ModelNotification.actorRef].
static const actorRef = 'actorRef';

  /// The field name of [ModelNotification.kind].
static const kind = 'kind';

  /// The field name of [ModelNotification.title].
static const title = 'title';

  /// The field name of [ModelNotification.body].
static const body = 'body';

  /// The field name of [ModelNotification.previewMedia].
static const previewMedia = 'previewMedia';

  /// The field name of [ModelNotification.readAt].
static const readAt = 'readAt';

  /// The field name of [ModelNotification.createdAt].
static const createdAt = 'createdAt';

}

extension ModelNotificationX on ModelNotification {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelNotification mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelNotification.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelNotification copyWith({
    String? id,
String? recipientRef,
String? actorRef,
NotificationKindType? kind,
String? title,
String? body,
ModelMediaItem? previewMedia,
DateTime? readAt,
DateTime? createdAt,
  }) {
    return ModelNotification.assertRequired(
      id: id ?? this.id,
recipientRef: recipientRef ?? this.recipientRef,
actorRef: actorRef ?? this.actorRef,
kind: kind ?? this.kind,
title: title ?? this.title,
body: body ?? this.body,
previewMedia: previewMedia ?? this.previewMedia,
readAt: readAt ?? this.readAt,
createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelNotification copyWithout({
    bool id = true,
bool recipientRef = true,
bool actorRef = true,
bool kind = true,
bool title = true,
bool body = true,
bool previewMedia = true,
bool readAt = true,
bool createdAt = true,
  }) {
    return ModelNotification.assertRequired(
      id: id ? this.id: null,
recipientRef: recipientRef ? this.recipientRef: null,
actorRef: actorRef ? this.actorRef: null,
kind: kind ? this.kind: null,
title: title ? this.title: null,
body: body ? this.body: null,
previewMedia: previewMedia ? this.previewMedia: null,
readAt: readAt ? this.readAt: null,
createdAt: createdAt ? this.createdAt: null,
    );
  }
}