//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
//
// The use of this source code is governed by an MIT-style license described in
// the LICENSE file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: always_declare_return_types

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class DartCoreTypeMappers extends TypeMappers {
  //
  //
  //

  static final instance = DartCoreTypeMappers._();

  //
  //
  //

  DartCoreTypeMappers._();

  //
  //
  //

  @override
  TTypeMappers<CollectionMapperEvent> get collectionFromMappers => newTypeMap({
        // ---------------------------------------------------------------------
        // Standard.
        // ---------------------------------------------------------------------
        r'^(Map)\??$': (e) {
          return 'letMapOrNull<dynamic, dynamic>(${e.name})?.map((${e.args}) => MapEntry(${e.hashes},),).nonNulls.nullIfEmpty?.unmodifiable';
        },
        r'^(Iterable)\??$': (e) {
          return 'letIterableOrNull<dynamic>(${e.name})?.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty';
        },
        r'^(List)\??$': (e) {
          return 'letListOrNull<dynamic>(${e.name})?.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty?.toList().unmodifiable';
        },
        r'^(Set)\??$': (e) {
          return 'letSetOrNull<dynamic>(${e.name})?.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty?.toSet().unmodifiable';
        },
        r'^(Queue)\??$': (e) {
          return '(){ final a = letIterableOrNull<dynamic>(${e.name})?.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty; return a != null ? Queue.of(a): null; }()';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<CollectionMapperEvent> get collectionToMappers => newTypeMap({
        // ---------------------------------------------------------------------
        // Standard.
        // ---------------------------------------------------------------------
        r'^(Map)\??$': (e) {
          return '${e.name}?.map((${e.args}) => MapEntry(${e.hashes},),).nonNulls.nullIfEmpty';
        },
        r'^(Iterable|List|Set|Queue)\??$': (e) {
          return '${e.name}?.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty?.toList()';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<MapperEvent> get objectFromMappers => newTypeMap({
        // ---------------------------------------------------------------------
        // Standard.
        // ---------------------------------------------------------------------
        r'^(dynamic)\??$': (e) {
          return '${e.name}';
        },
        r'^(String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty';
        },
        r'^(bool)\??$': (e) {
          return 'letBoolOrNull(${e.name})';
        },
        r'^(int)\??$': (e) {
          return 'letIntOrNull(${e.name})';
        },
        r'^(double)\??$': (e) {
          return 'letDoubleOrNull(${e.name})';
        },
        r'^(num)\??$': (e) {
          return 'letNumOrNull(${e.name})';
        },
        r'^(DateTime)\??$': (e) {
          // Mirror the Uri mapper: coerce to String first so a non-String JSON
          // value (int, etc.) doesn't throw a TypeError when handed to
          // DateTime.tryParse, which only accepts String.
          return '(){ final a = ${e.name}?.toString().trim().nullIfEmpty; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }()';
        },
        r'^(Duration)\??$': (e) {
          return '(){ final a = letAsOrNull<int>(${e.name}); return a != null ? Duration(microseconds: a): null; }()';
        },
        r'^(Uri)\??$': (e) {
          return '(){ final a = ${e.name}?.toString().trim().nullIfEmpty; return a != null ? Uri.tryParse(a): null; }()';
        },
        r'^(Color)\??$': (e) {
          return '(){ final a = letAsOrNull<int>(${e.name}); return a != null ? Color(a): null; }()';
        },
        r'^(BigInt)\??$': (e) {
          return '(){ final a = ${e.name}?.toString().trim().nullIfEmpty; return a != null ? BigInt.tryParse(a): null; }()';
        },
        r'^(Uint8List)\??$': (e) {
          return '(){ final a = ${e.name}?.toString().trim().nullIfEmpty; if (a == null) return null; try { return base64Decode(a); } catch (_) { return null; } }()';
        },
        r'^(RegExp)\??$': (e) {
          return '(){ final a = ${e.name}?.toString().trim().nullIfEmpty; if (a == null) return null; try { return RegExp(a); } catch (_) { return null; } }()';
        },
        r'^(Offset)\??$': (e) {
          return '(){ final a = letMapOrNull<String, dynamic>(${e.name}); return a != null ? Offset(letAsOrNull<double>(a[\'dx\']) ?? 0.0, letAsOrNull<double>(a[\'dy\']) ?? 0.0): null; }()';
        },
        r'^(Size)\??$': (e) {
          return '(){ final a = letMapOrNull<String, dynamic>(${e.name}); return a != null ? Size(letAsOrNull<double>(a[\'width\']) ?? 0.0, letAsOrNull<double>(a[\'height\']) ?? 0.0): null; }()';
        },
        r'^(Rect)\??$': (e) {
          return '(){ final a = letMapOrNull<String, dynamic>(${e.name}); return a != null ? Rect.fromLTRB(letAsOrNull<double>(a[\'left\']) ?? 0.0, letAsOrNull<double>(a[\'top\']) ?? 0.0, letAsOrNull<double>(a[\'right\']) ?? 0.0, letAsOrNull<double>(a[\'bottom\']) ?? 0.0): null; }()';
        },
        r'^(EdgeInsets)\??$': (e) {
          return '(){ final a = letMapOrNull<String, dynamic>(${e.name}); return a != null ? EdgeInsets.fromLTRB(letAsOrNull<double>(a[\'left\']) ?? 0.0, letAsOrNull<double>(a[\'top\']) ?? 0.0, letAsOrNull<double>(a[\'right\']) ?? 0.0, letAsOrNull<double>(a[\'bottom\']) ?? 0.0): null; }()';
        },
        r'^(Alignment)\??$': (e) {
          return '(){ final a = letMapOrNull<String, dynamic>(${e.name}); return a != null ? Alignment(letAsOrNull<double>(a[\'x\']) ?? 0.0, letAsOrNull<double>(a[\'y\']) ?? 0.0): null; }()';
        },
        r'^(Radius)\??$': (e) {
          return '(){ final a = letMapOrNull<String, dynamic>(${e.name}); return a != null ? Radius.elliptical(letAsOrNull<double>(a[\'x\']) ?? 0.0, letAsOrNull<double>(a[\'y\']) ?? 0.0): null; }()';
        },

        // ---------------------------------------------------------------------
        // Special.
        // ---------------------------------------------------------------------

        // Base types
        _strType(T_TRIMMED_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty',
        _strType(T_NO_SPACES_STRING): (e) =>
            "${e.name}?.toString().trim().nullIfEmpty?.replaceAll(' ', '')",
        _strType(T_SEARCHABLE_STRING): (e) =>
            "${e.name}?.toString().trim().nullIfEmpty?.toLowerCase().replaceAll(RegExp(r'[^\\w]'), '').nullIfEmpty",

        // Non-Trimmed Case Conversions
        _strType(T_LOWER_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toLowerCase()',
        _strType(T_UPPER_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toUpperCase()',
        _strType(T_LOWER_SNAKE_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toLowerSnakeCase()',
        _strType(T_UPPER_SNAKE_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toUpperSnakeCase()',
        _strType(T_LOWER_KEBAB_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toLowerKebabCase()',
        _strType(T_UPPER_KEBAB_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toUpperKebabCase()',
        _strType(T_CAMEL_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toCamelCase()',
        _strType(T_PASCAL_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toPascalCase()',

        // "Trimmed" Case Conversions (Functionally identical implementation to above)
        _strType(T_TRIMMED_LOWER_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toLowerCase()',
        _strType(T_TRIMMED_UPPER_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toUpperCase()',
        _strType(T_TRIMMED_LOWER_SNAKE_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toLowerSnakeCase()',
        _strType(T_TRIMMED_UPPER_SNAKE_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toUpperSnakeCase()',
        _strType(T_TRIMMED_LOWER_KEBAB_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toLowerKebabCase()',
        _strType(T_TRIMMED_UPPER_KEBAB_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toUpperKebabCase()',
        _strType(T_TRIMMED_CAMEL_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toCamelCase()',
        _strType(T_TRIMMED_PASCAL_CASE_STRING): (e) =>
            '${e.name}?.toString().trim().nullIfEmpty?.toPascalCase()',

        // ---------------------------------------------------------------------
        r'^(DataRefModel)\??$': (e) {
          return 'dataRefFromString(${e.name}?.toString())';
        },

        r'^(Type-?\w+|\w+-?Type)\??$': (e) {
          final typeName = e.matchGroups?.elementAt(1);
          return '$typeName.values.valueOf(${e.name}?.toString())';
        },
        r'^(Model-?\w+|\w+-?Model)\??$': (e) {
          final typeName = e.matchGroups?.elementAt(1);
          return '() { final a = letMapOrNull<String, dynamic>(${e.name}); return a != null ? $typeName.fromJson(a): null; }()';
        },
        r'^(Enum-?\w+|\w+-?Enum)\??$': (e) {
          final typeName = e.matchGroups?.elementAt(1);
          return '$typeName.values.valueOf(${e.name}?.toString())';
        },

        // ---------------------------------------------------------------------
        // Default.
        // ---------------------------------------------------------------------
        r'^(\w+)\??$': (e) {
          return '${e.name}';
        },
      });

  //
  //
  //

  @override
  TTypeMappers<MapperEvent> get objectToMappers => newTypeMap({
        // ---------------------------------------------------------------------
        // Standard.
        // ---------------------------------------------------------------------
        r'^(String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty';
        },
        r'^(dynamic|bool|int|double|num)\??$': (e) {
          return '${e.name}';
        },
        r'^(DateTime)\??$': (e) {
          return '${e.name}?.toUtc().toIso8601String()';
        },
        r'^(Duration)\??$': (e) {
          return '${e.name}?.inMicroseconds';
        },
        r'^(Uri)\??$': (e) {
          return '${e.name}?.toString()';
        },
        r'^(Color)\??$': (e) {
          return '${e.name}?.toARGB32()';
        },
        r'^(BigInt)\??$': (e) {
          return '${e.name}?.toString()';
        },
        r'^(Uint8List)\??$': (e) {
          return '${e.name} != null ? base64Encode(${e.name}!) : null';
        },
        r'^(RegExp)\??$': (e) {
          return '${e.name}?.pattern';
        },
        r'^(Offset)\??$': (e) {
          return "${e.name} != null ? {'dx': ${e.name}!.dx, 'dy': ${e.name}!.dy} : null";
        },
        r'^(Size)\??$': (e) {
          return "${e.name} != null ? {'width': ${e.name}!.width, 'height': ${e.name}!.height} : null";
        },
        r'^(Rect)\??$': (e) {
          return "${e.name} != null ? {'left': ${e.name}!.left, 'top': ${e.name}!.top, 'right': ${e.name}!.right, 'bottom': ${e.name}!.bottom} : null";
        },
        r'^(EdgeInsets)\??$': (e) {
          return "${e.name} != null ? {'left': ${e.name}!.left, 'top': ${e.name}!.top, 'right': ${e.name}!.right, 'bottom': ${e.name}!.bottom} : null";
        },
        r'^(Alignment)\??$': (e) {
          return "${e.name} != null ? {'x': ${e.name}!.x, 'y': ${e.name}!.y} : null";
        },
        r'^(Radius)\??$': (e) {
          return "${e.name} != null ? {'x': ${e.name}!.x, 'y': ${e.name}!.y} : null";
        },
        // ---------------------------------------------------------------------
        // Special.
        // ---------------------------------------------------------------------

        // Base types. Receiver is already a String — no toString() needed.
        _strType(T_TRIMMED_STRING): (e) => '${e.name}?.trim().nullIfEmpty',
        _strType(T_NO_SPACES_STRING): (e) =>
            "${e.name}?.trim().nullIfEmpty?.replaceAll(' ', '')",
        _strType(T_SEARCHABLE_STRING): (e) =>
            "${e.name}?.trim().nullIfEmpty?.toLowerCase().replaceAll(RegExp(r'[^\\w]'), '').nullIfEmpty",

        // Non-Trimmed Case Conversions
        _strType(T_LOWER_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toLowerCase()',
        _strType(T_UPPER_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toUpperCase()',
        _strType(T_LOWER_SNAKE_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toLowerSnakeCase()',
        _strType(T_UPPER_SNAKE_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toUpperSnakeCase()',
        _strType(T_LOWER_KEBAB_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toLowerKebabCase()',
        _strType(T_UPPER_KEBAB_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toUpperKebabCase()',
        _strType(T_CAMEL_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toCamelCase()',
        _strType(T_PASCAL_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toPascalCase()',

        // "Trimmed" Case Conversions (Functionally identical implementation to above)
        _strType(T_TRIMMED_LOWER_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toLowerCase()',
        _strType(T_TRIMMED_UPPER_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toUpperCase()',
        _strType(T_TRIMMED_LOWER_SNAKE_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toLowerSnakeCase()',
        _strType(T_TRIMMED_UPPER_SNAKE_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toUpperSnakeCase()',
        _strType(T_TRIMMED_LOWER_KEBAB_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toLowerKebabCase()',
        _strType(T_TRIMMED_UPPER_KEBAB_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toUpperKebabCase()',
        _strType(T_TRIMMED_CAMEL_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toCamelCase()',
        _strType(T_TRIMMED_PASCAL_CASE_STRING): (e) =>
            '${e.name}?.trim().nullIfEmpty?.toPascalCase()',

        r'^(Type-?\w+|\w+-?Type)\??$': (e) {
          return '${e.name}?.name';
        },
        r'^(DataRefModel)\??$': (e) {
          return '${e.name}?.path';
        },
        r'^(Model-?\w+|\w+-?Model)\??$': (e) {
          return '${e.name}?.toJson()';
        },
        r'^(Enum-?\w+|\w+-?Enum)\??$': (e) {
          return '${e.name}?.name';
        },

        // ---------------------------------------------------------------------
        // Default.
        // ---------------------------------------------------------------------
        r'^(\w+)\??$': (e) {
          return '${e.name}';
        },
      });

  //
  //
  //

  String _strType(String code) {
    return r'^(' + code + r')\??$';
  }
}
