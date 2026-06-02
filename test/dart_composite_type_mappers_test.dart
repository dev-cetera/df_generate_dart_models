// Unit tests for DartCompositeTypeMappers. The composite merges multiple
// TypeMappers delegates so the generator can see one merged regex table
// per direction. The contract we lock in here:
//
// 1. Delegates earlier in the list win on duplicate regex keys.
// 2. fromMappers / toMappers unions the collection + object tables of
//    every delegate.
// 3. Composing zero delegates is harmless — the resulting tables are
//    empty, lookups fall through.
// 4. The order of delegates determines which dialect's regex matches a
//    given type code first, which is the lever the generator uses to put
//    specific-vocabulary dialects ahead of Core's catchall.

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_generate_dart_models/df_generate_dart_models.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';
import 'package:test/test.dart';

/// A throwaway mapper used to verify delegate ordering and conflict
/// resolution. Returns sentinel strings the test can match on so we can
/// tell which delegate "won" each lookup.
class _Sentinel extends TypeMappers {
  _Sentinel(this.tag, this.extras);

  /// Tag baked into every emitted string so the test can identify which
  /// instance produced the formula.
  final String tag;

  /// Additional regex entries (object-side, from-direction) layered on top
  /// of a single shared `String` entry. Lets each instance contribute its
  /// own vocabulary without forcing custom subclasses per test.
  final Map<String, String Function(MapperEvent)> extras;

  @override
  TTypeMappers<CollectionMapperEvent> get collectionFromMappers =>
      newTypeMap({});

  @override
  TTypeMappers<CollectionMapperEvent> get collectionToMappers => newTypeMap({});

  @override
  TTypeMappers<MapperEvent> get objectFromMappers => newTypeMap({
        // A "shared" regex every Sentinel registers — used to verify the
        // first delegate in the list wins on duplicate keys.
        r'^(String)\??$': (e) => "'$tag-from-${e.name}'",
        ...extras,
      });

  @override
  TTypeMappers<MapperEvent> get objectToMappers => newTypeMap({
        r'^(String)\??$': (e) => "'$tag-to-${e.name}'",
      });
}

String _mapFrom(TypeMappers m, String type, {String name = 'x'}) =>
    DartTypeCodeMapper(m.fromMappers).map(
      fieldName: name,
      fieldTypeCode: type,
    );

String _mapTo(TypeMappers m, String type, {String name = 'x'}) =>
    DartTypeCodeMapper(m.toMappers).map(
      fieldName: name,
      fieldTypeCode: type,
    );

void main() {
  group('DartCompositeTypeMappers — delegate ordering', () {
    test('first delegate wins on duplicate regex keys (object from)', () {
      final composite = DartCompositeTypeMappers([
        _Sentinel('A', const {}),
        _Sentinel('B', const {}),
      ]);
      // Both A and B register `^(String)\??$`. A is first → A wins.
      expect(_mapFrom(composite, 'String', name: 'v'), "'A-from-v'");
    });

    test('first delegate wins on duplicate regex keys (object to)', () {
      final composite = DartCompositeTypeMappers([
        _Sentinel('A', const {}),
        _Sentinel('B', const {}),
      ]);
      expect(_mapTo(composite, 'String', name: 'v'), "'A-to-v'");
    });

    test('reversing the delegate order flips the winner', () {
      final composite = DartCompositeTypeMappers([
        _Sentinel('B', const {}),
        _Sentinel('A', const {}),
      ]);
      expect(_mapFrom(composite, 'String', name: 'v'), "'B-from-v'");
    });

    test('non-conflicting delegates expose union of their vocabularies', () {
      final composite = DartCompositeTypeMappers([
        _Sentinel('A', {
          r'^(PG_text)\??$': (e) => "'A-pg-text-${e.name}'",
        }),
        _Sentinel('B', {
          r'^(SQLITE_text)\??$': (e) => "'B-sqlite-text-${e.name}'",
        }),
      ]);
      expect(_mapFrom(composite, 'PG_text', name: 'v'), "'A-pg-text-v'");
      expect(
        _mapFrom(composite, 'SQLITE_text', name: 'v'),
        "'B-sqlite-text-v'",
      );
    });
  });

  group('DartCompositeTypeMappers — empty / degenerate cases', () {
    test('zero delegates yields empty tables (no match)', () {
      // The mapper itself returns the field name verbatim when no regex
      // matches. That's the contract `DartTypeCodeMapper.mapObject` keeps
      // via its #x0 sentinel collapsed by `map(...)`.
      final composite = DartCompositeTypeMappers(const []);
      expect(composite.fromMappers, isEmpty);
      expect(composite.toMappers, isEmpty);
    });

    test('single delegate behaves the same as that delegate alone', () {
      final single = DartCoreTypeMappers.instance;
      final composite = DartCompositeTypeMappers([single]);
      final viaSingle = _mapFrom(single, 'String', name: 'v');
      final viaComposite = _mapFrom(composite, 'String', name: 'v');
      expect(viaComposite, viaSingle);
    });
  });

  group('DartCompositeTypeMappers — production composition', () {
    // The composition the generator actually uses at runtime; verifying it
    // here locks in the behaviour the integration tests rely on.
    final production = DartCompositeTypeMappers([
      DartStrictTypeMappers.instance,
      DartPostgresTypeMappers.instance,
      DartSqliteTypeMappers.instance,
      DartFirestoreTypeMappers.instance,
      DartCoreTypeMappers.instance,
    ]);

    test('STRICT- before PG_ before SQLITE_ before FS_ before bare', () {
      // STRICT-String should win over the bare String mapper.
      expect(
        _mapFrom(production, 'STRICT-String', name: 'v'),
        'v as String?',
      );
      // PG_text-String resolves to Core's String coercion.
      expect(
        _mapFrom(production, 'PG_text-String', name: 'v'),
        'v?.toString().trim().nullIfEmpty',
      );
      // Bare String still routes to Core.
      expect(
        _mapFrom(production, 'String', name: 'v'),
        'v?.toString().trim().nullIfEmpty',
      );
    });

    test('Timestamp resolves through Firestore not Core', () {
      expect(
        _mapFrom(production, 'Timestamp', name: 'v'),
        'letAsOrNull<Timestamp>(v)',
      );
    });

    test('PG_jsonb-Map wins over the bare Map mapper', () {
      // Core's Map mapper would emit `letMapOrNull<...>(v)?.map(...)` with
      // a wrap-in-unmodifiable. PG_jsonb-Map on the to-side emits a
      // jsonEncode call.
      final r = _mapTo(
        production,
        'PG_jsonb-Map<String, dynamic>',
        name: 'extra',
      );
      expect(r, contains('jsonEncode'));
    });
  });

  group('DartCompositeTypeMappers — union completeness', () {
    test('fromMappers contains the union of collection + object regex keys',
        () {
      final composite = DartCompositeTypeMappers([
        DartCoreTypeMappers.instance,
      ]);
      // Spot-check: Core has both `^(Map)\??$` (collection) and `^(String)\??$`
      // (object). fromMappers should expose both.
      expect(composite.fromMappers.keys, contains(r'^(Map)\??$'));
      expect(composite.fromMappers.keys, contains(r'^(String)\??$'));
    });

    test('toMappers contains the union of collection + object regex keys', () {
      final composite = DartCompositeTypeMappers([
        DartCoreTypeMappers.instance,
      ]);
      expect(composite.toMappers.keys, contains(r'^(Map)\??$'));
      expect(composite.toMappers.keys, contains(r'^(String)\??$'));
    });
  });
}
