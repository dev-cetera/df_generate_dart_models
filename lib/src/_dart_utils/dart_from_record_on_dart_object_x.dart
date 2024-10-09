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

import 'package:analyzer/dart/constant/value.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import 'dart_obj_to_list.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension DartFromRecordOnDartObjectX on DartObject {
  //
  //
  //

  /// Returns `fieldName` property from `this` [DartObject] record if it matches
  /// the structure of [TFieldRecord] or `null`.
  List<String>? fieldPathFromRecord() {
    return _rawFieldPathFromRecord()?.map((e) => e.replaceAll('?', '')).toList();
  }

  List<String>? _rawFieldPathFromRecord() {
    final a = dartObjToList(getField('\$1'));
    final b = dartObjToList(getField(FieldModelFieldNames.fieldPath));
    return (a ?? b)?.toList();
  }

  /// Returns the `fieldType` property from `this` DartObject record if it
  /// matches the structure of [TFieldRecord] or `null`.
  String? fieldTypeFromRecord() {
    final raw = _rawFieldTypeFromRecord();
    if (raw != null) {
      return raw.endsWith('?') ? raw.substring(0, raw.length - 1) : raw;
    }
    return null;
  }

  String? _rawFieldTypeFromRecord() {
    final a = getField('\$2')?.toStringValue();
    final b = getField('\$2')?.toTypeValue()?.getDisplayString();
    final c = getField(FieldModelFieldNames.fieldType)?.toStringValue();
    final d = getField(FieldModelFieldNames.fieldType)?.toTypeValue()?.getDisplayString();
    return a ?? b ?? c ?? d;
  }

  /// Returns the `nullable` property from `this` [DartObject] record if it
  /// matches the structure of [TFieldRecord] or `null`.
  bool? nullableFromRecord() {
    if (fieldTypeFromRecord() == 'dynamic') {
      return false;
    }

    final a = getField(FieldModelFieldNames.nullable)?.toBoolValue();
    final b = getField('\$3')?.toBoolValue();
    final c = _rawFieldPathFromRecord()?.any((e) => e.contains('?'));
    final d = _rawFieldTypeFromRecord()?.endsWith('?');
    return a ?? b ?? ((c ?? false) || (d ?? false));
  }

  /// Returns the `description` property from `this` [DartObject] record if it
  /// matches the structure of [TFieldRecord] or `null`.
  String? descriptionFromRecord() {
    return getField(FieldModelFieldNames.description)?.toStringValue();
  }
}
