// Tests that the canonical mapping table produces the expected formulas for
// common Dart types. The mappers don't execute the generated code — they
// return a code String — so these tests check the literal strings that
// would be written into a `*.g.dart` file.

import 'package:df_generate_dart_models/df_generate_dart_models.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';
import 'package:test/test.dart';

void main() {
  // Compose the same mapper set the generator wires up at runtime so the
  // tests reflect the production behaviour (core + Firestore for the
  // Timestamp regex). Adding future dialects here mirrors the production
  // change in `generate_dart_models.dart`.
  final mappers = DartCompositeTypeMappers([
    DartStrictTypeMappers.instance,
    DartFirestoreTypeMappers.instance,
    DartCoreTypeMappers.instance,
  ]);

  String mapFrom(String type, {String name = 'x'}) =>
      DartTypeCodeMapper(mappers.fromMappers).map(
        fieldName: name,
        fieldTypeCode: type,
      );

  String mapTo(String type, {String name = 'x'}) =>
      DartTypeCodeMapper(mappers.toMappers).map(
        fieldName: name,
        fieldTypeCode: type,
      );

  group('objectFromMappers (canonical conversions for fromJson)', () {
    test('String trims and nullIfEmpty', () {
      expect(mapFrom('String'), 'x?.toString().trim().nullIfEmpty');
    });

    test('bool uses letBoolOrNull (coercive, handles SQLite int 0/1)', () {
      expect(mapFrom('bool'), 'letBoolOrNull(x)');
    });

    test('int uses letIntOrNull (coercive, handles String-encoded ints)', () {
      expect(mapFrom('int'), 'letIntOrNull(x)');
    });

    test('double uses letDoubleOrNull (coercive)', () {
      expect(mapFrom('double'), 'letDoubleOrNull(x)');
    });

    test('num uses letNumOrNull (coercive)', () {
      expect(mapFrom('num'), 'letNumOrNull(x)');
    });

    test('dynamic returns the value as-is', () {
      expect(mapFrom('dynamic'), 'x');
    });

    test('DataRefModel uses dataRefFromString', () {
      expect(mapFrom('DataRefModel'), 'dataRefFromString(x?.toString())');
    });

    test('DateTime coerces to String first (regression for TypeError-on-int)',
        () {
      // The generated code must call `.toString().trim().nullIfEmpty` before
      // DateTime.tryParse — without that, a numeric JSON value (e.g. epoch
      // millis) would throw a TypeError at runtime because tryParse only
      // accepts String.
      final r = mapFrom('DateTime');
      expect(r, contains('toString().trim().nullIfEmpty'));
      expect(r, contains('DateTime.tryParse(a)'));
    });
  });

  group('objectToMappers (canonical conversions for toJson)', () {
    test('String trims and nullIfEmpty', () {
      expect(mapTo('String'), 'x?.trim().nullIfEmpty');
    });

    test('bool returns the value as-is', () {
      expect(mapTo('bool'), 'x');
    });

    test('DateTime emits UTC ISO 8601', () {
      expect(mapTo('DateTime'), 'x?.toUtc().toIso8601String()');
    });

    test('Duration uses inMicroseconds (round-trips with from-mapper)', () {
      // Regression: previously emitted x?.toString() which paired with a
      // nonexistent tryParseDuration extension on the from-side.
      expect(mapTo('Duration'), 'x?.inMicroseconds');
    });

    test('DataRefModel uses path', () {
      expect(mapTo('DataRefModel'), 'x?.path');
    });

    test('Color uses toARGB32 (not deprecated .value)', () {
      // Regression for Color.value deprecation in modern Flutter.
      expect(mapTo('Color'), 'x?.toARGB32()');
    });

    test('typed-string TrimmedLowerCase-String does not call toString()', () {
      // Receiver on the to-side is already a String. Calling toString() is
      // redundant work.
      final r = mapTo('TrimmedLowerCase-String', name: 'tag');
      expect(r, isNot(contains('toString()')));
      expect(r, 'tag?.trim().nullIfEmpty?.toLowerCase()');
    });
  });

  group('collection mappers', () {
    test('List<String> builds a list mapper from String mapper', () {
      final r = mapFrom('List<String>', name: 'names');
      expect(r, contains('letListOrNull<dynamic>(names)'));
      expect(r, contains('toString().trim().nullIfEmpty'));
    });

    test('Map<String,int> builds a map mapper from String/int mappers', () {
      final r = mapFrom('Map<String,int>', name: 'm');
      expect(r, contains('letMapOrNull<dynamic, dynamic>(m)'));
      expect(r, contains('letIntOrNull'));
    });
  });

  group('special string-case types', () {
    test('TrimmedLowerCase-String calls toLowerCase()', () {
      final r = mapFrom('TrimmedLowerCase-String', name: 'tag');
      expect(r, contains('toLowerCase()'));
    });

    test('CamelCase-String calls toCamelCase()', () {
      final r = mapFrom('CamelCase-String', name: 't');
      expect(r, contains('toCamelCase()'));
    });
  });

  group('STRICT- mappers (json_serializable-style direct casts)', () {
    test('STRICT-String emits direct as cast', () {
      expect(mapFrom('STRICT-String', name: 'v'), 'v as String?');
    });

    test('STRICT-int routes through num (JSON num→int conversion)', () {
      expect(mapFrom('STRICT-int', name: 'v'), '(v as num?)?.toInt()');
    });

    test('STRICT-double routes through num', () {
      expect(mapFrom('STRICT-double', name: 'v'), '(v as num?)?.toDouble()');
    });

    test('STRICT-bool casts directly (no SQLite 0/1 coercion)', () {
      expect(mapFrom('STRICT-bool', name: 'v'), 'v as bool?');
    });

    test('STRICT-DateTime parses without defensive toString chain', () {
      final r = mapFrom('STRICT-DateTime', name: 'v');
      expect(r, contains('DateTime.parse(v as String)'));
      expect(r, contains('v == null'));
    });

    test('STRICT-Model* delegates to nested fromJson with a Map cast', () {
      final r = mapFrom('STRICT-ModelUser', name: 'v');
      expect(r, contains('ModelUser.fromJson'));
      expect(r, contains('v as Map<String, dynamic>'));
    });

    test('STRICT to-side passes primitives through', () {
      expect(mapTo('STRICT-String', name: 'v'), 'v');
      expect(mapTo('STRICT-bool', name: 'v'), 'v');
      expect(mapTo('STRICT-int', name: 'v'), 'v');
    });

    test('STRICT to-side keeps DateTime in UTC ISO 8601', () {
      expect(
        mapTo('STRICT-DateTime', name: 'v'),
        'v?.toUtc().toIso8601String()',
      );
    });

    test('STRICT to-side calls toJson on nested models', () {
      expect(mapTo('STRICT-ModelUser', name: 'v'), 'v?.toJson()');
    });
  });

  group('default catchall', () {
    test('unknown plain word falls through to the catchall', () {
      // `^(\w+)\??$` matches any single word. `Widget` matches no specific
      // mapper so the catchall fires and returns the value as-is.
      expect(mapFrom('Widget', name: 'v'), 'v');
    });

    test(
        'bare "Type" no longer hits the Type-pattern (would emit invalid code)',
        () {
      // Tightened from \w* to \w+ on each side so the pattern requires at
      // least one prefix or suffix character. The Dart core `Type` would
      // otherwise emit `Type.values.valueOf(...)`, which does not compile.
      expect(mapFrom('Type', name: 'v'), 'v');
    });

    test('bare "Model" no longer hits the Model-pattern', () {
      expect(mapFrom('Model', name: 'v'), 'v');
    });

    test('bare "Enum" no longer hits the Enum-pattern', () {
      expect(mapFrom('Enum', name: 'v'), 'v');
    });

    test('PaymentModel still hits the Model-pattern', () {
      final r = mapFrom('PaymentModel', name: 'p');
      expect(r, contains('PaymentModel.fromJson'));
    });
  });

  group('Duration round-trip (fix for missing tryParseDuration)', () {
    test('from-mapper uses Duration(microseconds:)', () {
      final r = mapFrom('Duration', name: 'd');
      expect(r, contains('letAsOrNull<int>(d)'));
      expect(r, contains('Duration(microseconds: a)'));
    });

    test('to-mapper uses inMicroseconds', () {
      expect(mapTo('Duration'), 'x?.inMicroseconds');
    });

    test('no longer references undefined tryParseDuration', () {
      expect(mapFrom('Duration'), isNot(contains('tryParseDuration')));
      expect(mapTo('Duration'), isNot(contains('tryParseDuration')));
    });
  });

  group('Tier 1 new types', () {
    test('Queue from-mapper exists (was previously missing — asymmetry fix)',
        () {
      final r = mapFrom('Queue<int>', name: 'q');
      expect(r, contains('letIterableOrNull<dynamic>(q)'));
      expect(r, contains('Queue.of(a)'));
    });

    test('Queue to-mapper still produces a List for JSON output', () {
      final r = mapTo('Queue<int>', name: 'q');
      expect(r, contains('q?.map'));
      expect(r, contains('.toList()'));
    });

    test('BigInt round-trips via decimal string', () {
      expect(mapFrom('BigInt'), contains('BigInt.tryParse(a)'));
      expect(mapTo('BigInt'), 'x?.toString()');
    });

    test('Uint8List round-trips via base64', () {
      final from = mapFrom('Uint8List');
      expect(from, contains('base64Decode(a)'));
      expect(mapTo('Uint8List'), 'x != null ? base64Encode(x!) : null');
    });

    test('RegExp round-trips via .pattern', () {
      expect(mapFrom('RegExp'), contains('RegExp(a)'));
      expect(mapTo('RegExp'), 'x?.pattern');
    });
  });

  group('Tier 2 Flutter geometry types', () {
    test('Offset uses dx/dy map', () {
      expect(
          mapFrom('Offset'), contains("Offset(letAsOrNull<double>(a['dx'])"),);
      expect(mapTo('Offset'), "x != null ? {'dx': x!.dx, 'dy': x!.dy} : null");
    });

    test('Size uses width/height map', () {
      expect(mapFrom('Size'), contains("Size(letAsOrNull<double>(a['width'])"));
      expect(
        mapTo('Size'),
        "x != null ? {'width': x!.width, 'height': x!.height} : null",
      );
    });

    test('Rect uses LTRB map', () {
      expect(mapFrom('Rect'), contains('Rect.fromLTRB('));
      expect(
        mapTo('Rect'),
        "x != null ? {'left': x!.left, 'top': x!.top, 'right': x!.right, 'bottom': x!.bottom} : null",
      );
    });

    test('EdgeInsets uses LTRB map', () {
      expect(mapFrom('EdgeInsets'), contains('EdgeInsets.fromLTRB('));
      expect(
        mapTo('EdgeInsets'),
        "x != null ? {'left': x!.left, 'top': x!.top, 'right': x!.right, 'bottom': x!.bottom} : null",
      );
    });

    test('Alignment uses x/y map', () {
      expect(mapFrom('Alignment'), contains('Alignment('));
      expect(mapTo('Alignment'), "x != null ? {'x': x!.x, 'y': x!.y} : null");
    });

    test('Radius uses x/y map via Radius.elliptical', () {
      expect(mapFrom('Radius'), contains('Radius.elliptical('));
      expect(mapTo('Radius'), "x != null ? {'x': x!.x, 'y': x!.y} : null");
    });
  });

  group('cleanup regressions', () {
    test(
        'Searchable-String trailing nullIfEmpty (empty after regex strip → null)',
        () {
      // Without the trailing nullIfEmpty, input like "!!!" would survive
      // trim()/nullIfEmpty (non-empty), get its non-word chars stripped, and
      // end up as the empty string instead of null.
      final r = mapFrom('Searchable-String', name: 's');
      // The final method call must be nullIfEmpty.
      expect(r.endsWith('.nullIfEmpty'), isTrue);
    });

    test(
        'Timestamp from-mapper now uses letAsOrNull (consistent with bool/int)',
        () {
      expect(mapFrom('Timestamp', name: 'ts'), 'letAsOrNull<Timestamp>(ts)');
    });

    test('Color from-mapper uses a != null (not redundant a is int)', () {
      final r = mapFrom('Color');
      expect(r, contains('a != null'));
      expect(r, isNot(contains('a is int')));
    });
  });
}
