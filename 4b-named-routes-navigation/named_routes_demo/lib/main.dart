import 'package:flutter/material.dart';

// =================================================================
// Experiment 4(b): Navigation with Named Routes
// =================================================================
// Demonstrates defining a central route table in MaterialApp,
// navigating with Navigator.pushNamed(), passing arguments via
// ModalRoute.of(context)!.settings.arguments, and using
// Navigator.pushReplacementNamed() and Navigator.popAndPushNamed().
// =================================================================

void main() {
  runApp(const NamedRoutesDemoApp());
}

// ─────────────────────────────────────────────────────────────────────────────
// ROUTE CONSTANTS
// Define all route names as constants to avoid magic strings throughout the app.
// ─────────────────────────────────────────────────────────────────────────────
class AppRoutes {
  AppRoutes._(); // Prevent instantiation

  static const String home = '/';
  static const String dashboard = '/dashboard';
  static const String courseDetail = '/course-detail';
  static const String quiz = '/quiz';
  static const String certificate = '/certificate';
}

/// Root Application Widget for Experiment 4(b)
class NamedRoutesDemoApp extends StatelessWidget {
  const NamedRoutesDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 4(b): Named Routes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00695C), // teal
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),

      // ── initialRoute ─────────────────────────────────────────────────────
      // Sets the first screen shown when the app starts.
      // Equivalent to setting `home:` but works within named route system.
      initialRoute: AppRoutes.home,

      // ── routes ───────────────────────────────────────────────────────────
      // Central route table: maps String route names → Widget builders.
      // This is the core of named-route navigation in Flutter.
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.dashboard: (context) => const DashboardScreen(),
        AppRoutes.courseDetail: (context) => const CourseDetailScreen(),
        AppRoutes.quiz: (context) => const QuizScreen(),
        AppRoutes.certificate: (context) => const CertificateScreen(),
      },

      // ── onUnknownRoute ───────────────────────────────────────────────────
      // Fallback route if a pushNamed() call uses an unregistered route name.
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const NotFoundScreen(),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 1: HomeScreen — Route: '/'
// ─────────────────────────────────────────────────────────────────────────────
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FAF8),
      appBar: AppBar(
        title: const Text(
          'Experiment 4(b): Named Routes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF00695C),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Concept Banner ──────────────────────────────────────────────
            _buildConceptBanner(),
            const SizedBox(height: 24),

            // ── Route Table Card ────────────────────────────────────────────
            _buildRouteTableCard(),
            const SizedBox(height: 24),

            // ── Navigation Buttons ──────────────────────────────────────────
            const Text(
              'Navigate Using Named Routes',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // 1. Simple pushNamed — no arguments
            _buildNavButton(
              context: context,
              label: 'Go to Dashboard',
              routeLabel: AppRoutes.dashboard,
              subtitle: 'Navigator.pushNamed() — no arguments',
              icon: Icons.dashboard,
              color: const Color(0xFF00695C),
              onTap: () {
                // Navigator.pushNamed() pushes using the route name string.
                Navigator.pushNamed(context, AppRoutes.dashboard);
              },
            ),
            const SizedBox(height: 12),

            // 2. pushNamed with arguments
            _buildNavButton(
              context: context,
              label: 'View Flutter Course Detail',
              routeLabel: AppRoutes.courseDetail,
              subtitle: 'Navigator.pushNamed() with arguments map',
              icon: Icons.menu_book,
              color: const Color(0xFF1565C0),
              onTap: () {
                // Pass arguments as any object (here a Map) using `arguments:`
                Navigator.pushNamed(
                  context,
                  AppRoutes.courseDetail,
                  arguments: {
                    'title': 'Flutter & Dart Masterclass',
                    'instructor': 'Prof. Kavadi',
                    'duration': '48 Hours',
                    'level': 'Intermediate',
                    'rating': 4.8,
                  },
                );
              },
            ),
            const SizedBox(height: 12),

            // 3. pushReplacementNamed — replaces current route
            _buildNavButton(
              context: context,
              label: 'Launch Quiz (Replace Route)',
              routeLabel: AppRoutes.quiz,
              subtitle: 'Navigator.pushReplacementNamed() — no back button',
              icon: Icons.quiz,
              color: const Color(0xFFE65100),
              onTap: () {
                // pushReplacementNamed replaces the current route in the stack.
                // The back button won't return to HomeScreen from QuizScreen.
                Navigator.pushReplacementNamed(context, AppRoutes.quiz);
              },
            ),

            const SizedBox(height: 24),
            _buildCodeSnippetCard(
              '''// 1. Define routes in MaterialApp:
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (ctx) => HomeScreen(),
    '/dashboard': (ctx) => DashboardScreen(),
    '/course-detail': (ctx) => CourseDetailScreen(),
    '/quiz': (ctx) => QuizScreen(),
  },
);

// 2. Navigate using route name:
Navigator.pushNamed(context, '/dashboard');

// 3. Navigate with arguments:
Navigator.pushNamed(context, '/course-detail',
  arguments: {'title': 'Flutter Course'});

// 4. Replace current route:
Navigator.pushReplacementNamed(context, '/quiz');''',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConceptBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00695C), Color(0xFF4DB6AC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00695C).withOpacity(0.35),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.route, color: Colors.white, size: 28),
              SizedBox(width: 10),
              Text(
                'Experiment 4(b)',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Named Routes Navigation',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Defines a central route table in MaterialApp and '
            'navigates using string route names instead of widget constructors.',
            style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteTableCard() {
    const routes = [
      (name: '/', screen: 'HomeScreen', method: 'initialRoute'),
      (name: '/dashboard', screen: 'DashboardScreen', method: 'pushNamed'),
      (name: '/course-detail', screen: 'CourseDetailScreen', method: 'pushNamed + args'),
      (name: '/quiz', screen: 'QuizScreen', method: 'pushReplacementNamed'),
      (name: '/certificate', screen: 'CertificateScreen', method: 'popAndPushNamed'),
    ];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.table_chart, color: Color(0xFF00695C)),
                SizedBox(width: 8),
                Text(
                  'Registered Route Table',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(height: 20),
            ...routes.map((r) => _buildRouteRow(r.name, r.screen, r.method)),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteRow(String name, String screen, String method) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFF00695C).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              name,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                color: Color(0xFF00695C),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(screen,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              method,
              style: const TextStyle(fontSize: 10, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton({
    required BuildContext context,
    required String label,
    required String routeLabel,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: color.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: color)),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style: const TextStyle(
                            fontSize: 11, color: Colors.black54)),
                    const SizedBox(height: 3),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        routeLabel,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 11,
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                  size: 15, color: color.withOpacity(0.5)),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 2: DashboardScreen — Route: '/dashboard'
// ─────────────────────────────────────────────────────────────────────────────
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const _stats = [
    (label: 'Courses', value: '12', icon: Icons.menu_book),
    (label: 'Completed', value: '8', icon: Icons.check_circle),
    (label: 'Certificates', value: '5', icon: Icons.workspace_premium),
    (label: 'Hours', value: '96', icon: Icons.timer),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF00695C),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF0FAF8),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRouteChip('/dashboard', 'pushNamed()', const Color(0xFF00695C)),
            const SizedBox(height: 20),

            // ── Stats Grid ──────────────────────────────────────────────────
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.6,
              children: _stats
                  .map((s) => _buildStatCard(s.label, s.value, s.icon))
                  .toList(),
            ),

            const SizedBox(height: 20),

            // ── Navigate to CourseDetail with Arguments ──────────────────────
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1565C0).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.play_circle,
                      color: Color(0xFF1565C0), size: 28),
                ),
                title: const Text('Start Flutter Course',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text(
                    'Navigate to Course Detail with route arguments'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.courseDetail,
                    arguments: {
                      'title': 'Flutter & Dart Masterclass',
                      'instructor': 'Prof. Kavadi',
                      'duration': '48 Hours',
                      'level': 'Advanced',
                      'rating': 4.9,
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF00695C), size: 24),
            const SizedBox(height: 8),
            Text(value,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold)),
            Text(label,
                style:
                    const TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 3: CourseDetailScreen — Route: '/course-detail'
// ─────────────────────────────────────────────────────────────────────────────
class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ── Extract Route Arguments ─────────────────────────────────────────────
    // ModalRoute.of(context)!.settings.arguments retrieves the arguments
    // passed via Navigator.pushNamed(..., arguments: {...})
    final args = ModalRoute.of(context)!.settings.arguments;
    final Map<String, dynamic> courseData =
        (args is Map<String, dynamic>) ? args : {};

    final title = courseData['title'] as String? ?? 'Unknown Course';
    final instructor = courseData['instructor'] as String? ?? 'Unknown';
    final duration = courseData['duration'] as String? ?? 'N/A';
    final level = courseData['level'] as String? ?? 'N/A';
    final rating = (courseData['rating'] as num?)?.toDouble() ?? 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Detail',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF0F4FF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRouteChip(
                '/course-detail', 'pushNamed() + arguments', const Color(0xFF1565C0)),
            const SizedBox(height: 16),

            // ── Arguments Received Banner ────────────────────────────────────
            Card(
              color: const Color(0xFF1565C0).withOpacity(0.08),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                    color: const Color(0xFF1565C0).withOpacity(0.3)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '📦 Arguments Received via Route',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'ModalRoute.of(context)!.settings.arguments',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 11,
                        color: const Color(0xFF1565C0).withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ── Course Card ──────────────────────────────────────────────────
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.school,
                              color: Colors.white, size: 32),
                          const SizedBox(height: 10),
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'by $instructor',
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(Icons.timer, 'Duration', duration),
                    _buildDetailRow(Icons.bar_chart, 'Level', level),
                    _buildDetailRow(Icons.star, 'Rating', '$rating ⭐'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ── Take Quiz Button (popAndPushNamed) ───────────────────────────
            ElevatedButton.icon(
              onPressed: () {
                // popAndPushNamed: pops the current screen and immediately
                // pushes the new named route — efficient screen swap.
                Navigator.popAndPushNamed(context, AppRoutes.quiz);
              },
              icon: const Icon(Icons.quiz),
              label: const Text('Take Quiz (popAndPushNamed)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE65100),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),

            const SizedBox(height: 20),
            _buildCodeSnippetCard(
              '''// Read arguments in the destination screen:
final args = ModalRoute.of(context)!.settings.arguments;
final Map<String, dynamic> data = args as Map<String, dynamic>;
final String title = data['title'] as String;

// popAndPushNamed — pops current then pushes new:
Navigator.popAndPushNamed(context, '/quiz');''',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF1565C0)),
          const SizedBox(width: 10),
          Text('$label: ',
              style: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 14)),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 4: QuizScreen — Route: '/quiz'
// ─────────────────────────────────────────────────────────────────────────────
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestion = 0;
  int _score = 0;
  int? _selectedAnswer;

  static const _questions = [
    (
      question: 'Which method pushes a named route onto the stack?',
      options: [
        'Navigator.push()',
        'Navigator.pushNamed()',
        'Navigator.navigate()',
        'Navigator.open()',
      ],
      correct: 1,
    ),
    (
      question: 'How do you pass arguments with pushNamed()?',
      options: [
        'Via constructor params',
        'Via the arguments: parameter',
        'Via a static variable',
        'Not possible with named routes',
      ],
      correct: 1,
    ),
    (
      question: 'What does pushReplacementNamed() do?',
      options: [
        'Adds a new route to the stack',
        'Pops all routes and pushes new',
        'Replaces the current top route',
        'Pushes without animation',
      ],
      correct: 2,
    ),
  ];

  bool get _quizComplete => _currentQuestion >= _questions.length;

  void _selectAnswer(int index) {
    setState(() => _selectedAnswer = index);
  }

  void _nextQuestion() {
    if (_selectedAnswer == _questions[_currentQuestion].correct) {
      _score++;
    }
    setState(() {
      _currentQuestion++;
      _selectedAnswer = null;
    });
    if (_quizComplete) {
      Navigator.pushNamed(
        context,
        AppRoutes.certificate,
        arguments: {'score': _score, 'total': _questions.length},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Quiz', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFE65100),
        foregroundColor: Colors.white,
        centerTitle: true,
        // No back button since this was pushed via pushReplacementNamed
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.home,
              (route) => false, // Remove all routes
            ),
            child: const Text('Exit', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFFF3E0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRouteChip(
                '/quiz', 'pushReplacementNamed()', const Color(0xFFE65100)),
            const SizedBox(height: 16),

            if (!_quizComplete) ...[
              // Progress bar
              LinearProgressIndicator(
                value: _currentQuestion / _questions.length,
                backgroundColor: Colors.orange.shade100,
                color: const Color(0xFFE65100),
                minHeight: 6,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 8),
              Text(
                'Question ${_currentQuestion + 1} of ${_questions.length}',
                style: const TextStyle(color: Colors.black54, fontSize: 13),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 16),

              // Question Card
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    _questions[_currentQuestion].question,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold, height: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Answer Options
              ..._questions[_currentQuestion].options.asMap().entries.map(
                    (entry) => _buildOptionTile(entry.key, entry.value),
                  ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _selectedAnswer != null ? _nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE65100),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledBackgroundColor: Colors.orange.shade200,
                ),
                child: Text(
                  _currentQuestion < _questions.length - 1
                      ? 'Next Question'
                      : 'Submit Quiz',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ] else ...[
              const Center(child: CircularProgressIndicator()),
              const SizedBox(height: 12),
              const Center(child: Text('Loading results...')),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(int index, String option) {
    final isSelected = _selectedAnswer == index;
    return GestureDetector(
      onTap: () => _selectAnswer(index),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFE65100).withOpacity(0.12)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFE65100)
                : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFFE65100)
                    : Colors.grey.shade200,
              ),
              child: Center(
                child: Text(
                  String.fromCharCode(65 + index), // A, B, C, D
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                  color:
                      isSelected ? const Color(0xFFE65100) : Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 5: CertificateScreen — Route: '/certificate'
// ─────────────────────────────────────────────────────────────────────────────
class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final Map<String, dynamic> data =
        (args is Map<String, dynamic>) ? args : {};
    final int score = (data['score'] as int?) ?? 0;
    final int total = (data['total'] as int?) ?? 3;
    final bool passed = score >= (total * 0.6).ceil();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Certificate',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF6A1B9A),
        foregroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color(0xFFF5F0FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRouteChip(
                '/certificate', 'pushNamed() from Quiz', const Color(0xFF6A1B9A)),
            const SizedBox(height: 20),

            // Certificate Card
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: passed
                        ? [const Color(0xFF6A1B9A), const Color(0xFFAB47BC)]
                        : [Colors.grey.shade600, Colors.grey.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Icon(
                      passed
                          ? Icons.workspace_premium
                          : Icons.sentiment_dissatisfied,
                      color: Colors.white,
                      size: 64,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      passed ? '🎉 Congratulations!' : 'Better Luck Next Time',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      passed
                          ? 'You have passed the quiz!'
                          : 'You did not meet the passing score.',
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        'Score: $score / $total',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // pushNamedAndRemoveUntil — go back to Home and clear all routes
            ElevatedButton.icon(
              onPressed: () {
                // pushNamedAndRemoveUntil navigates to a route and removes
                // all routes below it that match the predicate.
                // (route) => false removes ALL existing routes.
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                  (route) => false,
                );
              },
              icon: const Icon(Icons.home),
              label: const Text('Back to Home (Clear Stack)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A1B9A),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),

            const SizedBox(height: 20),
            _buildCodeSnippetCard(
              '''// Navigate and clear entire stack:
Navigator.pushNamedAndRemoveUntil(
  context,
  '/home',
  (route) => false, // removes ALL previous routes
);

// Navigate and keep only specific routes:
Navigator.pushNamedAndRemoveUntil(
  context,
  '/dashboard',
  ModalRoute.withName('/'), // keep only root
);''',
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 6: NotFoundScreen — onUnknownRoute fallback
// ─────────────────────────────────────────────────────────────────────────────
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 - Not Found'),
        backgroundColor: Colors.red.shade700,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            const Text('Route Not Found',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('The requested route is not registered.',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SHARED HELPERS
// ─────────────────────────────────────────────────────────────────────────────

Widget _buildRouteChip(String route, String method, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    decoration: BoxDecoration(
      color: color.withOpacity(0.08),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: color.withOpacity(0.35)),
    ),
    child: Row(
      children: [
        Icon(Icons.route, color: color, size: 16),
        const SizedBox(width: 8),
        Text(
          route,
          style: TextStyle(
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color: color,
            fontSize: 13,
          ),
        ),
        const SizedBox(width: 8),
        const Text('→', style: TextStyle(color: Colors.black38)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            method,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ),
      ],
    ),
  );
}

Widget _buildCodeSnippetCard(String code) {
  return Card(
    color: const Color(0xFF1E1E2E),
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.code, color: Colors.white54, size: 16),
              SizedBox(width: 6),
              Text('Code Snippet',
                  style: TextStyle(color: Colors.white54, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            code,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              color: Color(0xFF89DDFF),
              height: 1.6,
            ),
          ),
        ],
      ),
    ),
  );
}
