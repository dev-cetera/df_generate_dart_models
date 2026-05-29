import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';
import 'package:test/test.dart';

void main() {
  group('isMatchingFileName — case-insensitive', () {
    test('lowercase filename, lowercase begType', () {
      final r = isMatchingFileName('foo_bar.dart', 'foo', 'dart');
      expect(r.status, isTrue);
    });

    test('UPPERCASE begType against lowercase filename', () {
      final r = isMatchingFileName('foo_bar.dart', 'FOO', 'dart');
      expect(r.status, isTrue);
    });

    test('Mixed-case filename with lowercase begType', () {
      final r = isMatchingFileName('Foo_bar.dart', 'foo', 'dart');
      expect(r.status, isTrue);
    });

    test('Mixed-case extension', () {
      final r = isMatchingFileName('foo_bar.DART', '', 'dart');
      expect(r.status, isTrue);
    });

    test('Original (not lowercased) fileName is returned', () {
      final r = isMatchingFileName('Foo_bar.dart', 'foo', 'dart');
      expect(r.fileName, 'Foo_bar.dart');
    });
  });

  group('buildCollectionMapper', () {
    test('List<int> → formula', () {
      final mappers = newTypeMap<MapperEvent>({
        r'^(List)\??$': (e) {
          final c = e as CollectionMapperEvent;
          return 'LIST(${c.hashes})';
        },
        r'^(int)\??$': (e) => 'INT(${e.name})',
      });
      final typeData = decomposeDartCollectionType('List<int>');
      final r = buildCollectionMapper(typeData, mappers);
      expect(r, 'LIST(INT(p0))');
    });

    test('Map<String,int> → formula', () {
      final mappers = newTypeMap<MapperEvent>({
        r'^(Map)\??$': (e) {
          final c = e as CollectionMapperEvent;
          return 'MAP(${c.hashes})';
        },
        r'^(String)\??$': (e) => 'STR(${e.name})',
        r'^(int)\??$': (e) => 'INT(${e.name})',
      });
      final typeData = decomposeDartCollectionType('Map<String,int>');
      final r = buildCollectionMapper(typeData, mappers);
      expect(r, 'MAP(STR(p0), INT(p1))');
    });
  });
}
