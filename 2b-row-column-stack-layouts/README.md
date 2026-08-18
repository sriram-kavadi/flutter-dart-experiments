# Experiment 2(b): Implement Row, Column, and Stack Layouts

## 1. Objective

The objective of this experiment is to explore, implement, and master the core Flutter layout primitives:
1. **`Row`** for horizontal widget alignment.
2. **`Column`** for vertical widget alignment.
3. **`Stack`** & **`Positioned`** for multi-layered overlapping Z-index layouts.

---

## 2. Comprehensive Layout Concepts Breakdown

### 2.1 The `Row` Widget
A `Row` arranges its children in a horizontal array along the X-axis.

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    WidgetA(),
    WidgetB(),
    WidgetC(),
  ],
)
```

* **Main Axis (Horizontal)**: Runs left-to-right (`X-axis`).
* **Cross Axis (Vertical)**: Runs top-to-bottom (`Y-axis`).

### 2.2 The `Column` Widget
A `Column` arranges its children in a vertical array along the Y-axis.

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    WidgetA(),
    WidgetB(),
    WidgetC(),
  ],
)
```

* **Main Axis (Vertical)**: Runs top-to-bottom (`Y-axis`).
* **Cross Axis (Horizontal)**: Runs left-to-right (`X-axis`).

### 2.3 MainAxisAlignment vs. CrossAxisAlignment

| Alignment Property | Axis Orientation in `Row` | Axis Orientation in `Column` | Key Options |
| :--- | :--- | :--- | :--- |
| **`mainAxisAlignment`** | Horizontal Alignment (Left $\leftrightarrow$ Right) | Vertical Alignment (Top $\updownarrow$ Bottom) | `start`, `center`, `end`, `spaceBetween`, `spaceAround`, `spaceEvenly` |
| **`crossAxisAlignment`** | Vertical Alignment (Top $\updownarrow$ Bottom) | Horizontal Alignment (Left $\leftrightarrow$ Right) | `start`, `center`, `end`, `stretch`, `baseline` |

#### Visual Alignment Distinctions:
* **`start`**: Places children at the beginning of the axis.
* **`center`**: Concentrates children directly in the middle of the axis.
* **`end`**: Packs children tightly at the trailing end of the axis.
* **`spaceBetween`**: Distributes free space evenly *between* children, forcing first/last items to the container edges.
* **`spaceAround`**: Distributes space evenly, giving half-size margins to the outer edges.
* **`spaceEvenly`**: Allocates identical spacing between every adjacent pair of children and outer edges.

---

### 2.4 The `Stack` Widget & `Positioned` Elements
Unlike `Row` and `Column` which place widgets side-by-side, `Stack` overlays children on top of each other along the **Z-axis**.

* **Layering Order**: The first widget listed in `children: []` forms the back layer, and subsequent children are rendered above preceding layers.
* **`Positioned` Widget**: Enforces exact absolute positioning constraints within a `Stack`:

```dart
Stack(
  children: [
    // Base Background Layer
    Container(width: 300, height: 200, color: Colors.blue),

    // Overlapping Floating Badge Layer (Positioned)
    Positioned(
      top: 10,
      right: 10,
      child: BadgeWidget(),
    ),
  ],
)
```

---

## 3. Project Structure

```text
2b-row-column-stack-layouts/
├── README.md
└── layouts_demo/
    ├── pubspec.yaml
    └── lib/
        └── main.dart
```

* **`pubspec.yaml`**: App dependencies and Material 3 asset configuration.
* **`lib/main.dart`**: Complete interactive Flutter app separated into three dedicated sections:
  * **Tab 1**: Interactive Row layout with real-time `mainAxisAlignment` and `crossAxisAlignment` dropdown controllers.
  * **Tab 2**: Interactive Column layout with vertical alignment controllers.
  * **Tab 3**: Complex Stack demonstration including an overlapping profile card, status badge, and Z-index shape stack.

---

## 4. How to Run the Application

```bash
# Step 1: Navigate to project folder
cd 2b-row-column-stack-layouts/layouts_demo

# Step 2: Retrieve dependencies
flutter pub get

# Step 3: Launch application
flutter run
```

To run on Chrome Web:

```bash
flutter run -d chrome
```

---

## 5. Expected Application Output

1. **Tab Bar Header**: Switch seamlessly between **Row Layout**, **Column Layout**, and **Stack Layout** tabs.
2. **Part A (Row)**: Displays three colored boxes side-by-side. Updating dropdowns dynamically changes horizontal box spacing and vertical alignment.
3. **Part B (Column)**: Displays three colored boxes stacked vertically. Dropdown selections adjust vertical main-axis distribution.
4. **Part C (Stack)**: Displays a user card with a circular avatar positioned half-outside the top card edge (`top: 0`, `top: 40`), an active `ONLINE` status pill badge positioned at `right: 16`, and a 4-layer Z-index stack box.
