```dart
//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/DevCetra/df_generate_dart_models
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: annotate_overrides
// ignore_for_file: invalid_null_aware_operator
// ignore_for_file: overridden_fields
// ignore_for_file: require_trailing_commas
// ignore_for_file: unnecessary_non_null_assertion
// ignore_for_file: unnecessary_null_comparison
// ignore_for_file: unnecessary_question_mark

part of '___CLASS_FILE_NAME___';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// ___DESCRIPTION___
class ___CLASS_NAME___ extends ___SUPER_CLASS_NAME___ {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = '___CLASS_NAME___';

  @override
  String get $className => CLASS_NAME;

  ___FIELD_DECLARATIONS___

  /// Constructs a new instance of [___CLASS_NAME___]
  /// from optional and required parameters.
  const ___CLASS_NAME___({
    ___PARAMS___
  }) ___SUPER_CONSTRUCTOR___;

  /// Construcs a new instance of [___CLASS_NAME___],
  /// forcing all parameters to be optional.
  const ___CLASS_NAME___.optional({
    ___PERMISSIVE_PARAMS___
  }) ___SUPER_CONSTRUCTOR___;


  /// Constructs a new instance of [___CLASS_NAME___],
  /// and asserts that all required parameters are not null.
  factory ___CLASS_NAME___.assertRequired({
    ___STRICT_PARAMS___
  }) {
    ___STRICT_PARAM_ASSERTIONS___
    return ___CLASS_NAME___(
      ___STRICT_ARGS___
    );
  }

  /// Constructs a new instance of [___CLASS_NAME___],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ___CLASS_NAME___.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$___CLASS_NAME___.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [___CLASS_NAME___],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ___CLASS_NAME___? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }


  /// Constructs a new instance of [___CLASS_NAME___],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ___CLASS_NAME___.of(
    ___CLASS_NAME___ another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$___CLASS_NAME___.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [___CLASS_NAME___],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ___CLASS_NAME___? ofOrNull(
    ___CLASS_NAME___? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [___CLASS_NAME___],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ___CLASS_NAME___.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$___CLASS_NAME___.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [___CLASS_NAME___],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ___CLASS_NAME___? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ___CLASS_NAME___.fromJson(decoded);
      } else {
        return ___CLASS_NAME___.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [___CLASS_NAME___],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ___CLASS_NAME___.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$___CLASS_NAME___.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [___CLASS_NAME___],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ___CLASS_NAME___? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      ___FROM_JSON_OR_NULL_PARAMS___
      return ___CLASS_NAME___(
        ___FROM_JSON_OR_NULL_ARGS___
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [___CLASS_NAME___],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ___CLASS_NAME___.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$___CLASS_NAME___.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [___CLASS_NAME___],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ___CLASS_NAME___? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ___CLASS_NAME___.fromJson(uri.queryParameters);
      } else {
        return ___CLASS_NAME___.assertRequired();
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
      ___TO_JSON_PARAMS___
      final withNulls = {
        ___TO_JSON_ARGS___
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$___CLASS_NAME___.toJson: $e');
      rethrow;
    }
  }

  ___GETTERS___
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ___CLASS_NAME___FieldNames {
  ___FIELD_NAMES___
}

extension ___CLASS_NAME___X on ___CLASS_NAME___ {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ___CLASS_NAME___ mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ___CLASS_NAME___.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ___CLASS_NAME___ copyWith({
    ___COPY_WITH_PARAMS___
  }) {
    return ___CLASS_NAME___.assertRequired(
      ___COPY_WITH_ARGS___
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ___CLASS_NAME___ copyWithout({
    ___COPY_WITHOUT_PARAMS___
  }) {
    return ___CLASS_NAME___.assertRequired(
      ___COPY_WITHOUT_ARGS___
    );
  }
}
```
