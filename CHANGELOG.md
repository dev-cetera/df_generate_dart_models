# Changelog

## [0.15.0]

- Released @ 5/2026 (UTC)
- Fix: AI prompt no longer collapses field path segments via `join('')` — uses `.` separator so the AI receives the structured field name (e.g. `user.name` instead of `username`)
- Fix: AI generator now extracts field properties via the safe `FieldUtils` accessors instead of dynamic property access
- Fix: `___FROM_JSON_OR_NULL_PARAMS___` template no longer crashes on fields with null `fieldPath` or null `fieldName`; comparator tolerates nulls
- Fix: AI generator's top-level error path now logs the actual exception, not just a generic message
- Fix: removed obsolete `df_generate_dart_models_gemeni` executable entry that referenced a non-existent script (superseded by `df_generate_dart_models_ai`)
- Pulls in df_gen_core 0.8.0 with mapper robustness fixes

## [0.14.3]

- Released @ 12/2025 (UTC)
- Update dependencies
