//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
//
// The use of this source code is governed by an MIT-style license described in
// the LICENSE file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_gen_core/df_gen_core.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Merges multiple [TypeMappers] instances into a single one whose tables are
/// the union of the delegates'. Earlier delegates take precedence on regex
/// conflicts because mapper lookup is first-match-wins and `addAll` keeps the
/// first inserted entry per key when merging into the buffer in order.
///
/// The runtime intent: combine the dialect-agnostic [DartCoreTypeMappers] with
/// any opt-in dialect tables (Firestore today; Postgres, SQLite, STRICT_ later)
/// so the generator sees one merged mapper table per direction without each
/// caller having to manage the union.
class DartCompositeTypeMappers extends TypeMappers {
  //
  //
  //

  DartCompositeTypeMappers(this.delegates);

  //
  //
  //

  final List<TypeMappers> delegates;

  //
  //
  //

  TTypeMappers<CollectionMapperEvent> _mergeCollection(
    TTypeMappers<CollectionMapperEvent> Function(TypeMappers) select,
  ) {
    final buffer = <String, String Function(CollectionMapperEvent)>{};
    for (final d in delegates) {
      for (final entry in select(d).entries) {
        buffer.putIfAbsent(entry.key, () => entry.value);
      }
    }
    return TTypeMappers<CollectionMapperEvent>.unmodifiable(buffer);
  }

  TTypeMappers<ObjectMapperEvent> _mergeObject(
    TTypeMappers<ObjectMapperEvent> Function(TypeMappers) select,
  ) {
    final buffer = <String, String Function(ObjectMapperEvent)>{};
    for (final d in delegates) {
      for (final entry in select(d).entries) {
        buffer.putIfAbsent(entry.key, () => entry.value);
      }
    }
    return TTypeMappers<ObjectMapperEvent>.unmodifiable(buffer);
  }

  //
  //
  //

  @override
  TTypeMappers<CollectionMapperEvent> get collectionFromMappers =>
      _mergeCollection((d) => d.collectionFromMappers);

  @override
  TTypeMappers<CollectionMapperEvent> get collectionToMappers =>
      _mergeCollection((d) => d.collectionToMappers);

  @override
  TTypeMappers<ObjectMapperEvent> get objectFromMappers =>
      _mergeObject((d) => d.objectFromMappers);

  @override
  TTypeMappers<ObjectMapperEvent> get objectToMappers =>
      _mergeObject((d) => d.objectToMappers);
}
