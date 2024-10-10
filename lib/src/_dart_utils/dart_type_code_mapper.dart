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

import 'package:df_gen_core/df_gen_core.dart';

import 'decompose_dart_collection_type.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class DartTypeCodeMapper {
  //
  //
  //

  final TTypeMappers mappers;

  //
  //
  //

  const DartTypeCodeMapper(
    this.mappers,
  );

  //
  //
  //

  String map({
    required String fieldName,
    required String fieldTypeCode,
  }) {
    var result = mapCollection(
      fieldName: fieldName,
      genericTypeCode: fieldTypeCode,
    );
    if (result == '#x0') {
      result = mapObject(
        fieldName: fieldName,
        fieldTypeCode: fieldTypeCode,
      );
    }
    return result;
  }

//
//
//

  String mapObject({
    required String fieldName,
    required String fieldTypeCode,
  }) {
    final formula = buildObjectMapper(fieldTypeCode, fieldName, mappers) ?? '#x0';
    return formula;
  }

//
//
//

  String mapCollection({
    required String fieldName,
    required String genericTypeCode,
  }) {
    // Break the typeCode up into to a list of type data that can be processed
    // by the builder.
    final typeData = decomposeDartCollectionType(genericTypeCode);
    // Use the typeData to build a mapping formula.
    var formula = buildCollectionMapper(typeData, mappers);
    // Insert the field name into the formula.
    formula = formula.replaceFirst('p0', fieldName);
    return formula;
  }
}
