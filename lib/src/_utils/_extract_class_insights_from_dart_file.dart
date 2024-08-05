//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. See LICENSE file
// in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: library_private_types_in_public_api

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:path/path.dart' as p;
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:df_gen_core/df_gen_core.dart';

import '../dart_utils/dart_annotated_class_analyzer.dart';
import '../dart_utils/dart_field.dart';
import '../dart_utils/dart_from_record_on_dart_object_x.dart';
import '../dart_utils/dart_obj_to_list.dart';

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
    onClassAnnotationField: (p) async => temp = _updateFromClassAnnotationField(temp, p),
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
      return annotation.copyWith(
        GenerateDartModel(
          className: params.fieldValue.toStringValue(),
        ),
      );
    case GenerateDartModelFieldNames.fields:
      return annotation.copyWith(
        GenerateDartModel(
          fields: {
            ...?annotation.fields,
            ...?params.fieldValue.toSetValue()?.map((e) {
              final field = Field(
                fieldPath: e.fieldPathFromRecord()!,
                fieldType: e.fieldTypeFromRecord()!,
                nullable: e.nullableFromRecord()!,
              );
              return field.toRecord;
            }),
          },
        ),
      );
    case GenerateDartModelFieldNames.shouldInherit:
      return annotation.copyWith(
        GenerateDartModel(
          shouldInherit: params.fieldValue.toBoolValue(),
        ),
      );
    case GenerateDartModelFieldNames.inheritanceConstructor:
      return annotation.copyWith(
        GenerateDartModel(
          inheritanceConstructor: params.fieldValue.toStringValue(),
        ),
      );
    case GenerateDartModelFieldNames.keyStringCase:
      return annotation.copyWith(
        GenerateDartModel(
          keyStringCase: params.fieldValue.toStringValue(),
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
    final a1 = dartObjToList(params.memberAnnotationFields[FieldFieldNames.fieldPath]);
    final a2 = [params.memberName];
    final b1 = params.memberAnnotationFields[FieldFieldNames.fieldType]?.toStringValue();

    final b2 = params.memberType.getDisplayString();
    final c1 = params.memberAnnotationFields[FieldFieldNames.nullable]?.toBoolValue();
    final field = DartField(
      fieldPath: a1 ?? a2,
      fieldType: b1 ?? b2,
      nullable: c1,
    );
    annotation = annotation.copyWith(
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
