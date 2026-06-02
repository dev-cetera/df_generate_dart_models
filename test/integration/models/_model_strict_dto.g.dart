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

part of 'model_strict_dto.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelStrictDto].
class ModelStrictDto extends _ModelStrictDto with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelStrictDto';

  @override
  String get $className => CLASS_NAME;

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props =>
      [id, name, count, ratio, active, createdAt, homepage, avatar];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

  /// No description provided.
  final String? id;

  /// No description provided.
  final String? name;

  /// No description provided.
  final int? count;

  /// No description provided.
  final double? ratio;

  /// No description provided.
  final bool? active;

  /// No description provided.
  final DateTime? createdAt;

  /// No description provided.
  final Uri? homepage;

  /// No description provided.
  final Uint8List? avatar;

  /// Constructs a new instance of [ModelStrictDto]
  /// from optional and required parameters.
  const ModelStrictDto({
    required this.id,
    required this.name,
    required this.count,
    this.ratio,
    this.active,
    required this.createdAt,
    this.homepage,
    this.avatar,
  });

  /// Construcs a new instance of [ModelStrictDto],
  /// forcing all parameters to be optional.
  const ModelStrictDto.optional({
    this.id,
    this.name,
    this.count,
    this.ratio,
    this.active,
    this.createdAt,
    this.homepage,
    this.avatar,
  });

  /// Constructs a new instance of [ModelStrictDto],
  /// and asserts that all required parameters are not null.
  factory ModelStrictDto.assertRequired({
    String? id,
    String? name,
    int? count,
    double? ratio,
    bool? active,
    DateTime? createdAt,
    Uri? homepage,
    Uint8List? avatar,
  }) {
    assert(id != null);
    assert(name != null);
    assert(count != null);

    assert(createdAt != null);

    return ModelStrictDto(
      id: id,
      name: name,
      count: count,
      ratio: ratio,
      active: active,
      createdAt: createdAt,
      homepage: homepage,
      avatar: avatar,
    );
  }

  /// Constructs a new instance of [ModelStrictDto],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelStrictDto.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelStrictDto.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelStrictDto],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelStrictDto? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [ModelStrictDto],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelStrictDto.of(
    ModelStrictDto another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelStrictDto.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelStrictDto],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelStrictDto? ofOrNull(
    ModelStrictDto? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelStrictDto],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelStrictDto.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelStrictDto.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelStrictDto],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelStrictDto? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelStrictDto.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelStrictDto],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelStrictDto.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelStrictDto.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelStrictDto],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelStrictDto? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id'] as String?;
      final name = json?['name'] as String?;
      final count = (json?['count'] as num?)?.toInt();
      final ratio = (json?['ratio'] as num?)?.toDouble();
      final active = json?['active'] as bool?;
      final createdAt = json?['createdAt'] == null
          ? null
          : DateTime.parse(json?['createdAt'] as String).toUtc();
      final homepage = json?['homepage'] == null
          ? null
          : Uri.parse(json?['homepage'] as String);
      final avatar = json?['avatar'] == null
          ? null
          : base64Decode(json?['avatar'] as String);
      return ModelStrictDto(
        id: id,
        name: name,
        count: count,
        ratio: ratio,
        active: active,
        createdAt: createdAt,
        homepage: homepage,
        avatar: avatar,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelStrictDto],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelStrictDto.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelStrictDto.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelStrictDto],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelStrictDto? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelStrictDto.fromJsonOrNull(uri.queryParameters);
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
      final name0 = name;
      final count0 = count;
      final ratio0 = ratio;
      final active0 = active;
      final createdAt0 = createdAt?.toUtc().toIso8601String();
      final homepage0 = homepage?.toString();
      final avatar0 = avatar != null ? base64Encode(avatar!) : null;
      final withNulls = {
        'ratio': ratio0,
        'name': name0,
        'id': id0,
        'homepage': homepage0,
        'createdAt': createdAt0,
        'count': count0,
        'avatar': avatar0,
        'active': active0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelStrictDto.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String get id$ => id!;

  /// Returns the value of the [name] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String get name$ => name!;

  /// Returns the value of the [count] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  int get count$ => count!;

  /// Returns the value of the [ratio] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double? get ratio$ => ratio;

  /// Returns the value of the [active] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  bool? get active$ => active;

  /// Returns the value of the [createdAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  DateTime get createdAt$ => createdAt!;

  /// Returns the value of the [homepage] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Uri? get homepage$ => homepage;

  /// Returns the value of the [avatar] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Uint8List? get avatar$ => avatar;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelStrictDtoFieldNames {
  /// The field name of [ModelStrictDto.id].
  static const id = 'id';

  /// The field name of [ModelStrictDto.name].
  static const name = 'name';

  /// The field name of [ModelStrictDto.count].
  static const count = 'count';

  /// The field name of [ModelStrictDto.ratio].
  static const ratio = 'ratio';

  /// The field name of [ModelStrictDto.active].
  static const active = 'active';

  /// The field name of [ModelStrictDto.createdAt].
  static const createdAt = 'createdAt';

  /// The field name of [ModelStrictDto.homepage].
  static const homepage = 'homepage';

  /// The field name of [ModelStrictDto.avatar].
  static const avatar = 'avatar';
}

extension ModelStrictDtoX on ModelStrictDto {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelStrictDto mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelStrictDto.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelStrictDto copyWith({
    String? id,
    String? name,
    int? count,
    double? ratio,
    bool? active,
    DateTime? createdAt,
    Uri? homepage,
    Uint8List? avatar,
  }) {
    return ModelStrictDto.assertRequired(
      id: id ?? this.id,
      name: name ?? this.name,
      count: count ?? this.count,
      ratio: ratio ?? this.ratio,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      homepage: homepage ?? this.homepage,
      avatar: avatar ?? this.avatar,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelStrictDto copyWithout({
    bool id = true,
    bool name = true,
    bool count = true,
    bool ratio = true,
    bool active = true,
    bool createdAt = true,
    bool homepage = true,
    bool avatar = true,
  }) {
    return ModelStrictDto.assertRequired(
      id: id ? this.id : null,
      name: name ? this.name : null,
      count: count ? this.count : null,
      ratio: ratio ? this.ratio : null,
      active: active ? this.active : null,
      createdAt: createdAt ? this.createdAt : null,
      homepage: homepage ? this.homepage : null,
      avatar: avatar ? this.avatar : null,
    );
  }
}
