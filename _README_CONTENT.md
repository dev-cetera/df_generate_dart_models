A tool for generating data models and classes from annotations, offering greater flexibility than json_serializable or freezed. It supports generating classes from template files for enhanced customization, ensures stronger type safety, and includes intelligent conversion mechanisms.

Below are some basic steps to get you started with this package. This package is designed to work with the [`df_generate_dart_models_core`](https://pub.dev/packages/df_generate_dart_models_core) package, which provides the core functionality for generating models.

The example below provides a glimpse of what this package can do. The package includes advanced features such as AI-driven generation, customizable type mappers, template files, model conversion to other programming languages, and more but these advanced features are still in development and not yet documented. Feel free to contact the developer if you require more information.

## How to Use

### Step 1

Add [`df_generate_dart_models_core`](https://pub.dev/packages/df_generate_dart_models_core) to your `pubspec.yaml` file.

```yaml
dependencies:
  df_generate_dart_models_core: 0.9.24 # Fixed version to ensure compatibility and avoid issues from frequent updates.
```

### Step 2

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

Save the file somewhere in its own directory, for example `lib/models/model_user/model_user.dart`.

### Step 3

#### With Visual Studio Code

1. Install the extension here: https://marketplace.visualstudio.com/items?itemName=Dev-Cetera.dev-cetera-df-support-commands
2. Right-click on the folder where you created the model template and select `🔹 Generate Dart Models (Minimal)`.
3. Alternatively, right-click a folder and select `"Open in Integrated Terminal"` then run `--models-min` in the terminal.
4. This will generate the part file e.g. `_model_user.g.dart`.

#### Without Visual Studio Code

1. Install this tool by running `dart pub global activate df_generate_dart_models` in your terminal.
2. In your project, open a terminal at the desired folder, e.g. `cd lib/models/model_user/model_user.dart`.
3. Run `--models-min`. This will generate the `_model_user.g.dart` file in the same directory.
