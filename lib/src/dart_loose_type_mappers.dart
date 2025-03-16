//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by dev-cetera.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: always_declare_return_types

import 'package:df_gen_core/df_gen_core.dart';

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
  TTypeMappers<CollectionMapperEvent> get collectionToMappers => newTypeMap(
        {
          // ---------------------------------------------------------------------
          // Standard.
          // ---------------------------------------------------------------------
          r'^(Map)\??$': (e) {
            return '${e.name}?.map((${e.args}) => MapEntry(${e.hashes},),).nonNulls.nullIfEmpty';
          },
          r'^(Iterable|List|Set|Queue)\??$': (e) {
            return '${e.name}?.map((${e.args}) => ${e.hashes},).nonNulls.nullIfEmpty?.toList()';
          },
        },
      );

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
        r'^(LowerCase-String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty?.toLowerCase()';
        },
        r'^(Searchable-String)\??$': (e) {
          return "${e.name}?.toString().trim().nullIfEmpty?.toLowerCase().replaceAll(r'[^\\w]', '')";
        },
        r'^(UpperCase-String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty?.toUpperCase()';
        },
        r'^(LowerSnakeCase-String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty?.toLowerSnakeCase()';
        },
        r'^(UpperSnakeCase-String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty?.toUpperSnakeCase()';
        },
        r'^(LowerKebabCase-String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty?.toLowerKebabCase()';
        },
        r'^(UpperKebabCase-String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty?.toUpperKebabCase()';
        },
        r'^(LowerDotCase-String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty?.toLowerDotCase()';
        },
        r'^(UpperDotCase-String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty?.toUpperDotCase()';
        },
        r'^(CamelCase-String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty?.toCamelCase()';
        },
        r'^(PascalCase-String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty?.toPascalCase()';
        },
        r'^(UriPathCase-String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty?.toUriPathCase()';
        },
        r'^(PathCase-String)\??$': (e) {
          return '${e.name}?.toString().trim().nullIfEmpty?.toPathCase()';
        },
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
        r'^(LowerCase-String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty?.toLowerCase()';
        },
        r'^(Searchable-String)\??$': (e) {
          return "${e.name}?.trim().nullIfEmpty?.toLowerCase().replaceAll(r'[^\\w]', '')";
        },
        r'^(UpperCase-String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty?.toUpperCase()';
        },
        r'^(LowerSnakeCase-String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty?.toLowerSnakeCase()';
        },
        r'^(UpperSnakeCase-String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty?.toUpperSnakeCase()';
        },
        r'^(LowerKebabCase-String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty?.toLowerKebabCase()';
        },
        r'^(UpperKebabCase-String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty?.toUpperKebabCase()';
        },
        r'^(LowerDotCase-String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty?.toLowerDotCase()';
        },
        r'^(UpperDotCase-String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty?.toUpperDotCase()';
        },
        r'^(CamelCase-String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty?.toCamelCase()';
        },
        r'^(PascalCase-String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty?.toPascalCase()';
        },
        r'^(UriPathCase-String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty?.toUriPathCase()';
        },
        r'^(PathCase-String)\??$': (e) {
          return '${e.name}?.trim().nullIfEmpty?.toPathCase()';
        },
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
}
