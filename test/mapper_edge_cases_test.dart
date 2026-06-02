// Edge-case coverage for the mapper composition. The main
// dart_core_type_mappers_test.dart locks in the happy path for each
// dialect family; this file probes the seams between them.

import 'package:df_generate_dart_models/df_generate_dart_models.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';
import 'package:test/test.dart';

void main() {
  final mappers = DartCompositeTypeMappers([
    DartStrictTypeMappers.instance,
    DartPostgresTypeMappers.instance,
    DartSqliteTypeMappers.instance,
    DartFirestoreTypeMappers.instance,
    DartCoreTypeMappers.instance,
  ]);

  String mapFrom(String type, {String name = 'v'}) =>
      DartTypeCodeMapper(mappers.fromMappers).map(
        fieldName: name,
        fieldTypeCode: type,
      );

  String mapTo(String type, {String name = 'v'}) =>
      DartTypeCodeMapper(mappers.toMappers).map(
        fieldName: name,
        fieldTypeCode: type,
      );

  group('Nullable trailing-? handling', () {
    test('bare String? matches the same mapper as String', () {
      expect(mapFrom('String?'), 'v?.toString().trim().nullIfEmpty');
    });

    test('bare int? matches the int mapper', () {
      expect(mapFrom('int?'), 'letIntOrNull(v)');
    });

    test('PG_uuid-String? matches just like the un-? form', () {
      expect(mapFrom('PG_uuid-String?'), 'v?.toString().trim().nullIfEmpty');
    });

    test('STRICT-String? matches STRICT-String', () {
      expect(mapFrom('STRICT-String?'), 'v as String?');
    });
  });

  group('PG_ parameterised types', () {
    test('PG_varchar(N)-String tolerates the size parameter', () {
      expect(
        mapFrom('PG_varchar(255)-String'),
        'v?.toString().trim().nullIfEmpty',
      );
    });

    test('PG_numeric(p,s)-String tolerates comma-separated parameters', () {
      expect(
        mapFrom('PG_numeric(10,2)-String'),
        'v?.toString().trim().nullIfEmpty',
      );
    });

    test('PG_numeric(p,s)-double routes to letDoubleOrNull', () {
      expect(mapFrom('PG_numeric(10,2)-double'), 'letDoubleOrNull(v)');
    });

    test('PG_timestamp(p)-DateTime tolerates precision parameter', () {
      final r = mapFrom('PG_timestamp(3)-DateTime');
      expect(r, contains('DateTime.tryParse'));
      expect(r, contains('toUtc()'));
    });
  });

  group('PG_ array variants', () {
    test('PG_text[]-List<String> uses letListOrNull on read', () {
      final r = mapFrom('PG_text[]-List<String>');
      expect(r, contains('letListOrNull<dynamic>(v)'));
    });

    test('PG_varchar(255)[]-List<String> combines parens + brackets', () {
      final r = mapFrom('PG_varchar(255)[]-List<String>');
      expect(r, contains('letListOrNull<dynamic>(v)'));
    });

    test('PG_text[]-List to-side binds native Dart List', () {
      final r = mapTo('PG_text[]-List<String>');
      expect(r, contains('.map('));
      expect(r, contains('.toList()'));
    });
  });

  group('PG_jsonb / json nested model edge cases', () {
    test('PG_jsonb-ModelXxx with hyphen variant matches the model mapper', () {
      final r = mapFrom('PG_jsonb-ModelBulletinPage');
      expect(r, contains('letMapOrNull<String, dynamic>(v)'));
      expect(r, contains('ModelBulletinPage.fromJson(a)'));
    });

    test('PG_jsonb-X-Model (suffix variant) also matches', () {
      // The mapper regex accepts `Model-?\w+|\w+-?Model` — so the suffix
      // form like `OrderModel` works the same as the prefix form.
      final r = mapFrom('PG_jsonb-OrderModel');
      expect(r, contains('letMapOrNull<String, dynamic>(v)'));
      expect(r, contains('OrderModel.fromJson(a)'));
    });
  });

  group('STRICT- coverage for less-common types', () {
    test('STRICT-num casts directly', () {
      expect(mapFrom('STRICT-num'), 'v as num?');
    });

    test('STRICT-BigInt parses via BigInt.parse', () {
      final r = mapFrom('STRICT-BigInt');
      expect(r, contains('BigInt.parse(v as String)'));
      expect(r, contains('v == null'));
    });

    test('STRICT-Uint8List base64-decodes', () {
      final r = mapFrom('STRICT-Uint8List');
      expect(r, contains('base64Decode(v as String)'));
    });

    test('STRICT-Uri parses via Uri.parse', () {
      final r = mapFrom('STRICT-Uri');
      expect(r, contains('Uri.parse(v as String)'));
    });

    test('STRICT-Type-? matches the enum-flavoured mapper', () {
      expect(
        mapFrom('STRICT-AuthProviderType'),
        'AuthProviderType.values.valueOf(v as String?)',
      );
    });
  });

  group('SQLITE_ DateTime variants', () {
    test('SQLITE_epochs-DateTime decodes epoch seconds × 1000', () {
      final r = mapFrom('SQLITE_epochs-DateTime');
      expect(r, contains('a * 1000'));
      expect(r, contains('isUtc: true'));
    });

    test('SQLITE_epochs-DateTime to-side divides ms by 1000', () {
      expect(
        mapTo('SQLITE_epochs-DateTime'),
        'v != null ? v!.toUtc().millisecondsSinceEpoch ~/ 1000 : null',
      );
    });

    test('SQLITE_julianday-DateTime converts via Julian-day formula', () {
      final r = mapFrom('SQLITE_julianday-DateTime');
      expect(r, contains('2440587.5'));
      expect(r, contains('86400000'));
    });
  });

  group('Firestore back-compat and FS_ variants', () {
    test('bare Timestamp preserves the legacy passthrough', () {
      expect(mapFrom('Timestamp'), 'letAsOrNull<Timestamp>(v)');
      expect(mapTo('Timestamp'), 'v');
    });

    test('FS_server_timestamp ignores the field value at write time', () {
      // Server stamp wins — the local DateTime is discarded.
      expect(
        mapTo('FS_server_timestamp-DateTime'),
        'FieldValue.serverTimestamp()',
      );
    });

    test(
        'FS_ref-String falls through to a String coercion when no '
        'DocumentReference is provided', () {
      final r = mapFrom('FS_ref-String');
      expect(r, contains('letAsOrNull<DocumentReference>'));
      expect(r, contains('v?.toString().trim().nullIfEmpty'));
    });
  });

  group('Default catchall handles unknown class names', () {
    test('unknown bare class falls through to identity', () {
      // `MyWidget` doesn't match any specific regex; the catchall
      // `^(\w+)\??$` returns the field name verbatim.
      expect(mapFrom('MyWidget'), 'v');
    });

    test('unknown PG_ prefix throws — no silent fallback', () {
      // Behaviour we lock in: hyphenated prefixes that no dialect claims
      // (e.g. `PG_geometry-String` where we never added a `geometry` entry)
      // trip an assertion at mapper-build time. The signal is loud rather
      // than silent. Users who want the bare-type behaviour either add the
      // PG_ entry explicitly or write `String` instead.
      expect(
        () => mapFrom('PG_geometry-String'),
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group('Generic type expansion edge cases', () {
    test('Map<String, int> still routes through the Map mapper', () {
      final r = mapFrom('Map<String, int>', name: 'm');
      expect(r, contains('letMapOrNull<dynamic, dynamic>(m)'));
      expect(r, contains('letIntOrNull'));
    });

    test('Set<String> routes through the Set mapper', () {
      final r = mapFrom('Set<String>', name: 's');
      expect(r, contains('letSetOrNull<dynamic>(s)'));
    });

    test('Queue<int> routes through the Queue mapper', () {
      final r = mapFrom('Queue<int>', name: 'q');
      expect(r, contains('Queue.of(a)'));
    });
  });
}
