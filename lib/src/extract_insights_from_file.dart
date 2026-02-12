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
  dynamic analysisContextCollection,
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
      final insight = ClassInsight<GenerateDartModel>(
        className: params.className,
        annotation: temp,
        dirPath: dirPath,
        fileName: fileName,
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
              final x = DartFromRecordOnDartObjectX(e);
              try {
                final fieldPath = x.fieldPathFromRecord() ?? ['unknown'];
                final fieldType = x.fieldTypeFromRecord() ?? 'dynamic';
                final nullable = x.nullableFromRecord() ?? true;
                final children = x.childrenFromRecord();
                final primaryKey = x.primaryKeyFromRecord();
                final foreignKey = x.foreignKeyFromRecord();
                final fallback = x.fallbackFromRecord();
                final description = x.descriptionFromRecord();
                final field = Field(
                  fieldPath: fieldPath,
                  fieldType: fieldType,
                  nullable: nullable,
                  children: children,
                  primaryKey: primaryKey,
                  foreignKey: foreignKey,
                  fallback: fallback,
                  description: description,
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
    final a1 = dartObjToStringList(
      params.memberAnnotationFields[FieldModelFieldNames.fieldPath],
    );
    final a2 = [params.memberName];
    final b1 = params.memberAnnotationFields[FieldModelFieldNames.fieldType]
        ?.toStringValue();
    // ignore: deprecated_member_use
    final b2 = params.memberType.getDisplayString(withNullability: false);
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
    final fallback = params
        .memberAnnotationFields[FieldModelFieldNames.fallback]
        ?.toListValue();
    final description = params
        .memberAnnotationFields[FieldModelFieldNames.description]
        ?.toStringValue();
    final field = DartField(
      fieldPath: a1 ?? a2,
      fieldType: b1 ?? b2,
      nullable: nullable,
      primaryKey: primaryKey,
      foreignKey: foreignKey,
      children: children,
      fallback: fallback,
      description: description,
    );
    annotation = annotation.mergeWith(
      GenerateDartModel(fields: {...?annotation.fields, field.toRecord}),
    );
  }
  return annotation;
}
