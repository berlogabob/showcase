# Copilot Instructions for Flutter Showcase

This is a Flutter application demonstrating basic Material Design patterns with a simple counter example.

## Build & Development

**Environment:**
- Flutter 3.41.4 (stable)
- Dart 3.11.1
- Targets: iOS, Android, Web, Linux, macOS, Windows

**Core commands:**
- `flutter run` - Run the app on the default device
- `flutter run -d <device>` - Run on specific device (use `flutter devices` to list)
- `flutter test` - Run all unit/widget tests
- `flutter test test/widget_test.dart` - Run a specific test file
- `flutter analyze` - Lint code using analysis_options.yaml rules
- `flutter clean` - Clean build artifacts

**Hot Reload:** Press `r` in the CLI during `flutter run` to reload code changes without restarting the app. Use `R` for full restart.

## Project Structure

- `lib/main.dart` - Entry point; contains MyApp (MaterialApp), MyHomePage (StatefulWidget), and counter logic
- `test/widget_test.dart` - Widget tests using WidgetTester for UI interactions and assertions
- `pubspec.yaml` - Defines dependencies, app metadata, and Flutter-specific assets configuration
- `analysis_options.yaml` - Dart analyzer configuration with flutter_lints enabled

## Architecture & Patterns

**Widget Structure:**
- Stateless widgets (MyApp) for immutable UI that doesn't change
- Stateful widgets (MyHomePage + _MyHomePageState) for mutable state requiring `setState()` callbacks
- Material Design: Uses Material 3 (ColorScheme.fromSeed) for theming

**State Management:**
The app uses basic `setState()` for local widget state. The counter state lives in `_MyHomePageState._counter`.

**Testing:**
Widget tests use `WidgetTester` to:
- Pump widgets with `tester.pumpWidget()`
- Find elements with `find.text()`, `find.byIcon()`
- Verify expectations with `expect()`

## Key Conventions

- **Private members:** Prefix with underscore (_counter, _MyHomePageState, _incrementCounter)
- **Const constructors:** Mark constructors const when possible (MyApp, MyHomePage, MyHomePage, Text, Icon, etc.)
- **Hot reload:** Keep state mutations isolated to `setState()` for predictable reloading behavior
- **Linting:** Use `flutter analyze` before committing; the flutter_lints package enforces best practices
