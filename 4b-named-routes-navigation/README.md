# Experiment 4(b): Navigation with Named Routes

## Objective

Implement Flutter navigation using the **Named Routes** system — defining a centralized route table in `MaterialApp` and navigating between screens using string-based route names.

---

## Key Concepts

| Concept | Method | Description |
| :--- | :--- | :--- |
| **Route Table** | `routes: { ... }` | Central map of route names → widget builders |
| **Initial Route** | `initialRoute: '/'` | The first screen shown on app launch |
| **Push Named** | `Navigator.pushNamed()` | Navigate to a route by string name |
| **Push with Args** | `arguments:` parameter | Pass data alongside a named route push |
| **Read Args** | `ModalRoute.of(context)!.settings.arguments` | Retrieve arguments in destination screen |
| **Replace** | `Navigator.pushReplacementNamed()` | Replace current route with a new named route |
| **Pop and Push** | `Navigator.popAndPushNamed()` | Pop current then push new — efficient screen swap |
| **Clear Stack** | `Navigator.pushNamedAndRemoveUntil()` | Push and remove all routes matching a predicate |
| **Unknown Route** | `onUnknownRoute:` | Fallback for unregistered route names |

---

## App Route Map

```
Route Name        → Screen Widget         → Navigation Method
─────────────────────────────────────────────────────────────
'/'               → HomeScreen            ← initialRoute
'/dashboard'      → DashboardScreen       ← pushNamed()
'/course-detail'  → CourseDetailScreen    ← pushNamed() + arguments
'/quiz'           → QuizScreen            ← pushReplacementNamed()
'/certificate'    → CertificateScreen     ← pushNamed() + arguments
 (unknown)        → NotFoundScreen        ← onUnknownRoute fallback
```

---

## Project Structure

```text
4b-named-routes-navigation/
├── README.md
└── named_routes_demo/
    ├── pubspec.yaml
    └── lib/
        └── main.dart      ← All 6 screens + route table
```

---

## Screens Implemented

### 1. HomeScreen (`/`)
- Root screen displayed at `initialRoute`
- Displays the route table overview
- Three navigation buttons showing different named-route strategies

### 2. DashboardScreen (`/dashboard`)
- Pushed via `Navigator.pushNamed(context, '/dashboard')`
- Displays mock stats grid
- Further navigates to CourseDetail with arguments

### 3. CourseDetailScreen (`/course-detail`)
- Receives data via `ModalRoute.of(context)!.settings.arguments`
- Displays course title, instructor, duration, level, rating
- Uses `Navigator.popAndPushNamed(context, '/quiz')` to go to Quiz

### 4. QuizScreen (`/quiz`)
- Pushed via `Navigator.pushReplacementNamed()` — **no back button to previous screen**
- 3-question interactive quiz about named routes
- On completion, navigates to Certificate with score arguments
- "Exit" button uses `pushNamedAndRemoveUntil` to clear all routes

### 5. CertificateScreen (`/certificate`)
- Receives score via route arguments
- Displays pass/fail result with dynamic styling
- "Back to Home" uses `pushNamedAndRemoveUntil(context, '/', (_) => false)` to clear stack

### 6. NotFoundScreen (onUnknownRoute fallback)
- Displayed when an unregistered route name is used
- Provides a route back to home

---

## Running the App

```bash
cd 4b-named-routes-navigation/named_routes_demo
flutter pub get
flutter run
```

---

## Code Patterns

### Define Route Table
```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (ctx) => HomeScreen(),
    '/dashboard': (ctx) => DashboardScreen(),
    '/course-detail': (ctx) => CourseDetailScreen(),
    '/quiz': (ctx) => QuizScreen(),
    '/certificate': (ctx) => CertificateScreen(),
  },
  onUnknownRoute: (settings) => MaterialPageRoute(
    builder: (ctx) => NotFoundScreen(),
  ),
);
```

### Navigate with pushNamed
```dart
Navigator.pushNamed(context, '/dashboard');
```

### Navigate with Arguments
```dart
// Sender:
Navigator.pushNamed(
  context,
  '/course-detail',
  arguments: {'title': 'Flutter Course', 'duration': '48 Hours'},
);

// Receiver:
final args = ModalRoute.of(context)!.settings.arguments;
final Map<String, dynamic> data = args as Map<String, dynamic>;
final String title = data['title'] as String;
```

### Replace Current Route
```dart
Navigator.pushReplacementNamed(context, '/quiz');
// Back button on quiz screen won't go to previous screen
```

### Pop and Push Named
```dart
Navigator.popAndPushNamed(context, '/quiz');
// Removes current screen then pushes /quiz
```

### Clear Navigation Stack
```dart
// Clear ALL routes and push home
Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);

// Keep only the root route
Navigator.pushNamedAndRemoveUntil(
  context,
  '/dashboard',
  ModalRoute.withName('/'),
);
```

---

## Learning Outcomes

1. Define a **centralized route table** using the `routes:` map in `MaterialApp`
2. Use `Navigator.pushNamed()` to navigate by route string name
3. Pass **arguments** with named routes and read them via `ModalRoute`
4. Use `pushReplacementNamed()` to **swap** the current screen
5. Use `pushNamedAndRemoveUntil()` to **clear** the navigation stack
6. Handle unknown routes with the `onUnknownRoute` fallback
