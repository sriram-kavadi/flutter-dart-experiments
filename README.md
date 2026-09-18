# Flutter and Dart Lab Experiments

Welcome to the **Flutter and Dart Lab Experiments** repository. This repository contains a structured set of laboratory experiments designed to build fundamental to advanced concepts in Dart programming and cross-platform mobile UI development using Flutter.

---

## 1. Project Overview

This repository acts as a comprehensive laboratory submission codebase. It covers environment configuration, Dart SDK verification, basic Dart programming syntax, core Flutter widget exploration, multi-widget layout structures (`Row`, `Column`, `Stack`), responsive design principles, screen-size adaptation using `MediaQuery` and custom breakpoints, and Flutter navigation using both imperative (`Navigator.push`) and declarative (`named routes`) approaches.

---

## 2. Experiments Table

| Experiment | Topic | Description |
| :--- | :--- | :--- |
| **1(a)** | Flutter and Dart Installation | Install and verify Flutter and Dart SDK development environment setup |
| **1(b)** | Dart Basics | Write a simple Dart program covering fundamental programming concepts |
| **2(a)** | Flutter Widgets | Explore and implement essential Flutter UI widgets (`Text`, `Image`, `Container`, `Card`, Buttons, etc.) |
| **2(b)** | Flutter Layouts | Implement layout structures using `Row`, `Column`, `Stack`, and `Positioned` widgets |
| **3(a)** | Responsive UI | Design a responsive UI adapting seamlessly to Mobile, Tablet, and Desktop screens |
| **3(b)** | Media Queries and Breakpoints | Implement screen adaptation using `MediaQuery` and explicit width breakpoints |
| **4(a)** | Navigator Navigation | Set up navigation between screens using `Navigator.push()`, `Navigator.pop()`, and custom route transitions |
| **4(b)** | Named Routes Navigation | Implement navigation using a centralized route table with `Navigator.pushNamed()` and route arguments |

---

## 3. Technologies Used

* **Language**: Dart (3.x+)
* **Framework**: Flutter SDK (3.x+)
* **IDEs**: VS Code / Android Studio / IntelliJ IDEA
* **Platform Support**: Android, iOS, Web, Desktop (Windows / macOS / Linux)

---

## 4. Prerequisites

To execute and modify the experiments in this repository, ensure the following software tools are installed on your system:

