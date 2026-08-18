import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveUiApp());
}

/// Root Application Widget for Experiment 3(a)
class ResponsiveUiApp extends StatelessWidget {
  const ResponsiveUiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 3(a): Responsive UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F52BA),
          brightness: Brightness.light,
        ),
      ),
      home: const ResponsiveDashboardScreen(),
    );
  }
}

/// Main Screen utilizing LayoutBuilder to adapt UI across Mobile, Tablet, and Desktop
class ResponsiveDashboardScreen extends StatefulWidget {
  const ResponsiveDashboardScreen({super.key});

  @override
  State<ResponsiveDashboardScreen> createState() =>
      _ResponsiveDashboardScreenState();
}

class _ResponsiveDashboardScreenState extends State<ResponsiveDashboardScreen> {
  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Experiment 3(a): Responsive Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: const Color(0xFF0F52BA),
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          const CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 12),
        ],
      ),
      // 1. LayoutBuilder Widget dynamically inspecting parent constraints
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth = constraints.maxWidth;

          // Responsive Desktop Layout (width >= 1024)
          if (maxWidth >= 1024) {
            return Row(
              children: [
                // Persistent Sidebar Navigation Drawer for Desktop
                _buildDesktopSidebar(),
                // Main Content Pane using Expanded Widget
                Expanded(
                  child: _buildDashboardContent(
                    maxWidth: maxWidth,
                    layoutType: 'Desktop (3-Pane Layout)',
                    gridColumns: 4,
                  ),
                ),
              ],
            );
          }
          // Responsive Tablet Layout (600 <= width < 1024)
          else if (maxWidth >= 600) {
            return Row(
              children: [
                // Compact Navigation Rail for Tablet
                _buildTabletNavRail(),
                // Main Content Pane using Expanded Widget
                Expanded(
                  child: _buildDashboardContent(
                    maxWidth: maxWidth,
                    layoutType: 'Tablet (2-Column Grid)',
                    gridColumns: 2,
                  ),
                ),
              ],
            );
          }
          // Responsive Mobile Layout (width < 600)
          else {
            return _buildDashboardContent(
              maxWidth: maxWidth,
              layoutType: 'Mobile (Single Column)',
              gridColumns: 1,
            );
          }
        },
      ),
      // Mobile Bottom Navigation Bar (rendered only for small screens)
      bottomNavigationBar: MediaQuery.of(context).size.width < 600
          ? BottomNavigationBar(
              currentIndex: _selectedNavIndex,
              onTap: (index) => setState(() => _selectedNavIndex = index),
              selectedItemColor: const Color(0xFF0F52BA),
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Overview',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.analytics),
                  label: 'Analytics',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            )
          : null,
    );
  }

  // --- DESKTOP SIDEBAR NAVIGATION ---
  Widget _buildDesktopSidebar() {
    return Container(
      width: 240,
      color: const Color(0xFFF0F4F9),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: const [
                Icon(Icons.dashboard_customize, color: Color(0xFF0F52BA)),
                SizedBox(width: 12),
                Text(
                  'Enterprise Portal',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          const Divider(),
          _buildSidebarTile(Icons.space_dashboard, 'Dashboard', true),
          _buildSidebarTile(Icons.bar_chart, 'Analytics', false),
          _buildSidebarTile(Icons.people, 'Customers', false),
          _buildSidebarTile(Icons.receipt_long, 'Transactions', false),
          _buildSidebarTile(Icons.settings, 'System Settings', false),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'LayoutBuilder Mode\nDesktop Viewport',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarTile(IconData icon, String title, bool isSelected) {
    return ListTile(
      leading: Icon(icon, color: isSelected ? const Color(0xFF0F52BA) : Colors.black54),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? const Color(0xFF0F52BA) : Colors.black87,
        ),
      ),
      selected: isSelected,
      selectedTileColor: const Color(0xFFD6E4FF),
      onTap: () {},
    );
  }

  // --- TABLET NAVIGATION RAIL ---
  Widget _buildTabletNavRail() {
    return NavigationRail(
      selectedIndex: _selectedNavIndex,
      onDestinationSelected: (index) => setState(() => _selectedNavIndex = index),
      labelType: NavigationRailLabelType.selected,
      selectedIconTheme: const IconThemeData(color: Color(0xFF0F52BA)),
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.dashboard_outlined),
          selectedIcon: Icon(Icons.dashboard),
          label: Text('Overview'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.analytics_outlined),
          selectedIcon: Icon(Icons.analytics),
          label: Text('Analytics'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: Text('Settings'),
        ),
      ],
    );
  }

  // --- MAIN DASHBOARD CONTENT (ADAPTS SPACING & COLUMNS) ---
  Widget _buildDashboardContent({
    required double maxWidth,
    required String layoutType,
    required int gridColumns,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 2. Active Screen Width Banner (Visibly adapts per viewport)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F52BA), Color(0xFF4180EC)],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Active Mode: $layoutType',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Viewport Constrained Width: ${maxWidth.toStringAsFixed(1)} px | Grid Columns: $gridColumns',
                  style: const TextStyle(color: Colors.white90, fontSize: 13),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Key Performance Indicators (KPIs)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // 3. Flexible / Responsive Grid for Metric Cards
          LayoutBuilder(
            builder: (context, gridConstraints) {
              return GridView.count(
                crossAxisCount: gridColumns,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: maxWidth < 600 ? 2.2 : 1.6,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _MetricCard(
                    title: 'Total Revenue',
                    value: '\$124,500.00',
                    change: '+14.2%',
                    isPositive: true,
                    icon: Icons.attach_money,
                    color: Colors.green,
                  ),
                  _MetricCard(
                    title: 'Active Subscribers',
                    value: '18,420',
                    change: '+8.7%',
                    isPositive: true,
                    icon: Icons.people_outline,
                    color: Colors.blue,
                  ),
                  _MetricCard(
                    title: 'Conversion Rate',
                    value: '3.42%',
                    change: '-0.5%',
                    isPositive: false,
                    icon: Icons.trending_up,
                    color: Colors.orange,
                  ),
                  _MetricCard(
                    title: 'System Uptime',
                    value: '99.98%',
                    change: '+0.01%',
                    isPositive: true,
                    icon: Icons.verified_user_outlined,
                    color: Colors.purple,
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 24),

          // 4. Responsive Multi-Column Split Section (Expanded & Flexible)
          maxWidth >= 900
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Expanded Main Analytics Section (Takes 2/3 space)
                    Expanded(
                      flex: 2,
                      child: _buildAnalyticsChartCard(),
                    ),
                    const SizedBox(width: 16),
                    // Flexible Recent Activity Section (Takes 1/3 space)
                    Flexible(
                      flex: 1,
                      child: _buildRecentActivityCard(),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _buildAnalyticsChartCard(),
                    const SizedBox(height: 16),
                    _buildRecentActivityCard(),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildAnalyticsChartCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Revenue Growth Chart',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.show_chart, size: 64, color: Color(0xFF0F52BA)),
                    SizedBox(height: 8),
                    Text(
                      'Responsive Analytics Canvas (Expanded)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F52BA),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivityCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildActivityTile('Subscription Renewal', '\$49.00', '2 mins ago'),
            const Divider(),
            _buildActivityTile('Enterprise Plan Upgrade', '\$499.00', '15 mins ago'),
            const Divider(),
            _buildActivityTile('Refund Issued #1042', '-\$29.00', '1 hour ago'),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityTile(String title, String amount, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
              Text(
                time,
                style: const TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

/// Reusable Metric KPI Card Widget
class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final bool isPositive;
  final IconData icon;
  final Color color;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.change,
    required this.isPositive,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 24),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: isPositive ? Colors.green.shade50 : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    change,
                    style: TextStyle(
                      color: isPositive ? Colors.green : Colors.red,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
