# Experiment 3(a): Design a Responsive UI

## 1. Objective

The objective of this experiment is to design and build a multi-platform **Responsive Flutter Dashboard Application** (`responsive_ui_demo`) that dynamically adapts its layout structure, navigation paradigms, spacing, and column count across Mobile, Tablet, and Desktop screen viewports.

---

## 2. Responsive UI Design Definition

**Responsive UI Design** in Flutter refers to building user interfaces that fluidly recalculate their dimensions, alignment, visibility, and structural composition based on available physical screen real estate or parent layout constraints.

Rather than designing fixed-pixel screens that overflow or stretch unnaturally, responsive design uses constraint-aware widgets and flexible flex ratios.

---

## 3. Core Responsive Techniques Used

### 3.1 `LayoutBuilder`
`LayoutBuilder` provides a callback `builder: (context, constraints)` that yields the parent widget's max/min width and height constraints.

```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth >= 1024) {
      return DesktopLayout();
    } else if (constraints.maxWidth >= 600) {
      return TabletLayout();
    } else {
      return MobileLayout();
    }
  },
)
```

### 3.2 `Expanded`
`Expanded` forces a child widget of a `Row`, `Column`, or `Flex` to expand and fill all available remaining space along the main axis.

```dart
Row(
  children: [
    SidebarWidget(width: 240), // Fixed width
    Expanded(
      child: MainContentWidget(), // Expands to fill rest of screen
    ),
  ],
)
```

### 3.3 `Flexible`
`Flexible` gives a child widget the flexibility to fit within available space without forcing it to fill 100% of the main axis space (unless `fit: FlexFit.tight` is specified).

```dart
Row(
  children: [
    Expanded(flex: 2, child: ChartCard()),      // Takes 2/3 flex space
    Flexible(flex: 1, child: TransactionsCard()), // Takes 1/3 flex space
  ],
)
```

---

## 4. Layout Adaptation Across Screen Viewports

| Viewport Category | Screen Width Range | Navigation Paradigm | KPI Grid Columns | Content Layout Architecture |
| :--- | :--- | :--- | :--- | :--- |
| **Mobile** | `< 600 px` | `BottomNavigationBar` | 1 Column | Single vertical column stack with compact padding. |
| **Tablet** | `600 px` to `1023 px` | Vertical `NavigationRail` | 2 Columns | Dual-column split view with medium density cards. |
| **Desktop** | `≥ 1024 px` | Persistent Sidebar `Drawer` | 4 Columns | 3-Pane Dashboard with main analytics & secondary activity panel side-by-side (`Expanded flex: 2` / `Flexible flex: 1`). |

---

## 5. How to Test Responsiveness

To observe real-time layout transformations:

1. **Flutter Web Browser Resizing**:
   Run `flutter run -d chrome`. Click and drag the Chrome browser window edges horizontally. Watch the top banner update between:
   * `Active Mode: Mobile (Single Column)`
   * `Active Mode: Tablet (2-Column Grid)`
   * `Active Mode: Desktop (3-Pane Layout)`
2. **Desktop Window Resizing**:
   Run on Windows/macOS desktop (`flutter run -d windows`). Resize the app window dynamically.
3. **Device Emulators**:
   Test on an Android phone emulator, an iPad tablet emulator, or rotate device orientation (`Ctrl + F11`).

---

## 6. How to Run the Application

```bash
# Step 1: Navigate to project directory
cd 3a-responsive-ui/responsive_ui_demo

# Step 2: Fetch package dependencies
flutter pub get

# Step 3: Launch app
flutter run
```

---

## 7. Expected Application Output

1. **Top Active Mode Banner**: Blue header banner displaying real-time constrained viewport width in pixels (e.g., `Viewport Constrained Width: 1280.0 px`).
2. **Mobile View (< 600px)**: Displays bottom navigation bar (`Overview`, `Analytics`, `Settings`), 1-column metric cards stack, and single-column chart & transaction list.
3. **Tablet View (600px - 1023px)**: Displays a slim left NavigationRail, 2-column KPI metric grid, and medium spacing.
4. **Desktop View (≥ 1024px)**: Displays full enterprise left drawer navigation, 4-column KPI metric grid, and side-by-side revenue chart (Expanded) with recent transactions card.
