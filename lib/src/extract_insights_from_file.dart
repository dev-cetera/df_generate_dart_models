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

import 'dart:io' show File;

import 'package:analyzer/dart/element/element.dart' show EnumElement;
import 'package:analyzer/dart/element/type.dart' show InterfaceType;
import 'package:analyzer/dart/constant/value.dart' show DartObject;
import 'package:path/path.dart' as p;

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Analyzes the Dart file at [filePath] using [analysisContextCollection], and
/// and extracts class insights from it.
///
/// Each item in the list consists of the name of the analyzed class and the
/// annotation applied to that class.
Future<List<ClassInsight<GenerateDartModel>>> extractInsightsFromFile(
  String filePath,
  AnalysisContextCollection analysisContextCollection,
) async {
  final analyzer = DartAnnotatedClassAnalyzer(
    filePath: filePath,
    analysisContextCollection: analysisContextCollection,
  );

  final insights = <ClassInsight<GenerateDartModel>>[];
  late GenerateDartModel temp;
  await analyzer.analyze(
    inclClassAnnotations: {GenerateDartModel.CLASS_NAME},
    inclMemberAnnotations: {Field.CLASS_NAME},
    onClassAnnotationField: (p) async =>
        temp = _updateFromClassAnnotationField(temp, p),
    onAnnotatedMember: (p) async => temp = _updateFromAnnotatedMember(temp, p),
    onPreAnalysis: (_, className) => temp = const GenerateDartModel(fields: {}),
    onPostAnalysis: (params) {
      final fullPathName = params.fullFilePath;
      final fileName = p.basename(fullPathName);
      final dirPath = p.dirname(fullPathName);
      final supertypeName =
          _extractSupertypeName(fullPathName, params.className);
      final insight = ClassInsight<GenerateDartModel>(
        className: params.className,
        annotation: temp,
        dirPath: dirPath,
        fileName: fileName,
        supertypeName: supertypeName,
      );
      insights.add(insight);
    },
  );
  return insights;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Updates [annotation] by incorporating the field from [params] into its
/// "fields" property.
GenerateDartModel _updateFromClassAnnotationField(
  GenerateDartModel annotation,
  OnClassAnnotationFieldParams params,
) {
  switch (params.fieldName) {
    case GenerateDartModelFieldNames.className:
      return annotation.mergeWith(
        GenerateDartModel(className: params.fieldValue.toStringValue()),
      );
    case GenerateDartModelFieldNames.fields:
      return annotation.mergeWith(
        GenerateDartModel(
          fields: {
            ...?annotation.fields,
            ...?params.fieldValue.toSetValue()?.map((e) {
              final x = DartFromRecordOnDartObjectExt(e);
              try {
                final fieldPath = x.fieldPathFromRecord() ?? ['unknown'];
                var fieldType = x.fieldTypeFromRecord() ?? 'dynamic';
                // Analyzer-driven enum detection: if the slot was written as a
                // Type literal (`fieldType: AccountStatus`) and that type is
                // an enum, tag with `@enum` so the mapper routes it through
                // the enum codegen path regardless of class-name suffix.
                if (_isEnumFieldType(e)) {
                  fieldType = '$fieldType@enum';
                }
                final nullable = x.nullableFromRecord() ?? true;
                final children = x.childrenFromRecord();
                final primaryKey = x.primaryKeyFromRecord();
                final foreignKey = x.foreignKeyFromRecord();
                final description = x.descriptionFromRecord();
                final references = x.referencesFromRecord();
                final field = Field(
                  fieldPath: fieldPath,
                  fieldType: fieldType,
                  nullable: nullable,
                  children: children,
                  primaryKey: primaryKey,
                  foreignKey: foreignKey,
                  description: description,
                  references: references,
                );
                return field.toRecord;
              } catch (e) {
                Log.err(e);
                rethrow;
              }
            }),
          },
        ),
      );

    case GenerateDartModelFieldNames.shouldInherit:
      return annotation.mergeWith(
        GenerateDartModel(shouldInherit: params.fieldValue.toBoolValue()),
      );
    case GenerateDartModelFieldNames.inheritanceConstructor:
      return annotation.mergeWith(
        GenerateDartModel(
          inheritanceConstructor: params.fieldValue.toStringValue(),
        ),
      );
    case GenerateDartModelFieldNames.keyStringCase:
      return annotation.mergeWith(
        GenerateDartModel(keyStringCase: params.fieldValue.toStringValue()),
      );
    case GenerateDartModelFieldNames.description:
      return annotation.mergeWith(
        GenerateDartModel(description: params.fieldValue.toStringValue()),
      );
    default:
  }
  return GenerateDartModel.of(annotation);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Updates [annotation] by incorporating all members tagged with the @[Field]
/// annotation into its "fields" property.
GenerateDartModel _updateFromAnnotatedMember(
  GenerateDartModel annotation,
  OnAnnotatedMemberParams params,
) {
  if (params.memberAnnotationName == Field.CLASS_NAME) {
    // fieldPath may be a dot-separated String ('profile.id') or a list literal
    // (['profile', 'id']). Check the String shape first — `dartObjToStringList`
    // wraps single Strings as `[s]`, which would collapse a multi-segment path
    // into one key.
    final pathField =
        params.memberAnnotationFields[FieldModelFieldNames.fieldPath];
    final pathStr = pathField?.toStringValue();
    final a1 = (pathStr != null && pathStr.isNotEmpty)
        ? pathStr.split('.')
        : dartObjToStringList(pathField);
    final a2 = [params.memberName];
    final b1 = params.memberAnnotationFields[FieldModelFieldNames.fieldType]
        ?.toStringValue();
    // ignore: deprecated_member_use
    var b2 = params.memberType.getDisplayString();
    // Analyzer-driven enum detection: when the source declaration's type is
    // an enum, tag the resolved type code with `@enum`. The annotation's
    // explicit `fieldType:` string (b1) wins if provided, since the user may
    // have overridden the wire shape on purpose (e.g. a raw int column).
    if (b1 == null) {
      final type = params.memberType;
      if (type is InterfaceType && type.element is EnumElement) {
        b2 = '$b2@enum';
      }
    }
    // Also honour an enum tag when the annotation field used a Type literal.
    final fieldTypeSlot =
        params.memberAnnotationFields[FieldModelFieldNames.fieldType];
    if (b1 == null && _isEnumDartObject(fieldTypeSlot)) {
      b2 = b2.endsWith('@enum') ? b2 : '$b2@enum';
    }
    final nullable = params
        .memberAnnotationFields[FieldModelFieldNames.nullable]
        ?.toBoolValue();
    final primaryKey = params
        .memberAnnotationFields[FieldModelFieldNames.primaryKey]
        ?.toBoolValue();
    final foreignKey = params
        .memberAnnotationFields[FieldModelFieldNames.foreignKey]
        ?.toBoolValue();
    final children = (dartObjToObject(
      params.memberAnnotationFields[FieldModelFieldNames.children],
    ) as List?)
        ?.map((e) => (e as Map).map((k, v) => MapEntry(k.toString(), v)))
        .nonNulls
        .toList();
    final description = params
        .memberAnnotationFields[FieldModelFieldNames.description]
        ?.toStringValue();
    final references = params
        .memberAnnotationFields[FieldModelFieldNames.references]
        ?.toTypeValue()
        ?.getDisplayString();
    final field = DartField(
      fieldPath: a1 ?? a2,
      fieldType: b1 ?? b2,
      nullable: nullable,
      primaryKey: primaryKey,
      foreignKey: foreignKey,
      children: children,
      description: description,
      references: references,
    );
    annotation = annotation.mergeWith(
      GenerateDartModel(fields: {...?annotation.fields, field.toRecord}),
    );
  }
  return annotation;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Whether the `fieldType:` slot on a Field-shaped DartObject is a Type
/// literal pointing to an enum (e.g. `Field(fieldType: AccountStatus, ...)`).
/// Returns false when the slot is a String literal — the legacy
/// `'StatusType'` form goes through the suffix-based mapper instead.
bool _isEnumFieldType(DartObject record) {
  return _isEnumDartObject(record.getField(FieldModelFieldNames.fieldType));
}

bool _isEnumDartObject(DartObject? slot) {
  if (slot == null) return false;
  final type = slot.toTypeValue();
  if (type is! InterfaceType) return false;
  return type.element is EnumElement;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Reads the source file at [fullPathName] and extracts the direct supertype
/// of the class named [className]. Used by the generator to decide
/// inheritance-driven behaviours (Equatable opt-out for `extends BaseModel`).
///
/// Returns `null` when the class declaration can't be found, doesn't have an
/// `extends` clause, or the file can't be read. The lookup is regex-based
/// rather than analyzer-based because the analyzer's public callback API
/// (`OnAnnotatedClassParams`) doesn't expose the class hierarchy.
String? _extractSupertypeName(String fullPathName, String className) {
  try {
    final src = File(fullPathName).readAsStringSync();
    // Match `[abstract] [base|final|sealed|interface|mixin] class X extends Y[ ...] {`.
    // The `extends` clause is optional (a class without it has no specific
    // supertype to inherit from); we only return a name when it's present.
    final pattern = RegExp(
      r'(?:^|\n)\s*(?:abstract\s+)?(?:base\s+|final\s+|sealed\s+|interface\s+|mixin\s+)?class\s+' +
          RegExp.escape(className) +
          r'\b(?:<[^>]*>)?\s+extends\s+([A-Za-z_][\w]*)',
    );
    final match = pattern.firstMatch(src);
    return match?.group(1);
  } catch (_) {
    return null;
  }
}
