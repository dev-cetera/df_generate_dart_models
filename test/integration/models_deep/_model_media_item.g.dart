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

/// Generated class for [_ModelMediaItem].
class ModelMediaItem extends _ModelMediaItem with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelMediaItem';

  @override
  String get $className => CLASS_NAME;

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, kind, url, thumbnailUrl, details, order];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

  /// No description provided.
  final String? id;

  /// No description provided.
  final MediaKindType? kind;

  /// No description provided.
  final String? url;

  /// No description provided.
  final String? thumbnailUrl;

  /// No description provided.
  final ModelMediaDetails? details;

  /// No description provided.
  final int? order;

  /// Constructs a new instance of [ModelMediaItem]
  /// from optional and required parameters.
  const ModelMediaItem({
    required this.id,
    required this.kind,
    required this.url,
    this.thumbnailUrl,
    this.details,
    this.order,
  });

  /// Construcs a new instance of [ModelMediaItem],
  /// forcing all parameters to be optional.
  const ModelMediaItem.optional({
    this.id,
    this.kind,
    this.url,
    this.thumbnailUrl,
    this.details,
    this.order,
  });

  /// Constructs a new instance of [ModelMediaItem],
  /// and asserts that all required parameters are not null.
  factory ModelMediaItem.assertRequired({
    String? id,
    MediaKindType? kind,
    String? url,
    String? thumbnailUrl,
    ModelMediaDetails? details,
    int? order,
  }) {
    assert(id != null);
    assert(kind != null);
    assert(url != null);

    return ModelMediaItem(
      id: id,
      kind: kind,
      url: url,
      thumbnailUrl: thumbnailUrl,
      details: details,
      order: order,
    );
  }

  /// Constructs a new instance of [ModelMediaItem],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelMediaItem.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelMediaItem.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelMediaItem],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelMediaItem? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [ModelMediaItem],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelMediaItem.of(
    ModelMediaItem another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelMediaItem.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelMediaItem],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelMediaItem? ofOrNull(
    ModelMediaItem? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelMediaItem],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelMediaItem.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelMediaItem.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelMediaItem],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelMediaItem? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelMediaItem.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelMediaItem],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelMediaItem.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelMediaItem.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelMediaItem],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelMediaItem? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
      final kind = MediaKindType.values.valueOf(json?['kind']?.toString());
      final url = json?['url']?.toString().trim().nullIfEmpty;
      final thumbnailUrl =
          json?['thumbnail_url']?.toString().trim().nullIfEmpty;
      final details = () {
        final a = letMapOrNull<String, dynamic>(json?['details']);
        return a != null ? ModelMediaDetails.fromJson(a) : null;
      }();
      final order = letIntOrNull(json?['order']);
      return ModelMediaItem(
        id: id,
        kind: kind,
        url: url,
        thumbnailUrl: thumbnailUrl,
        details: details,
        order: order,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelMediaItem],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelMediaItem.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelMediaItem.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelMediaItem],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelMediaItem? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelMediaItem.fromJsonOrNull(uri.queryParameters);
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
      final kind0 = kind?.name;
      final url0 = url?.trim().nullIfEmpty;
      final thumbnailUrl0 = thumbnailUrl?.trim().nullIfEmpty;
      final details0 = details != null ? jsonEncode(details!.toJson()) : null;
      final order0 = order;
      final withNulls = {
        'url': url0,
        'thumbnail_url': thumbnailUrl0,
        'order': order0,
        'kind': kind0,
        'id': id0,
        'details': details0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelMediaItem.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String get id$ => id!;

  /// Returns the value of the [kind] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  MediaKindType get kind$ => kind!;

  /// Returns the value of the [url] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String get url$ => url!;

  /// Returns the value of the [thumbnailUrl] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get thumbnailUrl$ => thumbnailUrl;

  /// Returns the value of the [details] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  ModelMediaDetails? get details$ => details;

  /// Returns the value of the [order] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  int? get order$ => order;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelMediaItemFieldNames {
  /// The field name of [ModelMediaItem.id].
  static const id = 'id';

  /// The field name of [ModelMediaItem.kind].
  static const kind = 'kind';

  /// The field name of [ModelMediaItem.url].
  static const url = 'url';

  /// The field name of [ModelMediaItem.thumbnailUrl].
  static const thumbnailUrl = 'thumbnail_url';

  /// The field name of [ModelMediaItem.details].
  static const details = 'details';

  /// The field name of [ModelMediaItem.order].
  static const order = 'order';
}

extension ModelMediaItemX on ModelMediaItem {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelMediaItem mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelMediaItem.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelMediaItem copyWith({
    String? id,
    MediaKindType? kind,
    String? url,
    String? thumbnailUrl,
    ModelMediaDetails? details,
    int? order,
  }) {
    return ModelMediaItem.assertRequired(
      id: id ?? this.id,
      kind: kind ?? this.kind,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      details: details ?? this.details,
      order: order ?? this.order,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelMediaItem copyWithout({
    bool id = true,
    bool kind = true,
    bool url = true,
    bool thumbnailUrl = true,
    bool details = true,
    bool order = true,
  }) {
    return ModelMediaItem.assertRequired(
      id: id ? this.id : null,
      kind: kind ? this.kind : null,
      url: url ? this.url : null,
      thumbnailUrl: thumbnailUrl ? this.thumbnailUrl : null,
      details: details ? this.details : null,
      order: order ? this.order : null,
    );
  }
}
