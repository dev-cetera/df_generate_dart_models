// Runs the real generator over models whose field type no mapper handles, or
// cannot be resolved, and checks that generation stops with an error that
// names the field, the class and the source file, instead of writing code
// that copies the value unconverted.

import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:test/test.dart';

const _source = '''
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

part '_model_bad.g.dart';

/// A nested model whose class name has no Model/Res/Req/Entry/Spec affix.
class Address {
  const Address();
}

@GenerateDartModel(
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['id'], fieldType: String, nullable: true),
    Field(fieldPath: ['home'], fieldType: Address, nullable: true),
  },
)
abstract class _ModelBad extends Model {
  const _ModelBad();
}
''';

const _unresolvedSource = '''
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

part '_model_bad.g.dart';

@GenerateDartModel(
  shouldInherit: true,
  fields: {
    // A left-out fieldType is the documented `dynamic` shorthand.
    Field(fieldPath: ['loose'], nullable: true),
    // `ModelNotImported` is not imported, so the analyzer cannot resolve it.
    Field(fieldPath: ['home'], fieldType: ModelNotImported, nullable: true),
  },
)
abstract class _ModelBad extends Model {
  const _ModelBad();
}
''';

Future<ProcessResult> _generate(Directory dir) {
  return Process.run(Platform.resolvedExecutable, [
    'run',
    p.join('bin', 'df_generate_dart_models.dart'),
    '-i',
    dir.path,
    '-t',
    p.join('templates', 'featured_v1.dart.md'),
  ]);
}

void main() {
  // Inside the package so the fixture resolves this package's dependencies.
  final dir = Directory(p.join('test', 'integration', '_unmapped_type_tmp'));
  final sourceFile = File(p.join(dir.path, 'model_bad.dart'));
  final generatedFile = File(p.join(dir.path, '_model_bad.g.dart'));

  setUp(() async {
    if (await dir.exists()) await dir.delete(recursive: true);
    await dir.create(recursive: true);
  });

  tearDown(() async {
    if (await dir.exists()) await dir.delete(recursive: true);
  });

  test(
    'an unmapped field type stops generation and names type, field, class '
    'and file',
    () async {
      await sourceFile.writeAsString(_source);
      final result = await _generate(dir);
      final output = '${result.stdout}\n${result.stderr}';
      expect(result.exitCode, isNot(0), reason: output);
      expect(output, contains('UnmappedTypeException'));
      expect(output, contains('`Address?`'));
      expect(output, contains('field `home`'));
      expect(output, contains('class `_ModelBad`'));
      expect(output, contains('model_bad.dart'));
      expect(generatedFile.existsSync(), isFalse);
    },
    timeout: const Timeout(Duration(minutes: 5)),
  );

  test(
    'a fieldType that is not imported stops generation instead of becoming '
    'dynamic',
    () async {
      await sourceFile.writeAsString(_unresolvedSource);
      final result = await _generate(dir);
      final output = '${result.stdout}\n${result.stderr}';
      expect(result.exitCode, isNot(0), reason: output);
      expect(output, contains('field `home`'));
      expect(output, isNot(contains('field `loose`')));
      expect(output, contains('`_ModelBad`'));
      expect(output, contains('model_bad.dart'));
      expect(output, contains('could not be resolved'));
      expect(generatedFile.existsSync(), isFalse);
    },
    timeout: const Timeout(Duration(minutes: 5)),
  );
}
