/// Experiment 1(b): Simple Dart Program
/// Demonstrates Dart fundamental concepts including data types, variables,
/// string interpolation, arithmetic operations, conditionals, functions, lists, and loops.

void main() {
  print('====================================================');
  print('          EXPERIMENT 1(b): DART BASICS DEMO        ');
  print('====================================================\n');

  // 1. Variable Declarations and Data Types
  print('--- 1. Variables and Core Data Types ---');
  final String studentName = 'Alex Mercer';
  final int age = 21;
  final double gpa = 3.85;
  final bool isEnrolled = true;
  final String department = 'Computer Science & Engineering';

  // 2. String Interpolation
  print('Student Profile:');
  print('Name: $studentName');
  print('Age: $age years old');
  print('GPA: $gpa / 4.0');
  print('Enrollment Status: ${isEnrolled ? "Active" : "Inactive"}');
  print('Department: $department\n');

  // 3. Arithmetic Operations
  print('--- 2. Arithmetic Operations ---');
  final double mathScore = 92.5;
  final double physicsScore = 88.0;
  final double chemistryScore = 95.5;

  final double totalScore = mathScore + physicsScore + chemistryScore;
  final double averageScore = totalScore / 3;
  final double scoreDifference = mathScore - physicsScore;
  final double scaledScore = mathScore * 1.05;

  print('Math Score: $mathScore');
  print('Physics Score: $physicsScore');
  print('Chemistry Score: $chemistryScore');
  print('Total Combined Score (+): $totalScore');
  print('Average Score (/): ${averageScore.toStringAsFixed(2)}');
  print('Math vs Physics Difference (-): $scoreDifference');
  print('Scaled Math Score (* 1.05): ${scaledScore.toStringAsFixed(2)}\n');

  // 4. Conditional Statements (if / else)
  print('--- 3. Conditional Statements ---');
  final String gradeResult = determineGrade(averageScore);
  print('Calculated Grade for average ${averageScore.toStringAsFixed(2)}: $gradeResult');

  if (isEnrolled && averageScore >= 75.0) {
    print('Academic Status: Distinction Honors Student');
  } else if (isEnrolled && averageScore >= 50.0) {
    print('Academic Status: Regular Student in Good Standing');
  } else {
    print('Academic Status: Needs Academic Counseling');
  }
  print('');

  // 5. Functions Demonstration
  print('--- 4. Function Call Demonstration ---');
  final double courseCredits = 4.0;
  final double calculatedHonorPoints = calculateHonorPoints(gpa, courseCredits);
  print('Function Call Result: Honor Points ($gpa * $courseCredits) = $calculatedHonorPoints\n');

  // 6. Lists & Processing
  print('--- 5. Lists and Collections ---');
  final List<String> registeredCourses = [
    'CS101: Programming Fundamentals with Dart',
    'CS201: Data Structures & Algorithms',
    'CS301: Mobile Application Development with Flutter',
    'CS401: Database Management Systems',
    'CS501: Software Engineering Architecture'
  ];

  print('Total Registered Courses: ${registeredCourses.length}');
  print('First Course: ${registeredCourses.first}');
  print('Last Course: ${registeredCourses.last}\n');

  // 7. Loops (for & for-in)
  print('--- 6. Loops Demonstration ---');
  print('Standard Index-Based For-Loop:');
  for (int i = 0; i < registeredCourses.length; i++) {
    print('  Course #${i + 1}: ${registeredCourses[i]}');
  }

  print('\nFor-In Loop Iteration:');
  int count = 1;
  for (final course in registeredCourses) {
    print('  [$count] $course');
    count++;
  }

  print('\n====================================================');
  print('         PROGRAM EXECUTED SUCCESSFULLY               ');
  print('====================================================');
}

/// Helper function to calculate letter grade based on numeric score
String determineGrade(double score) {
  if (score >= 90.0) {
    return 'Grade A+ (Outstanding)';
  } else if (score >= 80.0) {
    return 'Grade A (Excellent)';
  } else if (score >= 70.0) {
    return 'Grade B (Good)';
  } else if (score >= 60.0) {
    return 'Grade C (Satisfactory)';
  } else {
    return 'Grade F (Fail)';
  }
}

/// Helper function to calculate total honor points
double calculateHonorPoints(double gpa, double credits) {
  return gpa * credits;
}