1. **Git**: Version control tool ([git-scm.com](https://git-scm.com/))
2. **Flutter SDK**: Includes the Dart SDK ([flutter.dev](https://flutter.dev/))
3. **Android Studio**: Configured with Android SDK & Android Emulator (for mobile testing)
4. **VS Code**: With **Flutter** and **Dart** extensions installed
5. **Google Chrome / Edge**: For Flutter Web testing without mobile emulators

---

## 5. Installation Verification

Before attempting to run any Flutter application or Dart script, verify your development environment using terminal shell commands:

```bash
# Check Flutter version
flutter --version

# Check Dart version
dart --version

# Run diagnostic tool to check all dependencies and toolchains
flutter doctor
```

---

## 6. Repository Structure

```text
flutter-dart-experiments/
│
├── README.md
├── .gitignore
│
├── 1a-flutter-dart-installation/
│   ├── README.md
│   └── screenshots/
│       └── .gitkeep
│
├── 1b-simple-dart-program/
│   ├── README.md
│   └── simple_dart_program.dart
│
├── 2a-flutter-widgets/
│   ├── README.md
│   └── widgets_demo/
│       ├── lib/
│       │   └── main.dart
│       ├── assets/
│       │   └── flutter_logo.png
│       └── pubspec.yaml
│
├── 2b-row-column-stack-layouts/
│   ├── README.md
│   └── layouts_demo/
│       ├── lib/
│       │   └── main.dart
│       └── pubspec.yaml
│
├── 3a-responsive-ui/
│   ├── README.md
│   └── responsive_ui_demo/
│       ├── lib/
│       │   └── main.dart
│       └── pubspec.yaml
│
├── 3b-media-queries-breakpoints/
│   ├── README.md
│   └── breakpoints_demo/
│       ├── lib/
│       │   └── main.dart
│       └── pubspec.yaml
│
├── 4a-navigator-navigation/
│   ├── README.md
│   └── navigator_demo/
│       ├── lib/
│       │   └── main.dart
│       └── pubspec.yaml
│
└── 4b-named-routes-navigation/
    ├── README.md
    └── named_routes_demo/
        ├── lib/
        │   └── main.dart
        └── pubspec.yaml
```

---

## 7. Running the Experiments

### Experiment 1(a): Installation Documentation
Navigate to `1a-flutter-dart-installation/` to read the step-by-step installation instructions, environment path configuration, and diagnostic troubleshooting.

```bash
cd 1a-flutter-dart-installation
```

### Experiment 1(b): Simple Dart Program
Run the standalone Dart script from the terminal:

```bash
cd 1b-simple-dart-program
dart run simple_dart_program.dart
```

### Experiment 2(a): Explore Various Flutter Widgets
Execute the Flutter widgets demonstration app:

```bash
cd 2a-flutter-widgets/widgets_demo
flutter pub get
flutter run
```

### Experiment 2(b): Row, Column, and Stack Layouts
Execute the layout exploration app:

```bash
cd 2b-row-column-stack-layouts/layouts_demo
flutter pub get
flutter run
```

### Experiment 3(a): Responsive UI Design
Execute the responsive dashboard app:

```bash
cd 3a-responsive-ui/responsive_ui_demo
flutter pub get
flutter run
```

### Experiment 3(b): Media Queries and Breakpoints
Execute the explicit breakpoint demonstration app:

```bash
cd 3b-media-queries-breakpoints/breakpoints_demo
flutter pub get
flutter run
```

### Experiment 4(a): Navigator Navigation
Execute the imperative Navigator demonstration app:

```bash
cd 4a-navigator-navigation/navigator_demo
flutter pub get
flutter run
```

### Experiment 4(b): Named Routes Navigation
Execute the named routes demonstration app:

```bash
cd 4b-named-routes-navigation/named_routes_demo
flutter pub get
flutter run
```

---

## 8. Navigation Concepts Summary (Experiments 4a & 4b)

### Experiment 4(a) — Imperative Navigation (Navigator)

| API | Purpose |
| :--- | :--- |
| `Navigator.push(context, MaterialPageRoute(...))` | Push a new screen onto the stack |
| `Navigator.pop(context)` | Remove the top screen from the stack |
| `Navigator.push<T>()` + `Navigator.pop(context, value)` | Pass data back from a screen |
| `PageRouteBuilder` | Define custom animated screen transitions |

### Experiment 4(b) — Declarative Navigation (Named Routes)

| API | Purpose |
| :--- | :--- |
| `routes: { '/name': (ctx) => Widget() }` | Register route names in `MaterialApp` |
| `Navigator.pushNamed(context, '/name')` | Navigate using a route name string |
| `Navigator.pushNamed(..., arguments: data)` | Pass arguments with named navigation |
| `ModalRoute.of(context)!.settings.arguments` | Read arguments in destination screen |
| `Navigator.pushReplacementNamed()` | Replace the current route (no back) |
| `Navigator.popAndPushNamed()` | Pop current and push new route |
| `Navigator.pushNamedAndRemoveUntil()` | Push and clear previous routes from stack |
| `onUnknownRoute:` | Fallback for unregistered route names |

---

## 9. Learning Outcomes

By completing these laboratory experiments, students and developers will achieve the following:

1. **Environment Mastery**: Successfully configure, inspect, and troubleshoot Flutter and Dart SDK environments.
2. **Language Syntax**: Understand Dart core primitives, strong typing, functions, lists, loops, and control flow.
3. **Widget Composition**: Master fundamental Flutter UI building blocks (`Scaffold`, `Container`, `Card`, `Buttons`, `Text`, `Image`).
4. **Layout Architecture**: Master multi-child widget positioning using horizontal (`Row`), vertical (`Column`), and layered z-index (`Stack` / `Positioned`) layouts.
5. **Adaptive Principles**: Construct responsive layouts using fluid constraints (`LayoutBuilder`, `Expanded`, `Flexible`).
6. **Breakpoints & MediaQuery**: Implement adaptive responsive UIs that react to real-time window resizing and device orientations.
7. **Imperative Navigation**: Use `Navigator.push()` and `Navigator.pop()` to manage a screen stack, pass data forward and backward, and apply custom animated transitions.
8. **Named Route Navigation**: Build a centralized route registry using `MaterialApp.routes`, navigate with `pushNamed()`, transfer arguments via `ModalRoute`, and manage the navigation stack with `pushReplacementNamed()` and `pushNamedAndRemoveUntil()`.

---

## 10. Git Commit Conventions

This repository follows Conventional Commits standard rules for commit messages:

* `chore:` Infrastructure, `.gitignore`, build setup, directory initialization
* `docs:` Documentation files, markdown guides, README updates
* `feat:` New features, Dart scripts, or Flutter application code implementation
* `fix:` Code bug fixes, layout overflow resolutions, pubspec corrections
* `refactor:` Code refactoring, UI structure improvements
* `test:` Code formatting, static analysis, verification checks
