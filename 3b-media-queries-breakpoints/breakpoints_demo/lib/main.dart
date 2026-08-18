import 'package:flutter/material.dart';

void main() {
  runApp(const BreakpointsDemoApp());
}

/// Root Application Widget for Experiment 3(b)
class BreakpointsDemoApp extends StatelessWidget {
  const BreakpointsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 3(b): Media Queries & Breakpoints',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6200EE),
          brightness: Brightness.light,
        ),
      ),
      home: const BreakpointAdaptiveScreen(),
    );
  }
}

/// Main Screen demonstrating MediaQuery and Breakpoint Evaluation
class BreakpointAdaptiveScreen extends StatelessWidget {
  const BreakpointAdaptiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Explicit MediaQuery Data Extraction
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size screenSize = mediaQuery.size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    final Orientation orientation = mediaQuery.orientation;
    final double devicePixelRatio = mediaQuery.devicePixelRatio;

    // 2. Breakpoint Evaluation Logic
    // Mobile:  width < 600
    // Tablet:  600 <= width < 1024
    // Desktop: width >= 1024
    final String currentLayoutName;
    final Color layoutThemeColor;
    final IconData layoutIcon;
    final int gridColumns;
    final double paddingValue;

    if (screenWidth >= 1024) {
      currentLayoutName = 'Desktop';
      layoutThemeColor = const Color(0xFF1B5E20); // Dark Green
      layoutIcon = Icons.desktop_windows;
      gridColumns = 4;
      paddingValue = 24.0;
    } else if (screenWidth >= 600) {
      currentLayoutName = 'Tablet';
      layoutThemeColor = const Color(0xFFE65100); // Deep Orange
      layoutIcon = Icons.tablet_mac;
      gridColumns = 2;
      paddingValue = 18.0;
    } else {
      currentLayoutName = 'Mobile';
      layoutThemeColor = const Color(0xFF6200EE); // Purple
      layoutIcon = Icons.smartphone;
      gridColumns = 1;
      paddingValue = 12.0;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Experiment 3(b): MediaQuery Demo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: layoutThemeColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(paddingValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- SECTION 1: REQUIRED CURRENT LAYOUT BANNER ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: layoutThemeColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: layoutThemeColor.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white24,
                    child: Icon(layoutIcon, size: 36, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Active Layout Breakpoint',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // Prominently displays "Current Layout: Mobile / Tablet / Desktop"
                        Text(
                          'Current Layout: $currentLayoutName',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // --- SECTION 2: MEDIAQUERY METRICS CARD ---
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
                    const Row(
                      children: [
                        Icon(Icons.perm_device_information, color: Colors.black70),
                        SizedBox(width: 8),
                        Text(
                          'MediaQuery Environment Telemetry',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 20),
                    Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      children: [
                        _buildMetricPill('Screen Width', '${screenWidth.toStringAsFixed(1)} px'),
                        _buildMetricPill('Screen Height', '${screenHeight.toStringAsFixed(1)} px'),
                        _buildMetricPill(
                          'Orientation',
                          orientation == Orientation.portrait ? 'Portrait 📱' : 'Landscape 🔄',
                        ),
                        _buildMetricPill('Device Pixel Ratio', '${devicePixelRatio.toStringAsFixed(2)}x'),
                        _buildMetricPill('Active Grid Columns', '$gridColumns Columns'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // --- SECTION 3: BREAKPOINTS EXPLANATION TABLE ---
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
                    const Text(
                      'Defined Breakpoint Threshold Rules',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    _buildRuleRow('Mobile', 'width < 600 px', currentLayoutName == 'Mobile'),
                    _buildRuleRow('Tablet', '600 px <= width < 1024 px', currentLayoutName == 'Tablet'),
                    _buildRuleRow('Desktop', 'width >= 1024 px', currentLayoutName == 'Desktop'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // --- SECTION 4: DYNAMIC GRID OF CARDS (ADAPTS COLUMN COUNT) ---
            Text(
              'Dynamic Product Catalog ($gridColumns Columns for $currentLayoutName)',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridColumns,
                crossAxisSpacing: paddingValue,
                mainAxisSpacing: paddingValue,
                childAspectRatio: currentLayoutName == 'Mobile'
                    ? 2.5
                    : (currentLayoutName == 'Tablet' ? 1.4 : 1.2),
              ),
              itemBuilder: (context, index) {
                return _buildCatalogCard(
                  title: 'Lab Project Module #${index + 1}',
                  subtitle: 'Adaptive layout card rendered inside a $gridColumns-column grid.',
                  icon: Icons.developer_board,
                  color: layoutThemeColor,
                  isMobile: currentLayoutName == 'Mobile',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricPill(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRuleRow(String label, String rule, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isActive ? Colors.purple.shade50 : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isActive ? Colors.purple : Colors.grey.shade200,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                isActive ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isActive ? Colors.purple : Colors.grey,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  color: isActive ? Colors.purple.shade900 : Colors.black87,
                ),
              ),
            ],
          ),
          Text(
            rule,
            style: TextStyle(
              fontFamily: 'monospace',
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.purple.shade900 : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCatalogCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required bool isMobile,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: isMobile
            ? Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, color: color, size: 28),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(fontSize: 11, color: Colors.grey),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, color: color, size: 32),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
      ),
    );
  }
}
