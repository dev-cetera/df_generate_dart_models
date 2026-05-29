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

part of 'model_converter_invoice.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelConverterInvoice].
class ModelConverterInvoice extends _ModelConverterInvoice with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelConverterInvoice';

  @override
  String get $className => CLASS_NAME;

    /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [id, total, note];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

    /// No description provided.
final String? id;

  /// No description provided.
final dynamic? total;

  /// No description provided.
final String? note;


  /// Constructs a new instance of [ModelConverterInvoice]
  /// from optional and required parameters.
  const ModelConverterInvoice({
    required this.id,
 this.total,
 this.note,
  }) ;

  /// Construcs a new instance of [ModelConverterInvoice],
  /// forcing all parameters to be optional.
  const ModelConverterInvoice.optional({
    this.id,
this.total,
this.note,
  }) ;


  /// Constructs a new instance of [ModelConverterInvoice],
  /// and asserts that all required parameters are not null.
  factory ModelConverterInvoice.assertRequired({
    String? id,
dynamic? total,
String? note,
  }) {
    assert(id != null);


    return ModelConverterInvoice(
      id: id,
total: total,
note: note,
    );
  }

  /// Constructs a new instance of [ModelConverterInvoice],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelConverterInvoice.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelConverterInvoice.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelConverterInvoice],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelConverterInvoice? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }


  /// Constructs a new instance of [ModelConverterInvoice],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelConverterInvoice.of(
    ModelConverterInvoice another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelConverterInvoice.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelConverterInvoice],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelConverterInvoice? ofOrNull(
    ModelConverterInvoice? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelConverterInvoice],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelConverterInvoice.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$ModelConverterInvoice.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelConverterInvoice],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelConverterInvoice? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ModelConverterInvoice.fromJson(decoded);
      } else {
        return ModelConverterInvoice.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelConverterInvoice],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelConverterInvoice.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelConverterInvoice.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelConverterInvoice],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelConverterInvoice? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
final total = const MoneyConverter().fromJson(json?['total']);
final note = json?['note']?.toString().trim().nullIfEmpty;
      return ModelConverterInvoice(
        id: id,
total: total,
note: note,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelConverterInvoice],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelConverterInvoice.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelConverterInvoice.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelConverterInvoice],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelConverterInvoice? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ModelConverterInvoice.fromJson(uri.queryParameters);
      } else {
        return ModelConverterInvoice.assertRequired();
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
final total0 = const MoneyConverter().toJson(total);
final note0 = note?.trim().nullIfEmpty;
      final withNulls = {
        'total': total0,'note': note0,'id': id0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelConverterInvoice.toJson: $e');
      rethrow;
    }
  }

    /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String get id$ => id!;

  /// Returns the value of the [total] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
dynamic? get total$ => total;

  /// Returns the value of the [note] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
@pragma('vm:prefer-inline')
String? get note$ => note;

}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelConverterInvoiceFieldNames {
    /// The field name of [ModelConverterInvoice.id].
static const id = 'id';

  /// The field name of [ModelConverterInvoice.total].
static const total = 'total';

  /// The field name of [ModelConverterInvoice.note].
static const note = 'note';

}

extension ModelConverterInvoiceX on ModelConverterInvoice {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelConverterInvoice mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelConverterInvoice.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelConverterInvoice copyWith({
    String? id,
dynamic? total,
String? note,
  }) {
    return ModelConverterInvoice.assertRequired(
      id: id ?? this.id,
total: total ?? this.total,
note: note ?? this.note,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelConverterInvoice copyWithout({
    bool id = true,
bool total = true,
bool note = true,
  }) {
    return ModelConverterInvoice.assertRequired(
      id: id ? this.id: null,
total: total ? this.total: null,
note: note ? this.note: null,
    );
  }
}