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

part of 'model_base.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelBase].
class ModelBase extends _ModelBase with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelBase';

  @override
  String get $className => CLASS_NAME;

  /// The database table name this model maps to, mirroring `tableName:` on
  /// the annotation. When the annotation omits `tableName:`, this is derived
  /// from the class name (Model prefix/suffix stripped, snake-cased) — no
  /// automatic pluralisation.
  static const tableName = 'base';

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [
        id,
        name,
        count,
        ratio,
        active,
        createdAt,
        homepage,
        big,
        tags,
        metadata
      ];

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
  final BigInt? big;

  /// No description provided.
  final List<String>? tags;

  /// No description provided.
  final Map<String, dynamic>? metadata;

  /// Constructs a new instance of [ModelBase]
  /// from optional and required parameters.
  const ModelBase({
    required this.id,
    required this.name,
    this.count,
    this.ratio,
    this.active,
    this.createdAt,
    this.homepage,
    this.big,
    this.tags,
    this.metadata,
  });

  /// Construcs a new instance of [ModelBase],
  /// forcing all parameters to be optional.
  const ModelBase.optional({
    this.id,
    this.name,
    this.count,
    this.ratio,
    this.active,
    this.createdAt,
    this.homepage,
    this.big,
    this.tags,
    this.metadata,
  });

  /// Constructs a new instance of [ModelBase],
  /// and asserts that all required parameters are not null.
  factory ModelBase.assertRequired({
    String? id,
    String? name,
    int? count,
    double? ratio,
    bool? active,
    DateTime? createdAt,
    Uri? homepage,
    BigInt? big,
    List<String>? tags,
    Map<String, dynamic>? metadata,
  }) {
    assert(id != null);
    assert(name != null);

    return ModelBase(
      id: id,
      name: name,
      count: count,
      ratio: ratio,
      active: active,
      createdAt: createdAt,
      homepage: homepage,
      big: big,
      tags: tags,
      metadata: metadata,
    );
  }

  /// Constructs a new instance of [ModelBase],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelBase.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelBase.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelBase],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelBase? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [ModelBase],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelBase.of(
    ModelBase another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelBase.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelBase],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelBase? ofOrNull(
    ModelBase? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelBase],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelBase.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelBase.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelBase],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelBase? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelBase.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelBase],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelBase.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelBase.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelBase],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelBase? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
      final name = json?['name']?.toString().trim().nullIfEmpty;
      final count = letIntOrNull(json?['count']);
      final ratio = letDoubleOrNull(json?['ratio']);
      final active = letBoolOrNull(json?['active']);
      final createdAt = () {
        final a = json?['created_at']?.toString().trim().nullIfEmpty;
        return a != null ? DateTime.tryParse(a)?.toUtc() : null;
      }();
      final homepage = () {
        final a = json?['homepage']?.toString().trim().nullIfEmpty;
        return a != null ? Uri.tryParse(a) : null;
      }();
      final big = () {
        final a = json?['big']?.toString().trim().nullIfEmpty;
        return a != null ? BigInt.tryParse(a) : null;
      }();
      final tags = letListOrNull<dynamic>(json?['tags'])
          ?.map(
            (p0) => p0?.toString().trim().nullIfEmpty,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList()
          .unmodifiable;
      final metadata = letMapOrNull<dynamic, dynamic>(json?['metadata'])
          ?.map(
            (p0, p1) => MapEntry(
              p0?.toString().trim().nullIfEmpty,
              p1,
            ),
          )
          .nonNulls
          .nullIfEmpty
          ?.unmodifiable;
      return ModelBase(
        id: id,
        name: name,
        count: count,
        ratio: ratio,
        active: active,
        createdAt: createdAt,
        homepage: homepage,
        big: big,
        tags: tags,
        metadata: metadata,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelBase],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelBase.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelBase.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelBase],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelBase? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelBase.fromJsonOrNull(uri.queryParameters);
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
      final name0 = name?.trim().nullIfEmpty;
      final count0 = count;
      final ratio0 = ratio;
      final active0 = active;
      final createdAt0 = createdAt?.toUtc().toIso8601String();
      final homepage0 = homepage?.toString();
      final big0 = big?.toString();
      final tags0 = tags
          ?.map(
            (p0) => p0?.trim().nullIfEmpty,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final metadata0 = metadata
          ?.map(
            (p0, p1) => MapEntry(
              p0?.trim().nullIfEmpty,
              p1,
            ),
          )
          .nonNulls
          .nullIfEmpty;
      final withNulls = {
        'tags': tags0,
        'ratio': ratio0,
        'name': name0,
        'metadata': metadata0,
        'id': id0,
        'homepage': homepage0,
        'created_at': createdAt0,
        'count': count0,
        'big': big0,
        'active': active0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelBase.toJson: $e');
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
  int? get count$ => count;

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
  DateTime? get createdAt$ => createdAt;

  /// Returns the value of the [homepage] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Uri? get homepage$ => homepage;

  /// Returns the value of the [big] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  BigInt? get big$ => big;

  /// Returns the value of the [tags] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  List<String>? get tags$ => tags;

  /// Returns the value of the [metadata] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Map<String, dynamic>? get metadata$ => metadata;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelBaseFieldNames {
  /// The field name of [ModelBase.id].
  static const id = 'id';

  /// The field name of [ModelBase.name].
  static const name = 'name';

  /// The field name of [ModelBase.count].
  static const count = 'count';

  /// The field name of [ModelBase.ratio].
  static const ratio = 'ratio';

  /// The field name of [ModelBase.active].
  static const active = 'active';

  /// The field name of [ModelBase.createdAt].
  static const createdAt = 'created_at';

  /// The field name of [ModelBase.homepage].
  static const homepage = 'homepage';

  /// The field name of [ModelBase.big].
  static const big = 'big';

  /// The field name of [ModelBase.tags].
  static const tags = 'tags';

  /// The field name of [ModelBase.metadata].
  static const metadata = 'metadata';

  /// Every declared field-name constant in declaration order. Mirrors
  /// `enum.values` so consumers can iterate the schema without reflection.
  static const List<String> $values = [
    id,
    name,
    count,
    ratio,
    active,
    createdAt,
    homepage,
    big,
    tags,
    metadata
  ];

  /// The field marked `primaryKey: true`, or `null` if none was declared.
  static const String $primaryKey = id;

  /// Foreign-key fields mapped to the referenced class name (as a String).
  /// Empty when no field uses `foreignKey:` / `references:`.
  static const Map<String, String> $foreignKeys = {};
}

extension ModelBaseX on ModelBase {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelBase mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelBase.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelBase copyWith({
    String? id,
    String? name,
    int? count,
    double? ratio,
    bool? active,
    DateTime? createdAt,
    Uri? homepage,
    BigInt? big,
    List<String>? tags,
    Map<String, dynamic>? metadata,
  }) {
    return ModelBase.assertRequired(
      id: id ?? this.id,
      name: name ?? this.name,
      count: count ?? this.count,
      ratio: ratio ?? this.ratio,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      homepage: homepage ?? this.homepage,
      big: big ?? this.big,
      tags: tags ?? this.tags,
      metadata: metadata ?? this.metadata,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelBase copyWithout({
    bool id = true,
    bool name = true,
    bool count = true,
    bool ratio = true,
    bool active = true,
    bool createdAt = true,
    bool homepage = true,
    bool big = true,
    bool tags = true,
    bool metadata = true,
  }) {
    return ModelBase.assertRequired(
      id: id ? this.id : null,
      name: name ? this.name : null,
      count: count ? this.count : null,
      ratio: ratio ? this.ratio : null,
      active: active ? this.active : null,
      createdAt: createdAt ? this.createdAt : null,
      homepage: homepage ? this.homepage : null,
      big: big ? this.big : null,
      tags: tags ? this.tags : null,
      metadata: metadata ? this.metadata : null,
    );
  }
}
