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

part of 'model_firestore_doc.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelFirestoreDoc].
class ModelFirestoreDoc extends _ModelFirestoreDoc with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelFirestoreDoc';

  @override
  String get $className => CLASS_NAME;

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [
        id,
        title,
        capturedAt,
        createdAt,
        location,
        ownerRef,
        thumbnail,
        legacyStamp
      ];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

  /// No description provided.
  final String? id;

  /// No description provided.
  final String? title;

  /// No description provided.
  final DateTime? capturedAt;

  /// No description provided.
  final DateTime? createdAt;

  /// No description provided.
  final GeoPoint? location;

  /// No description provided.
  final String? ownerRef;

  /// No description provided.
  final Uint8List? thumbnail;

  /// No description provided.
  final Timestamp? legacyStamp;

  /// Constructs a new instance of [ModelFirestoreDoc]
  /// from optional and required parameters.
  const ModelFirestoreDoc({
    required this.id,
    this.title,
    this.capturedAt,
    this.createdAt,
    this.location,
    this.ownerRef,
    this.thumbnail,
    this.legacyStamp,
  });

  /// Construcs a new instance of [ModelFirestoreDoc],
  /// forcing all parameters to be optional.
  const ModelFirestoreDoc.optional({
    this.id,
    this.title,
    this.capturedAt,
    this.createdAt,
    this.location,
    this.ownerRef,
    this.thumbnail,
    this.legacyStamp,
  });

  /// Constructs a new instance of [ModelFirestoreDoc],
  /// and asserts that all required parameters are not null.
  factory ModelFirestoreDoc.assertRequired({
    String? id,
    String? title,
    DateTime? capturedAt,
    DateTime? createdAt,
    GeoPoint? location,
    String? ownerRef,
    Uint8List? thumbnail,
    Timestamp? legacyStamp,
  }) {
    assert(id != null);

    return ModelFirestoreDoc(
      id: id,
      title: title,
      capturedAt: capturedAt,
      createdAt: createdAt,
      location: location,
      ownerRef: ownerRef,
      thumbnail: thumbnail,
      legacyStamp: legacyStamp,
    );
  }

  /// Constructs a new instance of [ModelFirestoreDoc],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelFirestoreDoc.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelFirestoreDoc.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFirestoreDoc],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelFirestoreDoc? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [ModelFirestoreDoc],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelFirestoreDoc.of(
    ModelFirestoreDoc another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelFirestoreDoc.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFirestoreDoc],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelFirestoreDoc? ofOrNull(
    ModelFirestoreDoc? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelFirestoreDoc],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelFirestoreDoc.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelFirestoreDoc.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFirestoreDoc],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelFirestoreDoc? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelFirestoreDoc.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelFirestoreDoc],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelFirestoreDoc.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelFirestoreDoc.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFirestoreDoc],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelFirestoreDoc? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
      final title = json?['title']?.toString().trim().nullIfEmpty;
      final capturedAt =
          letAsOrNull<Timestamp>(json?['capturedAt'])?.toDate().toUtc();
      final createdAt =
          letAsOrNull<Timestamp>(json?['createdAt'])?.toDate().toUtc();
      final location = letAsOrNull<GeoPoint>(json?['location']);
      final ownerRef =
          letAsOrNull<DocumentReference>(json?['ownerRef'])?.path ??
              json?['ownerRef']?.toString().trim().nullIfEmpty;
      final thumbnail = letAsOrNull<Blob>(json?['thumbnail'])?.bytes ??
          letAsOrNull<Uint8List>(json?['thumbnail']);
      final legacyStamp = letAsOrNull<Timestamp>(json?['legacyStamp']);
      return ModelFirestoreDoc(
        id: id,
        title: title,
        capturedAt: capturedAt,
        createdAt: createdAt,
        location: location,
        ownerRef: ownerRef,
        thumbnail: thumbnail,
        legacyStamp: legacyStamp,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelFirestoreDoc],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelFirestoreDoc.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelFirestoreDoc.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelFirestoreDoc],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelFirestoreDoc? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelFirestoreDoc.fromJsonOrNull(uri.queryParameters);
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
      final title0 = title?.trim().nullIfEmpty;
      final capturedAt0 =
          capturedAt != null ? Timestamp.fromDate(capturedAt!.toUtc()) : null;
      final createdAt0 = FieldValue.serverTimestamp();
      final location0 = location;
      final ownerRef0 = ownerRef?.trim().nullIfEmpty;
      final thumbnail0 = thumbnail != null ? Blob(thumbnail!) : null;
      final legacyStamp0 = legacyStamp;
      final withNulls = {
        'title': title0,
        'thumbnail': thumbnail0,
        'ownerRef': ownerRef0,
        'location': location0,
        'legacyStamp': legacyStamp0,
        'id': id0,
        'createdAt': createdAt0,
        'capturedAt': capturedAt0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelFirestoreDoc.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String get id$ => id!;

  /// Returns the value of the [title] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get title$ => title;

  /// Returns the value of the [capturedAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  DateTime? get capturedAt$ => capturedAt;

  /// Returns the value of the [createdAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  DateTime? get createdAt$ => createdAt;

  /// Returns the value of the [location] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  GeoPoint? get location$ => location;

  /// Returns the value of the [ownerRef] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get ownerRef$ => ownerRef;

  /// Returns the value of the [thumbnail] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Uint8List? get thumbnail$ => thumbnail;

  /// Returns the value of the [legacyStamp] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Timestamp? get legacyStamp$ => legacyStamp;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelFirestoreDocFieldNames {
  /// The field name of [ModelFirestoreDoc.id].
  static const id = 'id';

  /// The field name of [ModelFirestoreDoc.title].
  static const title = 'title';

  /// The field name of [ModelFirestoreDoc.capturedAt].
  static const capturedAt = 'capturedAt';

  /// The field name of [ModelFirestoreDoc.createdAt].
  static const createdAt = 'createdAt';

  /// The field name of [ModelFirestoreDoc.location].
  static const location = 'location';

  /// The field name of [ModelFirestoreDoc.ownerRef].
  static const ownerRef = 'ownerRef';

  /// The field name of [ModelFirestoreDoc.thumbnail].
  static const thumbnail = 'thumbnail';

  /// The field name of [ModelFirestoreDoc.legacyStamp].
  static const legacyStamp = 'legacyStamp';
}

