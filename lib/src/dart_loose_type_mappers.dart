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

class DartLooseTypeMappers extends TypeMappers {
  //
  //
  //

  static final instance = DartLooseTypeMappers._();

  //
  //
  //

  DartLooseTypeMappers._();

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
          return 'letAsOrNull<bool>(${e.name})';
        },
        r'^(int)\??$': (e) {
          return 'letAsOrNull<int>(${e.name})';
        },
        r'^(double)\??$': (e) {
          return 'letAsOrNull<double>(${e.name})';
        },
        r'^(num)\??$': (e) {
          return 'letAsOrNull<num>(${e.name})';
        },
        r'^(Timestamp)\??$': (e) {
          return '() { final a = ${e.name}; return a is Timestamp ? a: null; }()';
        },
        r'^(DateTime)\??$': (e) {
          return '() { final a = ${e.name}; return a != null ? DateTime.tryParse(a)?.toUtc(): null; }()';
        },
        r'^(Duration)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty?.tryParseDuration()';
        },
        r'^(Uri)\??$': (e) {
          return '(){ final a = ${e.name}?.toString().trim().nullIfEmpty; return a != null ? Uri.tryParse(a): null; }()';
        },
        r'^(Color)\??$': (e) {
          return '(){ final a = letAsOrNull<int>(${e.name}); return a is int ? Color(a): null; }()';
        },

        // ---------------------------------------------------------------------
        // Special.
        // ---------------------------------------------------------------------

        // Base types
        _strType(T_TRIMMED_STRING): (e) => '${e.name}?.toString().trim().nullIfEmpty',
        _strType(T_NO_SPACES_STRING): (e) =>
            "${e.name}?.toString().trim().nullIfEmpty?.replaceAll(' ', '')",
        _strType(T_SEARCHABLE_STRING): (e) =>
            "${e.name}?.toString().trim().nullIfEmpty?.toLowerCase().replaceAll(r'[^\\w]', '')",

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

        r'^(Type-?\w*|\w*-?Type)\??$': (e) {
          final typeName = e.matchGroups?.elementAt(1);
          return '$typeName.values.valueOf(${e.name}?.toString())';
        },
        r'^(Model-?\w*|\w*-?Model)\??$': (e) {
          final typeName = e.matchGroups?.elementAt(1);
          return '() { final a = letMapOrNull<String, dynamic>(${e.name}); return a != null ? $typeName.fromJson(a): null; }()';
        },
        r'^(Enum-?\w*|\w*-?Enum)\??$': (e) {
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
        r'^(dynamic|bool|int|double|num|Timestamp)\??$': (e) {
          return '${e.name}';
        },
        r'^(DateTime)\??$': (e) {
          return '${e.name}?.toUtc()?.toIso8601String()';
        },
        r'^(Duration|Uri)\??$': (e) {
          return '${e.name}?.toString()';
        },
        r'^(Color)\??$': (e) {
          return '${e.name}?.value';
        },
        // ---------------------------------------------------------------------
        // Special.
        // ---------------------------------------------------------------------

        // Base types
        _strType(T_TRIMMED_STRING): (e) => '${e.name}?.toString().trim().nullIfEmpty',
        _strType(T_NO_SPACES_STRING): (e) =>
            "${e.name}?.toString().trim().nullIfEmpty?.replaceAll(' ', '')",
        _strType(T_SEARCHABLE_STRING): (e) =>
            "${e.name}?.toString().trim().nullIfEmpty?.toLowerCase().replaceAll(r'[^\\w]', '')",

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

        r'^(Type-?\w*|\w*-?Type)\??$': (e) {
          return '${e.name}?.name';
        },
        r'^(DataRefModel)\??$': (e) {
          return '${e.name}?.path';
        },
        r'^(Model-?\w*|\w*-?Model)\??$': (e) {
          return '${e.name}?.toJson()';
        },
        r'^(Enum-?\w*|\w*-?Enum)\??$': (e) {
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
    return r'^($' + code + r')\??$';
  }
}
