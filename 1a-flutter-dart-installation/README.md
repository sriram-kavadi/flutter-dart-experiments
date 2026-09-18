# Experiment 1(a): Install Flutter and Dart SDK

## 1. Objective

The objective of this experiment is to successfully download, install, configure, and verify the **Flutter SDK** and **Dart SDK** development environment. Proper installation guarantees that compilers, toolchains, device emulators, IDE plugins, and command-line tools function seamlessly for building cross-platform applications.

---

## 2. Prerequisites

Before installing Flutter and Dart SDKs, ensure your host computer meets the following minimum system requirements:

### System Requirements

* **Operating System**:
  * **Windows**: Windows 10 or later (64-bit), x86-64 based
  * **macOS**: macOS 10.15 (Catalina) or later (Apple Silicon M1/M2/M3 or Intel)
  * **Linux**: Ubuntu 20.04 LTS or equivalent (64-bit)
* **Disk Space**: At least **10 GB** of free disk space for SDK tools, Android Studio, and emulators.
* **Memory**: Minimum 8 GB RAM (16 GB recommended for smooth emulator performance).
* **Internet Connection**: Required to download SDK bundles, dependencies, and packages.

### Required Software & Tools

1. **Command Line Tools**: PowerShell / Command Prompt (Windows), Terminal (macOS/Linux), Git for Windows.
2. **Code Editor / IDE**:
   * **Visual Studio Code** (with official Flutter & Dart extensions installed)
   * **Android Studio** (for Android SDK, build-tools, and emulator creation)

---

## 3. Flutter Installation

Follow these platform-specific steps to install the Flutter SDK:

### Step 1: Download Flutter SDK

1. Visit the official Flutter documentation download portal: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
2. Select your host operating system (Windows, macOS, or Linux).
3. Download the latest stable release zip bundle (e.g., `flutter_windows_3.x.x-stable.zip`).

### Step 2: Extract Flutter SDK

1. Extract the downloaded `.zip` file into a suitable installation folder.
2. **Recommended Installation Directory**:
   * **Windows**: `C:\src\flutter` or `C:\flutter`
   * **macOS**: `~/development/flutter`
   * **Linux**: `~/development/flutter`

> **Warning**: Do **NOT** install Flutter in directories requiring elevated administrator permissions such as `C:\Program Files\` or system root folders, as write restrictions can cause build errors.

### Step 3: Configure Environment Path Variables

To execute `flutter` commands globally from any terminal window, add the Flutter `bin` directory to system environment variables.

#### On Windows:
1. Open the Windows Start Menu and search for **"Edit the system environment variables"**.
2. Click on **Environment Variables...**.
3. Under **User variables**, select `Path` and click **Edit...**.
4. Click **New** and append the full path to your Flutter `bin` directory:
   ```text
   C:\src\flutter\bin
   ```
5. Click **OK** on all dialog boxes to save changes.

#### On macOS / Linux:
1. Open Terminal and edit your shell configuration file (`~/.zshrc` or `~/.bashrc`):
   ```bash
   nano ~/.zshrc
   ```
2. Add the following export line at the bottom of the file:
   ```bash
   export PATH="$HOME/development/flutter/bin:$PATH"
   ```
3. Save the file (`Ctrl + O`, `Enter`) and exit (`Ctrl + X`).
4. Apply the updated environment configuration:
   ```bash
   source ~/.zshrc
   ```

---

## 4. Dart SDK

The **Dart SDK** comes pre-packaged and bundled directly inside the Flutter SDK under `flutter/bin/cache/dart-sdk`. You do **not** need to install a separate standalone Dart SDK when using Flutter.

When you add `flutter/bin` to your system `PATH`, the `dart` executable automatically becomes globally accessible in your terminal.

### Standalone Dart Installation (Optional for non-Flutter Dart development)
If you wish to install Dart independently without Flutter:
* **Windows (via Chocolatey)**: `choco install dart-sdk`
* **macOS (via Homebrew)**: `brew install dart`
* **Linux (via apt)**: `sudo apt-get install dart`

---

## 5. Environment Verification

Open a fresh terminal window (PowerShell, Command Prompt, or Zsh) and execute the following commands to verify installation:

### Command 1: Check Flutter Version
```bash
flutter --version
```
* **Purpose**: Prints the installed Flutter framework version, Dart version, and channel (e.g., `stable`).

### Command 2: Check Dart Version
```bash
dart --version
```
* **Purpose**: Displays the bundled Dart SDK compiler version (e.g., `Dart SDK version: 3.x.x`).

### Command 3: Run Flutter Doctor
```bash
flutter doctor
```
* **Purpose**: Diagnoses host environment configuration, checks toolchain status, Android Studio setup, VS Code integration, and connected devices.

---

## 6. Understanding `flutter doctor`

The `flutter doctor` command inspects your host machine and prints a diagnostic report. It evaluates six critical setup components:

1. **Flutter Installation**: Verifies Flutter SDK binaries, channel, and framework integrity.
2. **Dart SDK**: Verifies Dart SDK runtime version and core libraries.
3. **Android Toolchain**: Verifies Android SDK installation, `platform-tools`, `build-tools`, and Android license acceptances.
4. **Xcode / macOS Toolchain** *(macOS only)*: Verifies CocoaPods, Xcode setup for iOS compilation.
5. **Chrome / Web Development**: Checks Google Chrome availability for rendering Flutter Web applications.
6. **Connected Devices / IDE Support**: Scans for active physical devices, emulators, VS Code plugins, and Android Studio plugins.

### Example `flutter doctor` Output:

```text
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.22.0, on Microsoft Windows [Version 10.0.19045.4412], locale en-US)
[✓] Windows Version (Installed version of Windows is version 10 or higher)
[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2023.3)
[✓] VS Code (version 1.89.1)
[✓] Connected device (2 available)
[✓] Network resources