extension ModelFirestoreDocX on ModelFirestoreDoc {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelFirestoreDoc mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelFirestoreDoc.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelFirestoreDoc copyWith({
    String? id,
    String? title,
    DateTime? capturedAt,
    DateTime? createdAt,
    GeoPoint? location,
    String? ownerRef,
    Uint8List? thumbnail,
    Timestamp? legacyStamp,
  }) {
    return ModelFirestoreDoc.assertRequired(
      id: id ?? this.id,
      title: title ?? this.title,
      capturedAt: capturedAt ?? this.capturedAt,
      createdAt: createdAt ?? this.createdAt,
      location: location ?? this.location,
      ownerRef: ownerRef ?? this.ownerRef,
      thumbnail: thumbnail ?? this.thumbnail,
      legacyStamp: legacyStamp ?? this.legacyStamp,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelFirestoreDoc copyWithout({
    bool id = true,
    bool title = true,
    bool capturedAt = true,
    bool createdAt = true,
    bool location = true,
    bool ownerRef = true,
    bool thumbnail = true,
    bool legacyStamp = true,
  }) {
    return ModelFirestoreDoc.assertRequired(
      id: id ? this.id : null,
      title: title ? this.title : null,
      capturedAt: capturedAt ? this.capturedAt : null,
      createdAt: createdAt ? this.createdAt : null,
      location: location ? this.location : null,
      ownerRef: ownerRef ? this.ownerRef : null,
      thumbnail: thumbnail ? this.thumbnail : null,
      legacyStamp: legacyStamp ? this.legacyStamp : null,
    );
  }
}
