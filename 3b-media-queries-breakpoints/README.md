# Experiment 3(b): Implement Media Queries and Breakpoints

## 1. Objective

The objective of this experiment is to implement adaptive Flutter application layouts (`breakpoints_demo`) using **`MediaQuery`** telemetries and explicit, documented screen-size **breakpoints**.

---

## 2. Explanation of `MediaQuery`

In Flutter, **`MediaQuery`** provides real-time information about the current window and device screen metrics, such as logical pixel dimensions, orientation, pixel ratio, and system padding (e.g. status bar heights and notches).

By calling `MediaQuery.of(context)`, widgets automatically rebuild whenever screen dimensions or orientation change (such as rotating a phone or resizing a browser window).

### Key Data Properties Extracted:

```dart
final mediaQuery = MediaQuery.of(context);

final Size screenSize = mediaQuery.size;            // Size(width, height)
final double screenWidth = screenSize.width;        // Width in logical pixels
final double screenHeight = screenSize.height;      // Height in logical pixels
final Orientation orientation = mediaQuery.orientation; // Portrait vs Landscape
final double devicePixelRatio = mediaQuery.devicePixelRatio; // Pixel density multiplier
```

---

## 3. Documented Breakpoint Rules

To adapt the UI across different device factors, the application evaluates screen width (`screenWidth`) against three standard breakpoint rules:

```text
Mobile Breakpoint:   width < 600 px
Tablet Breakpoint:   600 px <= width < 1024 px
Desktop Breakpoint:  width >= 1024 px
```

| Breakpoint Tier | Width Condition | Active Banner Display | Grid Columns | Padding / Spacing | Theme Accent Color |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Mobile** | `width < 600 px` | `Current Layout: Mobile` | 1 Column | Compact (12.0 px) | Deep Purple (`#6200EE`) |
| **Tablet** | `600 px <= width < 1024 px` | `Current Layout: Tablet` | 2 Columns | Medium (18.0 px) | Deep Orange (`#E65100`) |
| **Desktop** | `width >= 1024 px` | `Current Layout: Desktop` | 4 Columns | Generous (24.0 px) | Dark Green (`#1B5E20`) |

---

## 4. Required Layout Behaviors

### 4.1 Mobile Layout (`width < 600 px`)
* Displays the required header text banner:
  ```text
  Current Layout: Mobile
  ```
* Arranges product catalog cards in a **1-column vertical list** (`crossAxisCount: 1`).
* Renders horizontal compact row items with smaller icons and text to prevent horizontal overflow on phone screens.

### 4.2 Tablet Layout (`600 px <= width < 1024 px`)
* Displays the required header text banner:
  ```text
  Current Layout: Tablet
  ```
* Arranges catalog cards in a **2-column grid** (`crossAxisCount: 2`).
* Increases card aspect ratios and padding for touch-friendly tablet interaction.

### 4.3 Desktop Layout (`width >= 1024 px`)
* Displays the required header text banner:
  ```text
  Current Layout: Desktop
  ```
* Arranges catalog cards in a **4-column grid** (`crossAxisCount: 4`).
* Expands generous spacing (`24px`), large icons, and wide card layouts to maximize desktop screen space.

---

## 5. How to Test Different Screen Sizes

1. **Browser Resizing**:
   Launch on Web (`flutter run -d chrome`). Slowly drag the browser window width.
   * At `< 600px`: Banner displays purple `Current Layout: Mobile` with 1 column.
   * At `600px`: Banner dynamically switches to orange `Current Layout: Tablet` with 2 columns.
   * At `1024px`: Banner dynamically switches to green `Current Layout: Desktop` with 4 columns.
2. **Device Rotation**:
   Rotate phone/tablet emulator between Portrait and Landscape modes. The telemetry card instantly updates `Orientation: Portrait` $\leftrightarrow$ `Orientation: Landscape`.

---

## 6. How to Run the Application

```bash
# Step 1: Navigate to project directory
cd 3b-media-queries-breakpoints/breakpoints_demo

# Step 2: Fetch Flutter dependencies
flutter pub get

# Step 3: Launch app
flutter run
```

---

## 7. Expected Application Output

1. **Active Breakpoint Banner**: Dynamic header banner prominently displaying `Current Layout: Mobile`, `Current Layout: Tablet`, or `Current Layout: Desktop`.
2. **Telemetry Card**: Displays live `Screen Width`, `Screen Height`, `Orientation`, `Device Pixel Ratio`, and `Active Grid Columns`.
3. **Breakpoint Rules Table**: Interactive checklist highlighting the active width rule.
4. **Adaptive Product Grid**: Dynamic card grid adjusting from 1 column (Mobile) to 2 columns (Tablet) to 4 columns (Desktop).
