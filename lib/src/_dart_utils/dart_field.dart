//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class DartField extends Field {
  //
  //
  //

  const DartField({
    required super.fieldPath,
    required super.fieldType,
    super.nullable,
    super.description,
  });

  /// Derives an instance [DartField] from [source].
  factory DartField.from(Field source) {
    return DartField(
      fieldPath: source.fieldPath,
      fieldType: source.fieldType,
      nullable: source.nullable,
      description: source.description,
    );
  }

  /// Derives an instance [DartField] from [record].
  factory DartField.fromRecord(TFieldRecord record) {
    return DartField(
      fieldPath: record.fieldPath,
      fieldType: record.fieldType,
      nullable: record.nullable,
      description: record.description,
    );
  }

  //
  //
  //

  /// The super.fieldPath stripped of '?'.
  @override
  List<String>? get fieldPath {
    return super.fieldPath?.map((e) => e.trim().replaceAll('?', '')).toList();
  }

  /// The [fieldPath] joined and to camelCase.
  String? get fieldName {
    return fieldPath?.join('_').toCamelCase();
  }

  /// The super.fieldType stripped of '?'.
  @override
  String? get fieldType {
    final temp = super.fieldType?.toString();
    if (temp != null) {
      return _expandDynamicTypes(
        _isFieldTypeNullable! ? temp.substring(0, temp.length - 1) : temp,
      );
    } else {
      return null;
    }
  }

  /// The this.fieldPath with '?' if nullable.
  @override
  String? get fieldTypeCode {
    if (fieldType != null) {
      return '$fieldType${nullable ? '?' : ''}';
    } else {
      return null;
    }
  }

  // Whether super.fieldPath or super.fieldType ends with '?' or super.nullable is true.
  @override
  bool get nullable {
    return [
      super.nullable,
      _isFieldNameNullable,
      _isFieldTypeNullable,
    ].any((e) => e == true);
  }

  bool? get _isFieldNameNullable => super.fieldPath?.any((e) => e.contains('?'));

  bool? get _isFieldTypeNullable => super.fieldType?.endsWith('?');

  //
  //
  //

  /// Assumes [unknown] is a [TFieldRecord] or [Field] or similar and  tries to
  /// construct a [DartField], otherwise returns `null`.
  static DartField? ofOrNull(dynamic unknown) {
    try {
      return DartField.from(Field.ofOrNull(unknown)!);
    } catch (_) {
      return null;
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Expands some non-generic Dart collection types to their generic forms
/// (e.g. Map to Map<dynamic, dynamic>). It processes types separated by "|"
/// and skips over collections that already specify types.
///
/// This only works for the following types:
///
/// - Map
/// - List
/// - Set
/// - Iterable
/// - Queue
/// - LinkedList
/// - HashSet
/// - LinkedHashSet
/// - HashMap
/// - LinkedHashMap
String _expandDynamicTypes(String fieldTypeCode) {
  for (final e in {
    'Map': 'Map<dynamic, dynamic>',
    'List': 'List<dynamic>',
    'Set': 'Set<dynamic>',
    'Iterable': 'Iterable<dynamic>',
    'Queue': 'Queue<dynamic>',
    'LinkedList': 'LinkedList<dynamic>',
    'HashSet': 'HashSet<dynamic>',
    'LinkedHashSet': 'LinkedHashSet<dynamic>',
    'HashMap': 'HashMap<dynamic, dynamic>',
    'LinkedHashMap': 'LinkedHashMap<dynamic, dynamic>',
  }.entries) {
    final key = e.key;
    final value = e.value;
    // This regex looks for the key (like "Map") that is not immediately
    // followed by a "<", but it will also match if the key is followed by "|"
    // and any text.
    final regex = RegExp(r'\b' + key + r'\b(?![<|])');
    fieldTypeCode = fieldTypeCode.replaceAll(regex, value);
  }
  return fieldTypeCode;
}
