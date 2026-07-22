[![pub](https://img.shields.io/pub/v/df_generate_dart_models.svg)](https://pub.dev/packages/df_generate_dart_models)
[![tag](https://img.shields.io/badge/Tag-v0.15.0-purple?logo=github)](https://github.com/dev-cetera/df_generate_dart_models/tree/v0.15.0)
[![buymeacoffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-FFDD00?logo=buy-me-a-coffee&logoColor=black)](https://www.buymeacoffee.com/dev_cetera)
[![sponsor](https://img.shields.io/badge/Sponsor-grey?logo=github-sponsors&logoColor=pink)](https://github.com/sponsors/dev-cetera)
[![patreon](https://img.shields.io/badge/Patreon-grey?logo=patreon)](https://www.patreon.com/robelator)
[![discord](https://img.shields.io/badge/Discord-5865F2?logo=discord&logoColor=white)](https://discord.gg/gEQ8y2nfyX)
[![instagram](https://img.shields.io/badge/Instagram-E4405F?logo=instagram&logoColor=white)](https://www.instagram.com/dev_cetera/)
[![license](https://img.shields.io/badge/License-MIT-blue.svg)](https://raw.githubusercontent.com/dev-cetera/df_generate_dart_models/main/LICENSE)

---

<!-- BEGIN _README_CONTENT -->

Generates Dart data models from `@GenerateDartModel` annotations. Pairs with [`df_generate_dart_models_core`](https://pub.dev/packages/df_generate_dart_models_core), which supplies the annotations and base `Model` class.

## Install

Add the runtime dependency to your project:

```yaml
dependencies:
  df_generate_dart_models_core: ^0.10.0
```

Install the generator CLI globally:

```sh
dart pub global activate df_generate_dart_models
```

## Use

Define a model template:

```dart
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

part '_model_user.g.dart';

@GenerateDartModel(
  fields: {
    Field(fieldPath: ['id'], fieldType: String),
    Field(fieldPath: ['firstName'], fieldType: String, nullable: true),
    Field(fieldPath: ['lastName'], fieldType: String, nullable: true),
  },
  shouldInherit: true,
)
abstract class _ModelUser extends Model {
  const _ModelUser();
}
```

From the folder containing the template, run:

```sh
df_generate_dart_models --models-min
```

This writes the generated part file (e.g. `_model_user.g.dart`) next to it.

A [VS Code extension](https://marketplace.visualstudio.com/items?itemName=Dev-Cetera.dev-cetera-df-support-commands) is also available — right-click the folder and pick `🔹 Generate Dart Models (Minimal)`.

## Generate models from an existing DBML schema

If you already have a [DBML](https://dbml.dbdiagram.io) file, you can go the other direction — generate annotated Dart models from it. The reverse generator runs the forward codegen automatically, so a single command takes you from `.dbml` to ready-to-use `Model*` classes:

```sh
df_generate_dart_models_from_dbml -i schema.dbml -o lib/src/db_models --dialect postgres
```

- `--dialect postgres|sqlite|generic` controls the type-prefix vocabulary. Postgres-flavoured columns (`jsonb`, `bytea`, `enum(name)`, `timestamptz`, …) become `PG_*-` field types so the existing PG mappers fire at runtime.
- Declared `Enum {…}` blocks become real Dart enums in a shared `dbml_enums.dart`, referenced by Type literal from each model.
- `Ref:` lines (and inline `[ref: > table.col]` notes) become `references:` + `foreignKey:` annotations.
- Right-click a `.dbml` file in VS Code and pick `🔹 Generate Dart Models from DBML` to run the same pipeline.

Pass `--no-codegen` if you only want the annotation source files without the matching `_*.g.dart`.

## Generate a DBML schema from your models

The inverse path also ships in the same package:

```sh
df_generate_dbml -i lib/src/db_models -o schema/
```

Walks every `@GenerateDartModel`-annotated file under the input directory, groups them by `schema:` value, and writes one `<schema>.dbml` per distinct schema. Enum-typed fields produce `Enum "<name>" { … }` blocks and `enum(<name>)` columns automatically — the variants are resolved via the analyzer, so no side-config is needed.

## Generate SQL `CREATE TABLE` from your models

The DBML emitter is the bridge to SQL. [`dbml2sql`](https://dbml.dbdiagram.io/cli) (a Node CLI) converts the `.dbml` to dialect-specific `CREATE TABLE` statements — including `CREATE TYPE … AS ENUM` for declared enums, foreign-key constraints, composite primary keys, and `NOT NULL`. End-to-end:

```sh
# 1) Models → DBML (round-trips through this package).
df_generate_dbml -i lib/src/db_models -o schema/

# 2) DBML → SQL (one-time install of dbml2sql).
npm install -g @dbml/cli

dbml2sql --postgres schema/app.dbml > schema/app.postgres.sql
dbml2sql --mysql    schema/app.dbml > schema/app.mysql.sql
dbml2sql --mssql    schema/app.dbml > schema/app.mssql.sql
```

Because the `PG_*-` / `SQLITE_*-` prefixes on your `fieldType` strings drive the DBML column types directly (`PG_varchar(120)-String` → `varchar(120)`, `PG_jsonb-Map` → `jsonb`, `PG_bytea-Uint8List` → `bytea`, an enum-typed field → `enum(<name>)`), the resulting SQL matches the Postgres / SQLite dialect you've already pinned in your Dart models — no separate migration spec needed.

<!-- END _README_CONTENT -->

---

🔍 For more information, refer to the [API reference](https://pub.dev/documentation/df_generate_dart_models/).

---

## 💬 Contributing and Discussions

This is an open-source project, and we warmly welcome contributions from everyone, regardless of experience level. Whether you're a seasoned developer or just starting out, contributing to this project is a fantastic way to learn, share your knowledge, and make a meaningful impact on the community.

### ☝️ Ways you can contribute

- **Find us on Discord:** Feel free to ask questions and engage with the community here: https://discord.gg/gEQ8y2nfyX.
- **Share your ideas:** Every perspective matters, and your ideas can spark innovation.
- **Help others:** Engage with other users by offering advice, solutions, or troubleshooting assistance.
- **Report bugs:** Help us identify and fix issues to make the project more robust.
- **Suggest improvements or new features:** Your ideas can help shape the future of the project.
- **Help clarify documentation:** Good documentation is key to accessibility. You can make it easier for others to get started by improving or expanding our documentation.
- **Write articles:** Share your knowledge by writing tutorials, guides, or blog posts about your experiences with the project. It's a great way to contribute and help others learn.

No matter how you choose to contribute, your involvement is greatly appreciated and valued!

### ☕ We drink a lot of coffee...

If you're enjoying this package and find it valuable, consider showing your appreciation with a small donation. Every bit helps in supporting future development. You can donate here: https://www.buymeacoffee.com/dev_cetera

<a href="https://www.buymeacoffee.com/dev_cetera" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" height="40"></a>

## LICENSE

This project is released under the [MIT License](https://raw.githubusercontent.com/dev-cetera/df_generate_dart_models/main/LICENSE). See [LICENSE](https://raw.githubusercontent.com/dev-cetera/df_generate_dart_models/main/LICENSE) for more information.
