// Regression test for the fix where `fallback` member-annotation values were
// silently dropped if they weren't a List. The fix uses `dartObjToObject`
// (which handles every constant kind) instead of `.toListValue()`.
//
// We don't spin up the analyzer; instead we exercise the contract by calling
// dartObjToObject directly with stubs that mimic what the analyzer would
// hand back for various `fallback:` literals.

import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';
import 'package:test/test.dart';

class _DartObj {
  final String? _s;
  final int? _i;
  final bool? _b;
  final List<_DartObj>? _l;

  const _DartObj.s(String s)
      : _s = s,
        _i = null,
        _b = null,
        _l = null;
  const _DartObj.i(int i)
      : _s = null,
        _i = i,
        _b = null,
        _l = null;
  const _DartObj.b(bool b)
      : _s = null,
        _i = null,
        _b = b,
        _l = null;
  const _DartObj.l(List<_DartObj> l)
      : _s = null,
        _i = null,
        _b = null,
        _l = l;

  String? toStringValue() => _s;
  int? toIntValue() => _i;
  bool? toBoolValue() => _b;
  double? toDoubleValue() => null;
  List<_DartObj>? toListValue() => _l;
  Set<_DartObj>? toSetValue() => null;
  Map<_DartObj, _DartObj>? toMapValue() => null;
}

void main() {
  group(
      'fallback extraction via dartObjToObject (regression for the dropped-fallback bug)',
      () {
    test('string fallback survives (was previously dropped)', () {
      expect(dartObjToObject(const _DartObj.s('default')), 'default');
    });

    test('int fallback survives (was previously dropped)', () {
      expect(dartObjToObject(const _DartObj.i(0)), 0);
    });

    test('bool fallback survives (was previously dropped)', () {
      expect(dartObjToObject(const _DartObj.b(false)), isFalse);
    });

    test('list fallback continues to work (always did) and is a real List', () {
      // After the dart_obj_to_object fix this should be a real List, not a
      // lazy Iterable. Earlier downstream callers cast to `List` and would
      // have thrown.
      final r = dartObjToObject(
        const _DartObj.l([_DartObj.s('a'), _DartObj.s('b')]),
      );
      expect(r, isA<List<dynamic>>());
      expect(r, ['a', 'b']);
    });
  });
}
