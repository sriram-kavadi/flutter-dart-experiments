# Experiment 4(a): Navigation Between Screens Using Navigator

## Objective

Set up navigation between different screens using Flutter's imperative **Navigator** API (`Navigator.push()` and `Navigator.pop()`), including passing data between screens and custom route transitions.

---

## Key Concepts

| Concept | Description |
| :--- | :--- |
| **Navigator.push()** | Pushes a new route onto the navigation stack |
| **Navigator.pop()** | Removes the top route from the navigation stack |
| **MaterialPageRoute** | Standard Material Design page transition (slide from right) |
| **PageRouteBuilder** | Custom animated route transition using animation controllers |
| **Data Forward** | Passing data to a screen via constructor arguments |
| **Data Back** | Returning data from a screen using `Navigator.pop(context, result)` |

---

## Flutter Navigation Stack

```
┌─────────────────────────────┐
│      ResultsScreen          │  ← Navigator.push() adds to top
├─────────────────────────────┤
│      SettingsScreen         │  ← Navigator.push() adds to top
├─────────────────────────────┤
│      ProfileScreen          │  ← Navigator.push() adds to top
├─────────────────────────────┤
│      HomeScreen             │  ← Root route (always at bottom)
└─────────────────────────────┘
         Navigator Stack
```

---

## Project Structure

```text
4a-navigator-navigation/
├── README.md
└── navigator_demo/
    ├── pubspec.yaml
    └── lib/
        └── main.dart          ← All 4 screens in one file
```

---

## Screens Implemented

### 1. HomeScreen (Root)
- Entry point of the application
- Displays conceptual explanation of navigator stack
- Three navigation buttons demonstrating different push strategies

### 2. ProfileScreen
- Receives `userName`, `userEmail`, `userRole` via constructor
- Demonstrates: **Data Forward** — passing data to pushed screen
- Back navigation via AppBar back button (auto) and explicit `Navigator.pop(context)`

### 3. SettingsScreen
- Pushed using **custom `PageRouteBuilder`** with a horizontal slide animation
- Interactive toggle switches (notifications, dark mode, analytics)
- Demonstrates: **Custom Transition** — `SlideTransition` + `CurveTween`

### 4. ResultsScreen
- Uses `await Navigator.push<String>(...)` in HomeScreen
- Returns selected string data via `Navigator.pop(context, selectedResult)`
- Demonstrates: **Data Back** — returning values from a screen

---

## Running the App

```bash
cd 4a-navigator-navigation/navigator_demo
flutter pub get
flutter run
```

---

## Code Patterns

### Basic Push
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (ctx) => ScreenWidget()),
);
```

### Push with Data (Constructor Arguments)
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (ctx) => ProfileScreen(
      userName: 'Sriram Kavadi',
      userEmail: 'sriram@example.com',
    ),
  ),
);
```

### Custom Transition (Slide)
```dart
Navigator.push(
  context,
  PageRouteBuilder(
    pageBuilder: (ctx, anim, secAnim) => SettingsScreen(),
    transitionsBuilder: (ctx, anim, secAnim, child) {
      final tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
          .chain(CurveTween(curve: Curves.easeInOut));
      return SlideTransition(position: anim.drive(tween), child: child);
    },
  ),
);
```

### Pop with Return Value
```dart
// In ResultsScreen:
Navigator.pop(context, 'Experiment Passed');

// In HomeScreen (caller):
final String? result = await Navigator.push<String>(
  context,
  MaterialPageRoute(builder: (ctx) => ResultsScreen()),
);
if (result != null) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Got: $result')));
}
```

---

## Learning Outcomes

1. Understand Flutter's **stack-based navigation model**
2. Use `Navigator.push()` to move forward between screens
3. Use `Navigator.pop()` to return to the previous screen
4. Pass **data forward** to screens via constructor parameters
5. Return **data back** from screens using `Navigator.pop(context, value)`
6. Create **custom animated transitions** using `PageRouteBuilder`