• No issues found!
```

---

## 7. Common Problems and Solutions

### Issue 1: `flutter` or `dart` is not recognized as an internal or external command
* **Cause**: The path to `flutter/bin` has not been added to your OS system environment variables, or terminal was not restarted.
* **Solution**:
  1. Re-check the Path entry in System Environment Variables (`C:\src\flutter\bin`).
  2. Close and reopen all terminal and IDE windows.

### Issue 2: Android licenses status is unknown / Android licenses not accepted
* **Cause**: Android SDK command-line tools are missing or licenses have not been accepted.
* **Solution**:
  1. Open Android Studio > SDK Manager > SDK Tools.
  2. Check **Android SDK Command-line Tools (latest)** and click **Apply**.
  3. Run the license approval command in terminal:
     ```bash
     flutter doctor --android-licenses
     ```
  4. Press `y` to accept all licenses.

### Issue 3: No connected device available
* **Cause**: No Android Emulator, physical phone, or browser target is running.
* **Solution**:
  1. Launch an Android Virtual Device (AVD) from Android Studio Device Manager.
  2. Enable **USB Debugging** on physical Android hardware.
  3. Alternatively, test on Chrome by selecting Chrome as your target device: `flutter run -d chrome`.

### Issue 4: Android Studio plugin not installed
* **Cause**: Flutter & Dart plugins are missing inside Android Studio settings.
* **Solution**:
  1. Open Android Studio > Settings / Preferences > Plugins.
  2. Search for **Flutter** in the Marketplace tab and click **Install** (this also installs the Dart plugin).
  3. Restart Android Studio.

---

## 8. Expected Result

A successful installation is achieved when `flutter doctor` shows green checkmarks `[✓]` for Flutter, Dart, Android toolchain, IDEs, and connected devices without any critical red errors `[✗]`. Terminal commands `flutter --version` and `dart --version` execute cleanly.

---

## 9. Screenshots Documentation

The verification output screenshots are stored inside the `screenshots/` directory and were generated using the included `generate_screenshots.ps1` script.

| File | Command Shown | Description |
| :--- | :--- | :--- |
| `screenshot_flutter_version.png` | `flutter --version` | Flutter SDK version, channel, Dart version |
| `screenshot_dart_version.png` | `dart --version` | Dart SDK version string |
| `screenshot_flutter_doctor.png` | `flutter doctor` | Full environment health check with all green ✓ |

```text
1a-flutter-dart-installation/
├── README.md
└── screenshots/
    ├── generate_screenshots.ps1       ← Script to regenerate all screenshots
    ├── screenshot_flutter_version.png
    ├── screenshot_dart_version.png
    └── screenshot_flutter_doctor.png
```

### Regenerating Screenshots

To regenerate the screenshots, open PowerShell in the `screenshots/` folder and run:

```powershell
powershell -ExecutionPolicy Bypass -File generate_screenshots.ps1
```
