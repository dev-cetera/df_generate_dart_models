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
import 'package:df_gen_core/df_gen_core.dart' as df_gen_core;
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';

import 'package:path/path.dart' as p;

import 'dart_loose_type_mappers.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> genModelsApp(
  List<String> args, {
  String defaultTemplatePathOrUrl =
      'https://raw.githubusercontent.com/robmllze/df_generate_dart_models/main/templates/v2.dart.md',
}) async {
  final OUTPUT_FILE_NAME_PATTERN = const df_gen_core.Option(
    name: 'output-file-name',
    defaultsTo: '_{class}.g.dart',
  );
  final parser = CliParser(
    title: 'DevCetra.com/df/tools',
    description:
        'A tool for generating Dart data models for classes annotated with @GenerateDartModel.',
    example: 'gen-models -i .',
    additional:
        'For contributions, error reports and information, visit: https://github.com/DevCetra.',
    params: [
      DefaultFlags.HELP.flag,
      DefaultOptions.INPUT_PATH.option.copyWith(
        defaultsTo: FileSystemUtility.i.currentDir,
      ),
      DefaultOptions.TEMPLATE_PATH_OR_URL.option.copyWith(
        defaultsTo: defaultTemplatePathOrUrl,
      ),
      DefaultOptions.DART_SDK.option,
      OUTPUT_FILE_NAME_PATTERN,
    ],
  );
  final (argResults, argParser) = parser.parse(args);
  final help = argResults.flag(DefaultFlags.HELP.name);
  if (help) {
    _print(
      printCyan,
      parser.getInfo(argParser),
    );
    exit(ExitCodes.SUCCESS.code);
  }
  late final String inputPath;
  late final String templatePathOrUrl;
  late final String? dartSdk;
  late final String outputFileNamePattern;
  try {
    inputPath = argResults.option(DefaultOptions.INPUT_PATH.name)!;
    templatePathOrUrl = argResults.option(DefaultOptions.TEMPLATE_PATH_OR_URL.name)!;
    dartSdk = argResults.option(DefaultOptions.DART_SDK.name);
    outputFileNamePattern = argResults.option(OUTPUT_FILE_NAME_PATTERN.name)!;
  } catch (_) {
    _print(
      printRed,
      'Missing required args! Use --help flag for more information.',
    );
    exit(ExitCodes.FAILURE.code);
  }
  final analysisContextCollection = createDartAnalysisContextCollection(
    {inputPath},
    dartSdk,
  );
  final spinner = Spinner();
  spinner.start();
  _print(
    printWhite,
    'Reading template at: $templatePathOrUrl...',
  );
  final result = await MdTemplateUtility.i.readTemplateFromPathOrUrl(
    templatePathOrUrl,
  );
  if (result.isErr) {
    _print(
      printRed,
      ' Failed to read template!',
      spinner,
    );
    exit(ExitCodes.FAILURE.code);
  }
  final template = result.unwrap();
  _print(
    printWhite,
    'Looking for Dart files..',
  );
  final filePathStream0 = PathExplorer(inputPath).exploreFiles();
  final filePathStream1 = filePathStream0.where((e) => _isAllowedFileName(e.path));
  List<FilePathExplorerFinding> findings;
  try {
    findings = await filePathStream1.toList();
  } catch (e) {
    _print(
      printRed,
      'Failed to read file tree!',
      spinner,
    );
    exit(ExitCodes.FAILURE.code);
  }

  _print(
    printWhite,
    'Generating your models...',
    spinner,
  );
  try {
    for (final finding in findings) {
      final inputFilePath = finding.path;
      final insights = await extractInsightsFromFile(
        analysisContextCollection,
        inputFilePath,
      );
      for (final insight in insights) {
        final output = _interpolator.interpolate(template, insight);
        final fileName = outputFileNamePattern.replaceData({
          '{file}': PathUtility.i.localBaseNameWithoutExtension(inputFilePath),
          '{class}': () {
            var temp = (insight.annotation.className ?? insight.className);
            temp = temp.startsWith('_') ? temp.substring(1) : temp;
            return temp.toSnakeCase();
          }(),
        });
        final outputFilePath = p.join(
          PathUtility.i.localDirName(inputFilePath),
          fileName,
        );
        await FileSystemUtility.i.writeLocalFile(outputFilePath, output);
        printWhite(
          '[gen-models] ✔ Generated $fileName',
        );
      }
    }
  } catch (e) {
    _print(
      printRed,
      '✘ One or more files failed to generate!',
      spinner,
    );
    exit(ExitCodes.FAILURE.code);
  }
  _print(
    printWhite,
    'Fixing generated files..',
    spinner,
  );
  await fixDartFile(inputPath);
  _print(
    printWhite,
    'Formatting generated files..',
    spinner,
  );
  spinner.start();
  await fmtDartFile(inputPath);
  spinner.stop();
  _print(
    printGreen,
    'Done!',
  );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void _print(
  void Function(String) print,
  String message, [
  Spinner? spinner,
]) {
  spinner?.stop();
  print('[gen-models] $message');
  spinner?.start();
}

bool _isAllowedFileName(String e) {
  return !e.endsWith('.g.dart') && e.endsWith('.dart');
}

final _interpolator = TemplateInterpolator<ClassInsight<GenerateDartModel>>(
  {
    '___DESCRIPTION___': (insight) {
      return insight.annotation.description ?? 'Generated class for [${insight.className}].';
    },
    '___SUPER_CLASS_NAME___': (insight) {
      return insight.annotation.shouldInherit == true ? insight.className : 'Model';
    },
    '___CLASS_FILE_NAME___': (insight) {
      return insight.fileName;
    },
    '___CLASS_NAME___': (insight) {
      return insight.annotation.className ??
          insight.className.replaceFirst(
            RegExp(r'^[_$]+'),
            '',
          );
    },
    '___SUPER_CONSTRUCTOR___': (insight) {
      return insight.annotation.shouldInherit == true
          ? insight.annotation.inheritanceConstructor?.nullIfEmpty != null
              ? ': super.${insight.annotation.inheritanceConstructor}()'
              : ''
          : '';
    },
    '___FIELD_DECLARATIONS___': (insight) {
      return insight.fields.map(
        (e) {
          final description = e.description;
          final t = e.fieldType!;
          final r = stripSpecialSyntaxFromFieldType(t);
          final f = e.fieldName;
          return [
            '  /// ${description ?? 'No description provided.'}',
            'final $r? $f;',
            '',
          ].join('\n');
        },
      ).join('\n');
    },
    '___PARAMS___': (insight) {
      return insight.fields.map(
        (e) {
          final n = e.nullable;
          final f = e.fieldName;
          return '${n ? '' : 'required'} this.$f,';
        },
      ).join('\n');
    },
    '___PERMISSIVE_PARAMS___': (insight) {
      return insight.fields.map(
        (e) {
          final f = e.fieldName;
          return 'this.$f,';
        },
      ).join('\n');
    },
    '___STRICT_PARAMS___': (insight) {
      return insight.fields.map(
        (e) {
          final t = e.fieldType!;
          final r = stripSpecialSyntaxFromFieldType(t);
          final f = e.fieldName;
          return '$r? $f,';
        },
      ).join('\n');
    },
    '___STRICT_PARAM_ASSERTIONS___': (insight) {
      return insight.fields.map(
        (e) {
          final n = e.nullable;
          final f = e.fieldName;
          return n ? '' : 'assert($f != null);';
        },
      ).join('\n');
    },
    '___STRICT_ARGS___': (insight) {
      return insight.fields.map(
        (e) {
          final f = e.fieldName;
          return '$f: $f,';
        },
      ).join('\n');
    },
    '___FROM_JSON_OR_NULL_PARAMS___': (insight) {
      final fields = insight.fields.toList();
      String $v(String a, DartField field) {
        final fieldPath = field.fieldPath;
        if (fieldPath == null || fieldPath.isEmpty) return '';
        final parts = insight.stringCaseType.convertAll(field.fieldPath!);
        final f = field.fieldName;
        final x = field.fieldTypeCode!;
        final s = stripSpecialSyntaxFromFieldType(x);
        final b = DartTypeCodeMapper(DartLooseTypeMappers.instance.fromMappers).map(
          fieldName: "$a?['${parts.last}']",
          fieldTypeCode: s,
        );
        return 'final $f = $b;';
      }

      final j = fields.map((a) {
        final ff = fields
            .where(
              (b) => a.fieldPath!.join('.').startsWith('${b.fieldPath!.join('.')}.'),
            )
            .toList();
        ff.sort((a, b) => b.fieldName!.compareTo(a.fieldName!));
        return $v(ff.length > 1 ? '${ff[1].fieldName}' : 'json', a);
      });
      return j.join('\n');
    },
    '___FROM_JSON_OR_NULL_ARGS___': (insight) {
      return insight.fields.map(
        (e) {
          final f = e.fieldName;
          return '$f: $f,';
        },
      ).join('\n');
    },
    '___TO_JSON_PARAMS___': (insight) {
      return insight.fields.map(
        (e) {
          final f = e.fieldName!;
          final f0 = '${f}0';
          final x = e.fieldTypeCode!;
          final s = stripSpecialSyntaxFromFieldType(x);
          final a = DartTypeCodeMapper(DartLooseTypeMappers.instance.toMappers).map(
            fieldName: f,
            fieldTypeCode: s,
          );
          return 'final $f0 = $a;';
        },
      ).join('\n');
    },
    '___TO_JSON_ARGS___': (insight) {
      final fields = insight.fields.toList();
      final parents = fields
          .where(
            (f1) =>
                f1.fieldType == 'Map<String, dynamic>' &&
                fields
                    .map((e) => e.fieldPath!.join('.'))
                    .any((e) => e.startsWith('${f1.fieldPath!.join('.')}.')),
          )
          .toList();
      fields.removeWhere((e) => parents.contains(e));
      final stringCaseType = insight.stringCaseType;
      final entries = fields
          .map(
            (e) => MapEntry(
              stringCaseType.convertAll(e.fieldPath!).join('.'),
              '${e.fieldName}0',
            ),
          )
          .toList()
        ..sort((a, b) => b.key.compareTo(a.key));

      var buffer = <String, dynamic>{};

      for (final e in entries) {
        traverseMap(
          buffer,
          e.key.split('.').map((e) => "'$e'").toList(),
          newValue: e.value,
        );
      }

      for (final parent in parents) {
        traverseMap(
          buffer,
          [
            ...parent.fieldPath!.map((e) => "'${insight.stringCaseType.convert(e)}'"),
            '#',
          ],
          newValue: '...?${parent.fieldName}0,',
        );
      }
      final test = buffer.entries.map((e) => '${e.key}: ${e.value},').join();
      return test.replaceAll('#:', '');
    },
    '___GETTERS___': (insight) {
      return insight.fields.map(
        (e) {
          final f = e.fieldName;
          final x = e.fieldTypeCode!;
          final s = stripSpecialSyntaxFromFieldType(x);
          final n = e.nullable;
          return [
            '  /// Returns the value of the [$f] field.',
            '  /// If the field is nullable, the return value may be null; otherwise, it',
            '  /// will always return a non-null value.',
            "@pragma('vm:prefer-inline')",
            '$s get $f\$ => $f${n ? '' : '!'};',
            '',
          ].join('\n');
        },
      ).join('\n');
    },
    '___FIELD_NAMES___': (insight) {
      return insight.fields.map(
        (e) {
          final className = insight.annotation.className ??
              insight.className.replaceFirst(
                RegExp(r'^[_$]+'),
                '',
              );
          final f = e.fieldName;
          final c = insight.stringCaseType.convert(e.fieldName!);
          return [
            '  /// The field name of [$className.$f].',
            "static const $f = '$c';",
            '',
          ].join('\n');
        },
      ).join('\n');
    },
    '___COPY_WITH_PARAMS___': (insight) {
      return insight.fields.map(
        (e) {
          final f = e.fieldName;
          final t = e.fieldType!;
          final r = stripSpecialSyntaxFromFieldType(t);
          return '$r? $f,';
        },
      ).join('\n');
    },
    '___COPY_WITH_ARGS___': (insight) {
      return insight.fields.map(
        (e) {
          final f = e.fieldName;
          return '$f: $f ?? this.$f,';
        },
      ).join('\n');
    },
    '___COPY_WITHOUT_PARAMS___': (insight) {
      return insight.fields.map(
        (e) {
          final f = e.fieldName;
          return 'bool $f = true,';
        },
      ).join('\n');
    },
    '___COPY_WITHOUT_ARGS___': (insight) {
      return insight.fields.map(
        (e) {
          final f = e.fieldName;
          return '$f: $f ? this.$f: null,';
        },
      ).join('\n');
    },
  },
);

extension _ClassInsightExtension on ClassInsight<GenerateDartModel> {
  Iterable<DartField> get fields {
    return annotation.fields?.whereType<TFieldRecord>().map((e) {
          e.runtimeType;
          return DartField.fromRecord(e);
        }).nonNulls ??
        {};
  }

  StringCaseType get stringCaseType {
    return StringCaseType.values.valueOf(annotation.keyStringCase) ?? StringCaseType.CAMEL_CASE;
  }
}
