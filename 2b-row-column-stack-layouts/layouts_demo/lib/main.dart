import 'package:flutter/material.dart';

void main() {
  runApp(const LayoutsDemoApp());
}

/// Root Application Widget for Experiment 2(b)
class LayoutsDemoApp extends StatelessWidget {
  const LayoutsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 2(b): Flutter Layouts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0061A4),
          brightness: Brightness.light,
        ),
      ),
      home: const LayoutsHomeScreen(),
    );
  }
}

/// Main Screen with Tabbed / Sectioned Layout Exploration
class LayoutsHomeScreen extends StatefulWidget {
  const LayoutsHomeScreen({super.key});

  @override
  State<LayoutsHomeScreen> createState() => _LayoutsHomeScreenState();
}

class _LayoutsHomeScreenState extends State<LayoutsHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Alignment Selectors for Interactive Demonstration
  MainAxisAlignment _rowMainAlign = MainAxisAlignment.spaceEvenly;
  CrossAxisAlignment _rowCrossAlign = CrossAxisAlignment.center;

  MainAxisAlignment _colMainAlign = MainAxisAlignment.spaceAround;
  CrossAxisAlignment _colCrossAlign = CrossAxisAlignment.center;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Experiment 2(b): Flutter Layouts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0061A4),
        foregroundColor: Colors.white,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(icon: Icon(Icons.view_column), text: 'Row Layout'),
            Tab(icon: Icon(Icons.view_stream), text: 'Column Layout'),
            Tab(icon: Icon(Icons.layers), text: 'Stack Layout'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildRowLayoutSection(),
          _buildColumnLayoutSection(),
          _buildStackLayoutSection(),
        ],
      ),
    );
  }

  // ===========================================================================
  // PART A: ROW LAYOUT SECTION
  // ===========================================================================
  Widget _buildRowLayoutSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderCard(
            title: 'Part A: Row Layout',
            description:
                'Arranges child widgets horizontally in a single row. Demonstrates horizontal mainAxis and vertical crossAxis alignments.',
            color: Colors.blue.shade700,
          ),
          const SizedBox(height: 16),

          // Interactive Controls Card
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'mainAxisAlignment:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<MainAxisAlignment>(
                        value: _rowMainAlign,
                        onChanged: (val) {
                          if (val != null) setState(() => _rowMainAlign = val);
                        },
                        items: MainAxisAlignment.values.map((align) {
                          return DropdownMenuItem(
                            value: align,
                            child: Text(align.name),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'crossAxisAlignment:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<CrossAxisAlignment>(
                        value: _rowCrossAlign,
                        onChanged: (val) {
                          if (val != null) setState(() => _rowCrossAlign = val);
                        },
                        items: [
                          CrossAxisAlignment.start,
                          CrossAxisAlignment.center,
                          CrossAxisAlignment.end,
                          CrossAxisAlignment.stretch,
                        ].map((align) {
                          return DropdownMenuItem(
                            value: align,
                            child: Text(align.name),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Row Demonstration Container
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.shade300, width: 2),
            ),
            child: Row(
              mainAxisAlignment: _rowMainAlign,
              crossAxisAlignment: _rowCrossAlign,
              children: [
                _buildDemoBox('Item 1', Colors.blue.shade600, 60, 60),
                _buildDemoBox('Item 2', Colors.blue.shade800, 70, 70),
                _buildDemoBox('Item 3', Colors.indigo.shade600, 50, 50),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Code snippet card
          _buildInfoBox(
            'Row Concept:',
            '• Main Axis: Horizontal (Left ↔ Right)\n'
            '• Cross Axis: Vertical (Top ↕ Bottom)\n'
            '• Spacing handled dynamically using MainAxisAlignment.',
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // PART B: COLUMN LAYOUT SECTION
  // ===========================================================================
  Widget _buildColumnLayoutSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderCard(
            title: 'Part B: Column Layout',
            description:
                'Arranges child widgets vertically in a single column. Demonstrates vertical mainAxis and horizontal crossAxis alignments.',
            color: Colors.teal.shade700,
          ),
          const SizedBox(height: 16),

          // Interactive Controls Card
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'mainAxisAlignment:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<MainAxisAlignment>(
                        value: _colMainAlign,
                        onChanged: (val) {
                          if (val != null) setState(() => _colMainAlign = val);
                        },
                        items: MainAxisAlignment.values.map((align) {
                          return DropdownMenuItem(
                            value: align,
                            child: Text(align.name),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'crossAxisAlignment:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<CrossAxisAlignment>(
                        value: _colCrossAlign,
                        onChanged: (val) {
                          if (val != null) setState(() => _colCrossAlign = val);
                        },
                        items: [
                          CrossAxisAlignment.start,
                          CrossAxisAlignment.center,
                          CrossAxisAlignment.end,
                          CrossAxisAlignment.stretch,
                        ].map((align) {
                          return DropdownMenuItem(
                            value: align,
                            child: Text(align.name),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Column Demonstration Container
          Container(
            height: 280,
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.teal.shade300, width: 2),
            ),
            child: Column(
              mainAxisAlignment: _colMainAlign,
              crossAxisAlignment: _colCrossAlign,
              children: [
                _buildDemoBox('Widget A', Colors.teal.shade600, 140, 50),
                _buildDemoBox('Widget B', Colors.teal.shade800, 180, 50),
                _buildDemoBox('Widget C', Colors.green.shade700, 120, 50),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _buildInfoBox(
            'Column Concept:',
            '• Main Axis: Vertical (Top ↕ Bottom)\n'
            '• Cross Axis: Horizontal (Left ↔ Right)\n'
            '• Prevents overflow using scrollable containers when required.',
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // PART C: STACK & POSITIONED LAYOUT SECTION
  // ===========================================================================
  Widget _buildStackLayoutSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderCard(
            title: 'Part C: Stack & Positioned Layout',
            description:
                'Overlays widgets on top of each other along the Z-axis. Uses Positioned widgets to place elements precisely within the stack container.',
            color: Colors.deepPurple.shade700,
          ),
          const SizedBox(height: 20),

          // Stack 1: Overlapping User Profile Card Showcase
          const Text(
            '1. Overlapping User Profile Card (Stack + Positioned)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          SizedBox(
            height: 220,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Base Card Container
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: const Color(0xFFF3EDF7),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                      child: Column(
                        children: const [
                          Text(
                            'Samantha Reed',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Senior Flutter Architect',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Expert in mobile cross-platform state management & custom UI design.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Top Overlapping Avatar Circle (Positioned)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xFF0061A4),
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                // Top Right Positioned Badge
                Positioned(
                  top: 48,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: Colors.white, size: 8),
                        SizedBox(width: 4),
                        Text(
                          'ONLINE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Stack 2: Layered Container Badges
          const Text(
            '2. Layered Stack Shapes & Badges',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          Center(
            child: SizedBox(
              width: 300,
              height: 180,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Layer 1: Bottom Outer Box
                  Container(
                    width: 280,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  // Layer 2: Middle Box
                  Container(
                    width: 220,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade500,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 6),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Layer 2 (Middle)',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Layer 3: Positioned Top-Left Floating Tag
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 4),
                        ],
                      ),
                      child: const Icon(Icons.star, color: Colors.white),
                    ),
                  ),
                  // Layer 4: Positioned Bottom-Right Notification Badge
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Stack Z-Index #4',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          _buildInfoBox(
            'Stack Concept:',
            '• Controls 3D Z-index layering order (First child = Bottom layer).\n'
            '• Positioned(top, bottom, left, right) places elements precisely.\n'
            '• Ideal for badges, floating avatars, banners, and dynamic overlays.',
          ),
        ],
      ),
    );
  }

  // --- HELPER WIDGET BUILDERS ---

  Widget _buildHeaderCard({
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(color: Colors.white90, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoBox(
    String text,
    Color color,
    double width,
    double height,
  ) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, String content) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: const TextStyle(fontSize: 13, color: Colors.black70),
          ),
        ],
      ),
    );
  }
}
