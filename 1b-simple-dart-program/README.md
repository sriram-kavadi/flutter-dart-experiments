# Experiment 1(b): Simple Dart Program

## 1. Objective

The objective of this experiment is to write and execute a clean, beginner-friendly **Dart program** (`simple_dart_program.dart`) to understand the foundational programming concepts, control flow constructs, and core syntax of the Dart programming language.

---

## 2. Concepts Covered

* **Standard Console Output**: Displaying formatted text using `print()`.
* **Variables & Type Safety**: Strongly-typed variable definitions (`String`, `int`, `double`, `bool`, `final`).
* **String Interpolation**: Embedding expressions and variables inside text (`$variable` and `${expression}`).
* **Arithmetic Operators**: Fundamental mathematical calculations (`+`, `-`, `*`, `/`).
* **Conditional Logic**: Decision-making branches using `if`, `else if`, and `else`.
* **Functions**: Creating reusable modular logic with parameters and return types.
* **Lists / Collections**: Storing, retrieving, and measuring ordered element lists.
* **Iteration / Loops**: Processing collection elements using `for` and `for-in` loops.

---

## 3. Program Structure Breakdown

The source file [`simple_dart_program.dart`](simple_dart_program.dart) is organized into clear functional blocks:

```text
simple_dart_program.dart
│
├── main() [Entry Point]
│   ├── 1. Variables & Core Data Types
│   ├── 2. String Interpolation
│   ├── 3. Arithmetic Operations
│   ├── 4. Conditional Statements
│   ├── 5. Function Call Demonstration
│   ├── 6. Lists and Collections
│   └── 7. Loops Demonstration
│
└── Helper Functions
    ├── determineGrade(score)
    └── calculateHonorPoints(gpa, credits)
```

---

## 4. Deep-Dive Syntax Explanation

### 4.1 Variables and Data Types
Dart is a strongly-typed language. The four primary built-in primitive data types demonstrated are:

```dart
final String studentName = 'Alex Mercer'; // Text data
final int age = 21;                        // 64-bit integer values
final double gpa = 3.85;                  // Floating point numbers
final bool isEnrolled = true;             // Boolean true/false values
```

### 4.2 String Interpolation
Dart allows seamless evaluation of variable names using `$name` and dynamic Dart expressions inside curly braces `${expression}`:

```dart
print('Name: $studentName');
print('Enrollment Status: ${isEnrolled ? "Active" : "Inactive"}');
```

### 4.3 Arithmetic Operations
Mathematical calculations are performed using standard arithmetic operators:

```dart
final double totalScore = mathScore + physicsScore + chemistryScore; // Addition (+)
final double averageScore = totalScore / 3;                         // Division (/)
final double scoreDifference = mathScore - physicsScore;            // Subtraction (-)
final double scaledScore = mathScore * 1.05;                        // Multiplication (*)
```

### 4.4 Conditional Statements (`if` / `else`)
Conditionals direct the execution flow based on boolean expressions:

```dart
if (isEnrolled && averageScore >= 75.0) {
  print('Academic Status: Distinction Honors Student');
} else if (isEnrolled && averageScore >= 50.0) {
  print('Academic Status: Regular Student in Good Standing');
} else {
  print('Academic Status: Needs Academic Counseling');
}
```

### 4.5 Functions
Functions encapsulate reusable business logic:

```dart
String determineGrade(double score) {
  if (score >= 90.0) return 'Grade A+ (Outstanding)';
  if (score >= 80.0) return 'Grade A (Excellent)';
  return 'Grade F (Fail)';
}
```

### 4.6 Lists
Lists store ordered collections of items:

```dart
final List<String> registeredCourses = [
  'CS101: Programming Fundamentals with Dart',
  'CS201: Data Structures & Algorithms',
];
```

### 4.7 Loops
Loops allow repeating code blocks over collections:

```dart
// Index-based for loop
for (int i = 0; i < registeredCourses.length; i++) {
  print('Course #${i + 1}: ${registeredCourses[i]}');
}

// For-in loop
for (final course in registeredCourses) {
  print('Course: $course');
}
```

---

## 5. How to Run the Program

### Command

Navigate to the `1b-simple-dart-program/` folder in your terminal and execute:

```bash
cd 1b-simple-dart-program
dart run simple_dart_program.dart
```

---

## 6. Expected Program Output

```text
====================================================
          EXPERIMENT 1(b): DART BASICS DEMO        
====================================================

--- 1. Variables and Core Data Types ---
Student Profile:
Name: Alex Mercer
Age: 21 years old
GPA: 3.85 / 4.0
Enrollment Status: Active
Department: Computer Science & Engineering

--- 2. Arithmetic Operations ---
Math Score: 92.5
Physics Score: 88.0
Chemistry Score: 95.5
Total Combined Score (+): 276.0
Average Score (/): 92.00
Math vs Physics Difference (-): 4.5
Scaled Math Score (* 1.05): 97.13

--- 3. Conditional Statements ---
Calculated Grade for average 92.00: Grade A+ (Outstanding)
Academic Status: Distinction Honors Student

--- 4. Function Call Demonstration ---
Function Call Result: Honor Points (3.85 * 4.0) = 15.4

--- 5. Lists and Collections ---
Total Registered Courses: 5
First Course: CS101: Programming Fundamentals with Dart
Last Course: CS501: Software Engineering Architecture

--- 6. Loops Demonstration ---
Standard Index-Based For-Loop:
  Course #1: CS101: Programming Fundamentals with Dart
  Course #2: CS201: Data Structures & Algorithms
  Course #3: CS301: Mobile Application Development with Flutter
  Course #4: CS401: Database Management Systems
  Course #5: CS501: Software Engineering Architecture

For-In Loop Iteration:
  [1] CS101: Programming Fundamentals with Dart
  [2] CS201: Data Structures & Algorithms
  [3] CS301: Mobile Application Development with Flutter
  [4] CS401: Database Management Systems
  [5] CS501: Software Engineering Architecture

====================================================
         PROGRAM EXECUTED SUCCESSFULLY               
====================================================
```
