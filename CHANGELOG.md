# Changelog

## [0.17.1]

- fix: exclude generated .g.dart from analysis in example too


## [0.17.0]

- Released @ 7/2026 (UTC)
- New: `df_generate_dart_models_from_dbml` command (alias `--models-from-dbml`) — the inverse of `df_generate_dbml`. Reads a DBML schema (Tables, `enum` blocks, inline/standalone `Ref:`s, notes) and emits one annotated `@GenerateDartModel` abstract class per table, then runs the forward `df_generate_dart_models` codegen automatically (pass `--no-codegen` to stop after the annotation files)
- New: `--dialect` (postgres | sqlite | generic) controls the emitted `fieldType` vocabulary; foreign keys become `references:`/`foreignKey:`, DBML enums round-trip into Dart enums, and a shared `dbml_enums.dart` sidecar is written when any enum is present
- New: out-of-tree runs bootstrap a minimal pub workspace (with a local `df_generate_dart_models_core` override when a sibling checkout is found) so the forward codegen can resolve

## [0.16.2]

- Released @ 6/2026 (UTC)
- Fix: `df_generate_dbml` was built into `bin/` but missing from the `executables:` block, so `dart pub global activate` did not install it as a CLI. Adding it (plus a `--dbml` alias) makes `df_generate_dbml` available globally

## [0.16.1]

- Released @ 6/2026 (UTC)
- New: `tableName:` annotation slot — explicit override for the DBML table name; falls back to stripping the `Model` marker (prefix *or* suffix) from the class and snake-casing. No automatic English pluralisation. `ModelUser` → `user`, `HelloModel` → `hello`, `ModelModel` → `model`
- New: `schema:` annotation slot acts as the DBML emission gate. Models without `schema:` are skipped (nested/embedded children drop out naturally). Distinct schema values produce one `<schema>.dbml` file each — multi-schema projects supported out of the box
- New: `static const tableName` emitted on every generated class — runtime introspection without the annotation handshake (`ModelUser.tableName`)
- New: `XxxFieldNames.$values` / `$primaryKey` / `$foreignKeys` — surface declaration-order field names, the primary key, and the foreign-key → referenced-class map without reflection
- New: `references:` accepts a `String` literal (`references: 'ModelUser'`) in addition to a Type literal — lets cross-package references skip the import chain
- New: FK target column now resolves to the parent's actual primary-key column (e.g. `permissions.key`) instead of hardcoded `.id`; FK target table honours the parent's explicit `tableName:`
- New: DBML emitter's `--output` is now treated as the directory for per-schema files (a `*.dbml` value uses its parent dir — old ergonomics still work)
- Fix: default template URL is now version-pinned (`v$version`) — old binaries no longer pull `main` template changes silently. Falls back to `main` only for dev checkouts
- Fix: no-pluralisation rule replaces the previous naive English heuristic that produced `activitys` / `contact_address` / etc.
- Pulls in df_generate_dart_models_core 0.11.0

## [0.15.0]

- Released @ 6/2026 (UTC)
- New: `fieldPath` dual-shape — dot-separated `String` or `Iterable<String>`; multi-segment paths emit deep null-aware accessors (`json?['profile']?['id']`)
- New: enum detection without `Type`/`Enum` suffix — analyzer-driven via `@enum` sentinel; legacy suffix-based detection still works
- New: Equatable opt-in by inheritance — `extends BaseModel` opts out (const-set-safe), everything else gets `EquatableMixin`
- New: dialect support — `PG_*`, `SQLITE_*`, `FS_*`, `STRICT-` prefix vocabulary with composable mappers
- New: DBML schema export via `df_generate_dbml` CLI — PKs, FKs, sized varchar/numeric, enums, JSONB columns
- Fix: `fromOrNull` / `fromJsonStringOrNull` / `fromUriOrNull` templates honor the null-return contract (no more silent throws on the null/empty/wrong-path input)
- Fix: AI prompt no longer collapses field path segments via `join('')` — uses `.` separator
- Fix: AI generator uses safe `FieldUtils` accessors instead of dynamic property access
- Fix: top-level catch logs the actual exception, not just a generic message
- Removed: obsolete `df_generate_dart_models_gemeni` executable
- Pulls in df_gen_core 0.8.0 and df_generate_dart_models_core 0.10.0

## [0.14.3]

- Released @ 12/2025 (UTC)
- Update dependencies
