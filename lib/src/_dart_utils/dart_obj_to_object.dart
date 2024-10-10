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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Object? dartObjToObject(DartObject? dartObject) {
  if (dartObject != null) {
    try {
      return dartObject.toStringValue()!;
    } catch (_) {}
    try {
      return dartObject.toIntValue()!;
    } catch (_) {}

    try {
      return dartObject.toBoolValue()!;
    } catch (_) {}
    try {
      return dartObject.toDoubleValue()!;
    } catch (_) {}
    try {
      return dartObject.toListValue()!.map((e) => dartObjToObject(e));
    } catch (_) {}
    try {
      return dartObject.toSetValue()!.map((e) => dartObjToObject(e));
    } catch (_) {}
    try {
      return dartObject
          .toMapValue()!
          .map((k, v) => MapEntry(dartObjToObject(k), dartObjToObject(v)));
    } catch (_) {}
  }
  return null;
}
