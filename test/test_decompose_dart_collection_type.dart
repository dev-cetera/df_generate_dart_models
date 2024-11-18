import 'package:df_generate_dart_models/src/_utils/decompose_dart_collection_type.dart';
import 'package:test/test.dart';

void main() {
  group('decomposeDartCollectionType', () {
    test('1', () {
      final result = decomposeDartCollectionType('List<String>');
      expect(result.toString(), '([List<String>, List, String])');
    });
  });
}
