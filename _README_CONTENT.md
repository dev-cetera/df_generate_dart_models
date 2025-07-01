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
