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

part of 'model_test.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A test model!
class ModelTest extends _ModelTest with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelTest';

  @override
  String get $className => CLASS_NAME;

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [users, checks, random];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

  /// Some users!
  final List<ModelUser>? users;

  /// No description provided.
  final List<int>? checks;

  /// No description provided.
  final Map<String, Map<dynamic, int>>? random;

  /// Constructs a new instance of [ModelTest]
  /// from optional and required parameters.
  const ModelTest({
    this.users,
    this.checks,
    this.random,
  });

  /// Construcs a new instance of [ModelTest],
  /// forcing all parameters to be optional.
  const ModelTest.optional({
    this.users,
    this.checks,
    this.random,
  });

  /// Constructs a new instance of [ModelTest],
  /// and asserts that all required parameters are not null.
  factory ModelTest.assertRequired({
    List<ModelUser>? users,
    List<int>? checks,
    Map<String, Map<dynamic, int>>? random,
  }) {
    return ModelTest(
      users: users,
      checks: checks,
      random: random,
    );
  }

  /// Constructs a new instance of [ModelTest],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelTest.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelTest.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelTest],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelTest? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [ModelTest],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelTest.of(
    ModelTest another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelTest.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelTest],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelTest? ofOrNull(
    ModelTest? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelTest],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelTest.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelTest.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelTest],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelTest? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return ModelTest.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelTest],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelTest.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelTest.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelTest],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelTest? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final users = letListOrNull<dynamic>(json?['users'])
          ?.map(
            (p0) => () {
              final a = letMapOrNull<String, dynamic>(p0);
              return a != null ? ModelUser.fromJson(a) : null;
            }(),
          )
          .nonNulls
          .nullIfEmpty
          ?.toList()
          .unmodifiable;
      final checks = letListOrNull<dynamic>(json?['checks'])
          ?.map(
            (p0) => letIntOrNull(p0),
          )
          .nonNulls
          .nullIfEmpty
          ?.toList()
          .unmodifiable;
      final random = letMapOrNull<dynamic, dynamic>(json?['random'])
          ?.map(
            (p0, p1) => MapEntry(
              p0?.toString().trim().nullIfEmpty,
              letMapOrNull<dynamic, dynamic>(p1)
                  ?.map(
                    (p0, p1) => MapEntry(
                      p0,
                      letIntOrNull(p1),
                    ),
                  )
                  .nonNulls
                  .nullIfEmpty
                  ?.unmodifiable,
            ),
          )
          .nonNulls
          .nullIfEmpty
          ?.unmodifiable;
      return ModelTest(
        users: users,
        checks: checks,
        random: random,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelTest],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelTest.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelTest.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelTest],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelTest? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return ModelTest.fromJsonOrNull(uri.queryParameters);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson({
    bool includeNulls = false,
  }) {
    try {
      final users0 = users
          ?.map(
            (p0) => p0?.toJson(),
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final checks0 = checks
          ?.map(
            (p0) => p0,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final random0 = random
          ?.map(
            (p0, p1) => MapEntry(
              p0?.trim().nullIfEmpty,
              p1
                  ?.map(
                    (p0, p1) => MapEntry(
                      p0,
                      p1,
                    ),
                  )
                  .nonNulls
                  .nullIfEmpty,
            ),
          )
          .nonNulls
          .nullIfEmpty;
      final withNulls = {
        'users': users0,
        'random': random0,
        'checks': checks0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelTest.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [users] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  List<ModelUser>? get users$ => users;

  /// Returns the value of the [checks] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  List<int>? get checks$ => checks;

  /// Returns the value of the [random] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Map<String, Map<dynamic, int>>? get random$ => random;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelTestFieldNames {
  /// The field name of [ModelTest.users].
  static const users = 'users';

  /// The field name of [ModelTest.checks].
  static const checks = 'checks';

  /// The field name of [ModelTest.random].
  static const random = 'random';

  /// Every declared field-name constant in declaration order. Mirrors
  /// `enum.values` so consumers can iterate the schema without reflection.
  static const List<String> $values = [users, checks, random];

  /// The field marked `primaryKey: true`, or `null` if none was declared.
  static const String? $primaryKey = null;

  /// Foreign-key fields mapped to the referenced class name (as a String).
  /// Empty when no field uses `foreignKey:` / `references:`.
  static const Map<String, String> $foreignKeys = {};
}

extension ModelTestX on ModelTest {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelTest mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelTest.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelTest copyWith({
    List<ModelUser>? users,
    List<int>? checks,
    Map<String, Map<dynamic, int>>? random,
  }) {
    return ModelTest.assertRequired(
      users: users ?? this.users,
      checks: checks ?? this.checks,
      random: random ?? this.random,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelTest copyWithout({
    bool users = true,
    bool checks = true,
    bool random = true,
  }) {
    return ModelTest.assertRequired(
      users: users ? this.users : null,
      checks: checks ? this.checks : null,
      random: random ? this.random : null,
    );
  }
}
