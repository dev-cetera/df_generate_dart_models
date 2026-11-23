// An empty value is a value: "", [], {} and an empty set survive fromJson and
// toJson as themselves, and only null (or a missing key) means absent.
//
// Until 0.21.0 every empty string and collection became null in both
// directions, so a required field answered with [] threw in its `$` getter and
// "nothing" and "missing" looked the same on the wire.

import 'package:test/test.dart';

import 'integration/models_envelope/model_envelope.dart';

void main() {
  group('fromJson keeps empty values', () {
    final child = ModelEnvelopeChild.fromJson({'id': '', 'label': ''});
    final envelope = ModelEnvelope.fromJson({
      'children': <dynamic>[],
      'unique_children': <dynamic>[],
      'tags': <dynamic>[],
      'children_by_id': <String, dynamic>{},
    });

    test('an empty required string stays empty, and its getter works', () {
      expect(child.id, '');
      expect(child.id$, '');
    });

    test('an empty optional string stays empty, not null', () {
      expect(child.label, '');
    });

    test('empty lists, sets and maps stay empty, not null', () {
      expect(envelope.children, isEmpty);
      expect(envelope.uniqueChildren, isEmpty);
      expect(envelope.tags, isEmpty);
      expect(envelope.childrenById, isEmpty);
    });
  });

  group('fromJson still reads a missing key or null as absent', () {
    final child = ModelEnvelopeChild.fromJson({'id': 'a'});
    final envelope = ModelEnvelope.fromJson({'tags': null});

    test('missing and null collections are null', () {
      expect(envelope.tags, isNull);
      expect(envelope.children, isNull);
      expect(envelope.childrenById, isNull);
    });

    test('a missing string is null', () {
      expect(child.label, isNull);
    });
  });

  test('toJson writes empty values instead of dropping their keys', () {
    final childJson =
        ModelEnvelopeChild.fromJson({'id': '', 'label': ''}).toJson();
    final envelopeJson = ModelEnvelope.fromJson({
      'tags': <dynamic>[],
      'children_by_id': <String, dynamic>{},
    }).toJson();

    expect(childJson['id'], '');
    expect(childJson['label'], '');
    expect(envelopeJson['tags'], isEmpty);
    expect(envelopeJson['children_by_id'], isEmpty);
    expect(
      envelopeJson.containsKey('children'),
      isFalse,
      reason: 'null still drops its key',
    );
  });
}
