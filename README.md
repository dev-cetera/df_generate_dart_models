<a href="https://www.buymeacoffee.com/dev_cetera" target="_blank"><img align="right" src="https://cdn.buymeacoffee.com/buttons/default-orange.png" height="48"></a>
<a href="https://discord.gg/gEQ8y2nfyX" target="_blank"><img align="right" src="https://raw.githubusercontent.com/dev-cetera/.github/refs/heads/main/assets/icons/discord_icon/discord_icon.svg" height="48"></a>

Dart & Flutter Packages by dev-cetera.com & contributors.

[![sponsor](https://img.shields.io/badge/sponsor-grey?logo=github-sponsors)](https://github.com/sponsors/dev-cetera)
[![patreon](https://img.shields.io/badge/patreon-grey?logo=patreon)](https://www.patreon.com/c/RobertMollentze)
[![pub](https://img.shields.io/pub/v/df_generate_dart_models.svg)](https://pub.dev/packages/df_generate_dart_models)
[![tag](https://img.shields.io/badge/tag-v0.13.5-purple?logo=github)](https://github.com/dev-cetera/df_generate_dart_models/tree/v0.13.5)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/dev-cetera/df_generate_dart_models/main/LICENSE)

---

<!-- BEGIN _README_CONTENT -->

## Summary

A tool for generating data models and classes from annotations, offering greater flexibility than json_serializable or freezed. It supports generating classes from template files for enhanced customization, ensures stronger type safety, and includes intelligent conversion mechanisms.

Below are some basic steps to get you started with this package. This package is designed to work with the [`df_generate_dart_models_core`](https://pub.dev/packages/df_generate_dart_models_core) package, which provides the core functionality for generating models.

The example below provides a glimpse of what this package can do. The package includes advanced features such as AI-driven generation, customizable type mappers, template files, model conversion to other programming languages, and mor but these advanced features are still in development and not yet documented. Feel free to contact the developer if you require more information.

## Quickstart

### Step 1

To install this tool, run `dart pub global activate df_generate_dart_models 0.14.0` in your terminal. You can replace `0.14.0` with any other version or omit it to install the latest version. It’s recommended to specify a version to avoid potential issues from frequent updates and changes.

### Step 2

Add [`df_generate_dart_models_core`](https://pub.dev/packages/df_generate_dart_models_core) to your `pubspec.yaml` file.

```yaml
dependencies:
  df_generate_dart_models_core: 0.9.22 # Fixed version to ensure compatibility and avoid issues from frequent updates.
```

### Step 3

Create a template for your model, for example:

```dart
// Import the annotation GenerateDartModel, Field, and the Model class, etc.
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

// This file may not yet exist but will be generated.
part '_model_user.g.dart';

// Define the model to generate.
@GenerateDartModel(
  fields: {
    Field(
      fieldPath: ['id'],
      fieldType: String,
    ),
    Field(
      fieldPath: ['firstName'], // the field key
      fieldType: String, // the field type
      nullable: true, // whether the field can be null or not
    ),
    Field(
      fieldPath: ['lastName'],
      fieldType: String,
      nullable: true,
    ),
  },
  shouldInherit: true, // lets extend some base class
)

// Since `shouldInherit` is true, the generated model will know to extend this class.
abstract class _ModelUser extends Model {
  const _ModelUser();
}

// We can add some extension methods to the generated model.
extension ModelUserX on ModelUser {
  String fullName() {
    return '${this.firstName} ${this.lastName}';
  }
}
```

### Step 4

Save the file somewhere in its own directory, for example `lib/models/model_user/model_user.dart`.

### Step 5

Open the terminal and navigate to `lib/models/model_user`, then run `df_generate_dart_models`. This will generate the `_model_user.g.dart` file in the same directory. In editors like VS Code, you can right-click on the folder and select _“Open in Integrated Terminal”_ to open the terminal directly at the desired location, and then run `df_generate_dart_models` to generate the file.

<!-- END _README_CONTENT -->

---

☝️ Please refer to the [API reference](https://pub.dev/documentation/df_generate_dart_models/) for more information.

---

## 💬 Contributing and Discussions

This is an open-source project, and we warmly welcome contributions from everyone, regardless of experience level. Whether you're a seasoned developer or just starting out, contributing to this project is a fantastic way to learn, share your knowledge, and make a meaningful impact on the community.

### ☝️ Ways you can contribute

- **Buy me a coffee:** If you'd like to support the project financially, consider [buying me a coffee](https://www.buymeacoffee.com/dev_cetera). Your support helps cover the costs of development and keeps the project growing.
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

## 🧑‍⚖️ License

This project is released under the [MIT License](https://raw.githubusercontent.com/dev-cetera/df_generate_dart_models/main/LICENSE). See [LICENSE](https://raw.githubusercontent.com/dev-cetera/df_generate_dart_models/main/LICENSE) for more information.
