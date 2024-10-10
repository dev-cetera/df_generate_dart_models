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

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:path/path.dart' as p;
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:df_gen_core/df_gen_core.dart';

import '/src/_dart_utils/_index.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Analyzes the Dart file at [filePath] using [analysisContextCollection], and
/// and extracts class insights from it.
///
/// Each item in the list consists of the name of the analyzed class and the
/// annotation applied to that class.
Future<List<_ClassInsight>> extractClassInsightsFromDartFile(
  AnalysisContextCollection analysisContextCollection,
  String filePath,
) async {
  final analyzer = DartAnnotatedClassAnalyzer(
    filePath: filePath,
    analysisContextCollection: analysisContextCollection,
  );

  final insights = <_ClassInsight>[];
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
      final insight = _ClassInsight(
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
        GenerateDartModel(
          className: params.fieldValue.toStringValue(),
        ),
      );
    case GenerateDartModelFieldNames.fields:
      return annotation.mergeWith(
        GenerateDartModel(
          fields: {
            ...?annotation.fields,
            ...?params.fieldValue.toSetValue()?.map((e) {
              final field = Field(
                fieldPath: e.fieldPathFromRecord() ?? ['unknown'],
                fieldType: e.fieldTypeFromRecord() ?? 'dynamic',
                nullable: e.nullableFromRecord() ?? true,
                children: e.childrenFromRecord(),
                primaryKey: e.primaryKeyFromRecord(),
                foreignKey: e.foreignKeyFromRecord(),
                fallback: e.fallbackFromRecord(),
                description: e.descriptionFromRecord(),
              );
              return field.toRecord;
            }),
          },
        ),
      );
    case GenerateDartModelFieldNames.shouldInherit:
      return annotation.mergeWith(
        GenerateDartModel(
          shouldInherit: params.fieldValue.toBoolValue(),
        ),
      );
    case GenerateDartModelFieldNames.inheritanceConstructor:
      return annotation.mergeWith(
        GenerateDartModel(
          inheritanceConstructor: params.fieldValue.toStringValue(),
        ),
      );
    case GenerateDartModelFieldNames.keyStringCase:
      return annotation.mergeWith(
        GenerateDartModel(
          keyStringCase: params.fieldValue.toStringValue(),
        ),
      );
    case GenerateDartModelFieldNames.description:
      return annotation.mergeWith(
        GenerateDartModel(
          description: params.fieldValue.toStringValue(),
        ),
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
    final b2 = params.memberType.getDisplayString();
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
      GenerateDartModel(
        fields: {
          ...?annotation.fields,
          field.toRecord,
        },
      ),
    );
  }
  return annotation;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _ClassInsight = ClassInsight<GenerateDartModel>;
