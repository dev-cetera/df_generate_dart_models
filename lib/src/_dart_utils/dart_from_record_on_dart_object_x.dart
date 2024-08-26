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
    return this._rawFieldPathFromRecord()?.map((e) => e.replaceAll('?', '')).toList();
  }

  List<String>? _rawFieldPathFromRecord() {
    final a = dartObjToList(this.getField('\$1'));
    final b = dartObjToList(this.getField(FieldModelFieldNames.fieldPath));
    return (a ?? b)?.toList();
  }

  //
  //
  //

  /// Returns `fieldType` property from `this` DartObject record if it matches
  /// the structure of [TFieldRecord] or `null`.
  String? fieldTypeFromRecord() {
    final raw = this._rawFieldTypeFromRecord();
    if (raw != null) {
      return raw.endsWith('?') ? raw.substring(0, raw.length - 1) : raw;
    }
    return null;
  }

  String? _rawFieldTypeFromRecord() {
    final a = this.getField('\$2')?.toStringValue();
    final b = this.getField('\$2')?.toTypeValue()?.getDisplayString();
    final c = this.getField(FieldModelFieldNames.fieldType)?.toStringValue();
    final d = this.getField(FieldModelFieldNames.fieldType)?.toTypeValue()?.getDisplayString();
    return a ?? b ?? c ?? d;
  }

  //
  //
  //

  /// Returns `nullable` property from the `this` [DartObject] record if it
  /// matches the structure of [TFieldRecord] or `null`.
  bool? nullableFromRecord() {
    if (this.fieldTypeFromRecord() == 'dynamic') {
      return false;
    }

    final a = this.getField(FieldModelFieldNames.nullable)?.toBoolValue();
    final b = this.getField('\$3')?.toBoolValue();
    final c = this._rawFieldPathFromRecord()?.any((e) => e.contains('?'));
    final d = this._rawFieldTypeFromRecord()?.endsWith('?');
    return a ?? b ?? ((c ?? false) || (d ?? false));
  }
}
