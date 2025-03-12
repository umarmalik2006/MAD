import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetApp());
}

class WidgetApp extends StatelessWidget {
  const WidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image widget
            Image.asset(
              'MAD/MAD/lab3/assets/sample_image.png', // Corrected path
              height: 200,
              fit: BoxFit.cover,
            ),
            
            // Row with icons and text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 40),
                Text('Star Icon', style: TextStyle(fontSize: 20)),
                Icon(Icons.favorite, color: Colors.red, size: 40),
              ],
            ),
            
            // Elevated button at the bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Button press action
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Button Pressed!')),
                  );
                },
                child: const Text('Press Me'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
