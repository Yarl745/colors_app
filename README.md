# Random Color Generator App

A Flutter application that dynamically changes the background color to a random color and adjusts the text color for optimal contrast.

## Features

- Random Color Generation: Tap anywhere on the screen to generate a new, random background color.
- Contrast Text: The color of the text changes based on the background color to ensure good readability.

## Getting Started

To run this project, follow these simple steps:

1. Clone the repository.
2. Navigate to the project's root directory.
3. Run `flutter pub get` to install the dependencies.
4. Start the build runner with `dart run build_runner watch --delete-conflicting-outputs` to generate any necessary files.
5. Run the app with `flutter run`.

## Architecture

This project follows the Clean Architecture principles with the following structure:

- `core`: Core functionality and configurations.
- `data`: Data handling layers such as data sources and repositories.
- `domain`: Business logic entities and repository definitions.
- `presentation`: UI layer with views, view models, and base widgets.

## Dependency Injection

The app uses `get_it` for dependency injection and service location. All necessary services and models are set up in the `injection_container.dart` file.

## ViewModel

`random_color_page_view_model.dart` manages the state of the random color page, including background and contrast text color updates.

## Running Tests

To run tests, execute the following command:

```shell
flutter test
```

## Linting
The project adheres to linting rules defined in solid_lints. Ensure code quality by running:

```shell
flutter analyze
```

## Dependencies
- `dartz`: Functional programming in Dart.
- `flutter_mobx and mobx`: For state management.
- `equatable`: To facilitate value comparison.
- `get_it`: For dependency injection.
- `cupertino_icons`: For iOS-style icons.

## Development Dependencies
- `flutter_test`: For writing and running tests.
- `build_runner`: For generating code.
- `mobx_codegen`: For generating MobX stores.
- `mockito`: For creating mocks in tests.
- `solid_lints`: For enforcing a set of strict lint rules.