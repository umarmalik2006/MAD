import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: DashboardScreen(), debugShowCheckedModeBanner: false),
  );
}

class DashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> dashboardItems = [
    {
      'title': 'Users',
      'icon': Icons.people,
      'value': '1.2K',
      'details': 'Active Users: 1,243\nNew Today: 34',
    },
    {
      'title': 'Messages',
      'icon': Icons.message,
      'value': '890',
      'details': 'Unread: 76\nSent: 814',
    },
    {
      'title': 'Revenue',
      'icon': Icons.monetization_on,
      'value': '\$12.5K',
      'details': 'Today: \$1,250\nThis Month: \$12,500',
    },
    {
      'title': 'Alerts',
      'icon': Icons.notifications,
      'value': '5',
      'details': '3 system alerts\n2 user alerts',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: dashboardItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            var item = dashboardItems[index];
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        title: Text(item['title']),
                        content: Text(item['details']),
                        actions: [
                          TextButton(
                            child: Text("Close"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item['icon'], size: 40, color: Colors.indigo),
                      SizedBox(height: 12),
                      Text(
                        item['value'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        item['title'],
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}