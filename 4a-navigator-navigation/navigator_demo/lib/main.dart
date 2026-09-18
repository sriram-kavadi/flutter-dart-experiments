import 'package:flutter/material.dart';

// ============================================================
// Experiment 4(a): Navigation Between Screens Using Navigator
// ============================================================
// Demonstrates Navigator.push(), Navigator.pop(), and
// passing data between screens via constructor arguments.
// ============================================================

void main() {
  runApp(const NavigatorDemoApp());
}

/// Root Application Widget for Experiment 4(a)
class NavigatorDemoApp extends StatelessWidget {
  const NavigatorDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 4(a): Navigator Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0), // deep blue
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      // No named routes — navigation handled imperatively via Navigator.push()
      home: const HomeScreen(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 1: HomeScreen
// ─────────────────────────────────────────────────────────────────────────────

/// The first screen shown when the app launches.
/// Uses Navigator.push() to navigate to subsequent screens.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        title: const Text(
          'Experiment 4(a): Navigator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1565C0),
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

            // ── Navigator API Info Card ─────────────────────────────────────
            _buildApiInfoCard(),
            const SizedBox(height: 24),

            // ── Navigation Buttons ──────────────────────────────────────────
            const Text(
              'Navigate to Different Screens',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _buildNavButton(
              context: context,
              label: 'Go to Profile Screen',
              subtitle: 'Push a screen with user data',
              icon: Icons.person,
              color: const Color(0xFF1565C0),
              onTap: () {
                // Navigator.push() pushes a new route onto the navigation stack.
                // The new screen appears on top of the current one.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(
                      userName: 'Sriram Kavadi',
                      userEmail: 'sriram@example.com',
                      userRole: 'Flutter Developer',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),

            _buildNavButton(
              context: context,
              label: 'Go to Settings Screen',
              subtitle: 'Push a screen with custom transition',
              icon: Icons.settings,
              color: const Color(0xFF2E7D32),
              onTap: () {
                Navigator.push(
                  context,
                  // Using a custom PageRouteBuilder for a slide transition
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const SettingsScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      final tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 12),

            _buildNavButton(
              context: context,
              label: 'Go to Results Screen',
              subtitle: 'Push and receive data back with Navigator.pop()',
              icon: Icons.bar_chart,
              color: const Color(0xFF6A1B9A),
              onTap: () async {
                // Navigator.push() can return data from the popped screen.
                final String? result = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultsScreen(),
                  ),
                );
                // Show what data came back from ResultsScreen
                if (result != null && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Returned from Results: "$result"'),
                      backgroundColor: const Color(0xFF6A1B9A),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            ),

            const SizedBox(height: 24),

            // ── Navigation Stack Explanation ────────────────────────────────
            _buildStackExplanationCard(),
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
          colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1565C0).withOpacity(0.35),
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
              Icon(Icons.navigation, color: Colors.white, size: 28),
              SizedBox(width: 10),
              Text(
                'Experiment 4(a)',
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
            'Navigator-based Screen Navigation',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Uses Navigator.push() and Navigator.pop() to move '
            'between screens imperatively via a route stack.',
            style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildApiInfoCard() {
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
                Icon(Icons.code, color: Color(0xFF1565C0)),
                SizedBox(width: 8),
                Text(
                  'Key Navigator APIs Used',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(height: 20),
            _buildApiRow('Navigator.push()', 'Pushes a new route onto the stack'),
            _buildApiRow('Navigator.pop()', 'Pops the top route off the stack'),
            _buildApiRow('MaterialPageRoute', 'Standard Material slide transition'),
            _buildApiRow('PageRouteBuilder', 'Custom animated route transition'),
            _buildApiRow('Navigator.push<T>()', 'Returns data from popped screen'),
          ],
        ),
      ),
    );
  }

  Widget _buildApiRow(String api, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFF1565C0).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              api,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                color: Color(0xFF1565C0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton({
    required BuildContext context,
    required String label,
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
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: color.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 26),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: color.withOpacity(0.6)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStackExplanationCard() {
    return Card(
      color: const Color(0xFFFFF8E1),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFFFCA28), width: 1.5),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.layers, color: Color(0xFFF57F17)),
                SizedBox(width: 8),
                Text(
                  'Navigation Stack Concept',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFFF57F17),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Flutter uses a stack-based navigation model:\n'
              '• push() → adds a screen on top of the stack\n'
              '• pop() → removes the top screen from the stack\n'
              '• The first screen (HomeScreen) is always at the bottom',
              style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 2: ProfileScreen
// ─────────────────────────────────────────────────────────────────────────────

/// Demonstrates pushing a screen with data passed as constructor arguments.
class ProfileScreen extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userRole;

  const ProfileScreen({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userRole,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        centerTitle: true,
        // The AppBar's leading back arrow calls Navigator.pop() automatically.
        // We can also call Navigator.pop(context) programmatically.
      ),
      backgroundColor: const Color(0xFFF0F4FF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Route Info ──────────────────────────────────────────────────
            _buildRouteInfoBanner(
              'Pushed via Navigator.push()',
              'MaterialPageRoute(builder: (ctx) => ProfileScreen(...))',
              const Color(0xFF1565C0),
            ),
            const SizedBox(height: 20),

            // ── User Card ───────────────────────────────────────────────────
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      backgroundColor: Color(0xFF1565C0),
                      child:
                          Icon(Icons.person, size: 52, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      userName,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      userRole,
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xFF1565C0)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      userEmail,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Go Back (Navigator.pop)'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1565C0),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            _buildCodeSnippetCard(
              '''// Pushing with data using constructor arguments:
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ProfileScreen(
      userName: "Sriram Kavadi",
      userEmail: "sriram@example.com",
      userRole: "Flutter Developer",
    ),
  ),
);''',
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 3: SettingsScreen
// ─────────────────────────────────────────────────────────────────────────────

/// Demonstrates a custom PageRouteBuilder slide transition.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _analyticsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF1F8F1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRouteInfoBanner(
              'Pushed via PageRouteBuilder (Slide Transition)',
              'Custom transitionsBuilder with SlideTransition widget',
              const Color(0xFF2E7D32),
            ),
            const SizedBox(height: 20),

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Column(
                children: [
                  _buildSettingsTile(
                    icon: Icons.notifications_active,
                    label: 'Push Notifications',
                    subtitle: 'Receive app alerts and reminders',
                    value: _notificationsEnabled,
                    onChanged: (v) =>
                        setState(() => _notificationsEnabled = v),
                    color: const Color(0xFF2E7D32),
                  ),
                  const Divider(height: 1, indent: 56),
                  _buildSettingsTile(
                    icon: Icons.dark_mode,
                    label: 'Dark Mode',
                    subtitle: 'Switch to dark theme appearance',
                    value: _darkModeEnabled,
                    onChanged: (v) => setState(() => _darkModeEnabled = v),
                    color: const Color(0xFF2E7D32),
                  ),
                  const Divider(height: 1, indent: 56),
                  _buildSettingsTile(
                    icon: Icons.bar_chart,
                    label: 'Usage Analytics',
                    subtitle: 'Allow anonymous app usage data',
                    value: _analyticsEnabled,
                    onChanged: (v) =>
                        setState(() => _analyticsEnabled = v),
                    color: const Color(0xFF2E7D32),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Go Back (Navigator.pop)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            _buildCodeSnippetCard(
              '''// Custom transition using PageRouteBuilder:
Navigator.push(
  context,
  PageRouteBuilder(
    pageBuilder: (ctx, anim, secAnim) => SettingsScreen(),
    transitionsBuilder: (ctx, anim, secAnim, child) {
      final tween = Tween(
        begin: Offset(1.0, 0.0), end: Offset.zero)
        .chain(CurveTween(curve: Curves.easeInOut));
      return SlideTransition(
        position: anim.drive(tween), child: child);
    },
  ),
);''',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String label,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required Color color,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color, size: 22),
      ),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: Switch(value: value, onChanged: onChanged, activeColor: color),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 4: ResultsScreen
// ─────────────────────────────────────────────────────────────────────────────

/// Demonstrates Navigator.pop() returning data back to the caller.
class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  String _selectedResult = 'Experiment Passed';

  static const _options = [
    'Experiment Passed',
    'Experiment Failed',
    'Needs Revision',
    'Pending Review',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results Screen',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF6A1B9A),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF5F0FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRouteInfoBanner(
              'Returns data back via Navigator.pop(result)',
              'Caller awaits with: final result = await Navigator.push<String>(...)',
              const Color(0xFF6A1B9A),
            ),
            const SizedBox(height: 20),

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select a Result to Return:',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    ..._options.map((option) => RadioListTile<String>(
                          title: Text(option),
                          value: option,
                          groupValue: _selectedResult,
                          activeColor: const Color(0xFF6A1B9A),
                          onChanged: (v) {
                            if (v != null) setState(() => _selectedResult = v);
                          },
                        )),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton.icon(
              // Navigator.pop(context, data) sends data back to the push() caller
              onPressed: () => Navigator.pop(context, _selectedResult),
              icon: const Icon(Icons.send),
              label: const Text('Return Result & Go Back'),
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
              '''// Receiving data back from a pushed screen:
final String? result = await Navigator.push<String>(
  context,
  MaterialPageRoute(builder: (ctx) => ResultsScreen()),
);

// Pop with return value from ResultsScreen:
Navigator.pop(context, "Experiment Passed");''',
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SHARED HELPER WIDGETS
// ─────────────────────────────────────────────────────────────────────────────

Widget _buildRouteInfoBanner(String title, String code, Color color) {
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: color.withOpacity(0.08),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: color.withOpacity(0.4)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.route, color: color, size: 18),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: color, fontSize: 13),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            code,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 11,
              color: Colors.black87,
            ),
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
              Text(
                'Code Snippet',
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
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
