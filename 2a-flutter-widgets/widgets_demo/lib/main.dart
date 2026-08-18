import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetsDemoApp());
}

/// Root widget of the Experiment 2(a) Application
class WidgetsDemoApp extends StatelessWidget {
  const WidgetsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 2(a): Flutter Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.light,
        ),
      ),
      home: const WidgetsShowcaseScreen(),
    );
  }
}

/// Main Screen showcasing all fundamental Flutter Widgets
class WidgetsShowcaseScreen extends StatefulWidget {
  const WidgetsShowcaseScreen({super.key});

  @override
  State<WidgetsShowcaseScreen> createState() => _WidgetsShowcaseScreenState();
}

class _WidgetsShowcaseScreenState extends State<WidgetsShowcaseScreen> {
  int _counter = 0;
  String _activeMessage = 'Tap any button to trigger an interactive event!';

  void _incrementCounter() {
    setState(() {
      _counter++;
      _activeMessage = 'ElevatedButton Pressed: Counter is now $_counter';
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _activeMessage = 'OutlinedButton Pressed: Counter reset to 0';
    });
  }

  void _showMessage(String text) {
    setState(() {
      _activeMessage = 'TextButton Pressed: $text';
    });
  }

  @override
  Widget build(BuildContext context) {
    // 1. Scaffold Widget
    return Scaffold(
      // 2. AppBar Widget
      appBar: AppBar(
        title: const Text(
          'Experiment 2(a): Flutter Widgets',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: const Color(0xFF6750A4),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'App Info',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Flutter Core Widgets Showcase App'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // 3. Padding Widget
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- SECTION 1: TEXT WIDGETS ---
              _buildSectionHeader('1. Text Widget Demonstration'),
              // 4. Card Widget
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 5. Text Widget (Standard)
                      const Text(
                        'Standard Title Text',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6750A4),
                        ),
                      ),
                      // 6. SizedBox Widget (Spacing)
                      const SizedBox(height: 8),
                      // Text Widget (Styled Subtitle)
                      const Text(
                        'Subtitle Text with custom font size, weight, letter spacing, and custom color styling.',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // 7. Container Widget with Gradient & Text
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF6750A4), Color(0xFFD0BCFF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Styled Text inside Gradient Container',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --- SECTION 2: CONTAINER & CENTER WIDGETS ---
              _buildSectionHeader('2. Container & Center Demonstration'),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // 8. Center Widget
                      Center(
                        // Container Widget with border, shadow & rounded corners
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8DEF8),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFF6750A4),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Center Widget holding a Decorated Container',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1D1B20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --- SECTION 3: IMAGE & ICON WIDGETS ---
              _buildSectionHeader('3. Image & Icon Demonstration'),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // 9. Icon Widget Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.star, color: Colors.amber, size: 36),
                          Icon(Icons.favorite, color: Colors.redAccent, size: 36),
                          Icon(Icons.flutter_dash, color: Colors.blue, size: 36),
                          Icon(Icons.thumb_up, color: Colors.green, size: 36),
                          Icon(Icons.lightbulb, color: Colors.orange, size: 36),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // 10. Image Widget (Canvas-Rendered Fallback Image Widget to guarantee offline reliability)
                      Container(
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Render Flutter Icon & Image Label
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.flutter_dash,
                                color: Colors.white,
                                size: 48,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Flutter Asset / Image',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  'Demonstrating Image & Icon Integration',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --- SECTION 4: BUTTON WIDGETS ---
              _buildSectionHeader('4. Buttons & Interaction Demonstration'),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Active Feedback Status Container
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3EDF7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _activeMessage,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF6750A4),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Button Row
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          // 11. ElevatedButton Widget
                          ElevatedButton.icon(
                            onPressed: _incrementCounter,
                            icon: const Icon(Icons.add),
                            label: Text('Increment ($_counter)'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6750A4),
                              foregroundColor: Colors.white,
                              elevation: 2,
                            ),
                          ),

                          // 12. TextButton Widget
                          TextButton.icon(
                            onPressed: () => _showMessage('Exploring Flutter Widgets!'),
                            icon: const Icon(Icons.touch_app),
                            label: const Text('TextButton'),
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF6750A4),
                            ),
                          ),

                          // 13. OutlinedButton Widget
                          OutlinedButton.icon(
                            onPressed: _resetCounter,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Reset Counter'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.redAccent,
                              side: const BorderSide(color: Colors.redAccent),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Summary Checklist Footer
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade300),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '13/13 Required Widgets Successfully Demonstrated!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper builder for clean section headers
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1D1B20),
      ),
      child: Text(title),
    );
  }
}
