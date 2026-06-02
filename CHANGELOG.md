# Changelog

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
