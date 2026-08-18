# Experiment 2(a): Explore Various Flutter Widgets

## 1. Objective

The objective of this experiment is to explore, build, and understand the role of commonly used fundamental Flutter widgets by constructing a complete, modular Flutter application (`widgets_demo`).

---

## 2. Demonstrated Widgets Breakdown

This application comprehensively demonstrates 13 core Flutter widgets:

| Widget Name | Category | Purpose & Description in Application |
| :--- | :--- | :--- |
| **`Scaffold`** | Structure | Provides the visual root layout structure, handling AppBars, snackbars, and body content slots. |
| **`AppBar`** | Navigation | Displays top action bar with custom title, background color, elevation, and action icons. |
| **`Text`** | Typography | Displays text strings formatted with custom fonts, colors, font weights, and letter spacing. |
| **`Image`** | Media | Renders graphics, logos, and visual assets within the user interface. |
| **`Icon`** | Media | Renders vector graphics icons from Material Design icon library (`Icons.star`, `Icons.favorite`, etc.). |
| **`Container`** | Layout & Style | Flexible box widget providing padding, margins, custom background gradients, borders, and rounded corners. |
| **`Card`** | Material Surface | Creates elevated surface cards with rounded corners, drop shadows, and grouped inner content. |
| **`ElevatedButton`** | Control | Primary action button with background color fill and shadow elevation. Updates counter state when pressed. |
| **`TextButton`** | Control | Flat textual button without border fill, used for low-priority dialog and snackbar triggers. |
| **`OutlinedButton`** | Control | Medium-emphasis button rendered with a surrounding border stroke. Resets state counter when pressed. |
| **`Padding`** | Layout | Applies uniform or directional inset padding around child widgets. |
| **`Center`** | Alignment | Aligns its child widget directly in the vertical and horizontal center of its parent bounds. |
| **`SizedBox`** | Spacing / Sizing | Enforces explicit height/width dimensions and inserts fixed whitespace between widgets. |

---

## 3. Project Structure

```text
2a-flutter-widgets/
├── README.md
└── widgets_demo/
    ├── pubspec.yaml
    └── lib/
        └── main.dart
```

* **`pubspec.yaml`**: Defines application metadata, SDK constraints (`>=3.0.0 <4.0.0`), and Flutter Material Design dependencies.
* **`lib/main.dart`**: Contains the complete Flutter code organized into modular sections showcasing typography, container styling, media icons, and button interaction callbacks.

---

## 4. Code Implementation Highlights

### 4.1 Scaffold & AppBar Architecture
```dart
return Scaffold(
  appBar: AppBar(
    title: const Text('Experiment 2(a): Flutter Widgets'),
    backgroundColor: const Color(0xFF6750A4),
    foregroundColor: Colors.white,
  ),
  body: SingleChildScrollView(...),
);
```

### 4.2 Card, Container & Gradient Text
```dart
Card(
  elevation: 3,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [Color(0xFF6750A4), Color(0xFFD0BCFF)]),
    ),
    child: Text('Styled Gradient Text'),
  ),
);
```

### 4.3 Interactive Button State Management
```dart
ElevatedButton.icon(
  onPressed: () {
    setState(() {
      _counter++;
    });
  },
  icon: const Icon(Icons.add),
  label: Text('Increment ($_counter)'),
);
```

---

## 5. How to Run the Application

Navigate into the `widgets_demo` directory and run the standard Flutter terminal lifecycle commands:

```bash
# Step 1: Navigate to project directory
cd 2a-flutter-widgets/widgets_demo

# Step 2: Fetch Flutter package dependencies
flutter pub get

# Step 3: Execute application on connected emulator or browser
flutter run
```

To run specifically on Google Chrome without configuring a mobile emulator:

```bash
flutter run -d chrome
```

---

## 6. Expected Application Output

When launched, the application displays a structured single-page layout:

1. **Top AppBar**: Purple Material 3 header bar titled *"Experiment 2(a): Flutter Widgets"*.
2. **Text & Card Section**: Demonstrates standard title text, italicized subtitle text, and custom white text inside a purple gradient box.
3. **Container & Center Section**: Shows a centered box container decorated with a border stroke and subtle drop shadow.
4. **Image & Icon Section**: Displays a row of colored Material icons (`star`, `favorite`, `flutter_dash`, `thumb_up`, `lightbulb`) alongside a custom Flutter Dash media banner.
5. **Buttons & Interaction Section**: Displays three interactive buttons (`ElevatedButton`, `TextButton`, `OutlinedButton`). Tapping `ElevatedButton` increments an interactive counter state, while tapping `Reset` restores the initial state.
6. **Bottom Verification Bar**: Confirms *13/13 Required Widgets Successfully Demonstrated*.
