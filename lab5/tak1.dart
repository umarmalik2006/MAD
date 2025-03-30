import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedContainerExample(),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isExpanded = false;
  bool _isTextVisible = true;

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _toggleTextVisibility() {
    setState(() {
      _isTextVisible = !_isTextVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Widgets Demo",
        style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              height: _isExpanded ? 200 : 100,
              width: _isExpanded ? 200 : 100,
              decoration: BoxDecoration(
                color: _isExpanded ? Colors.blue : Colors.green,
                borderRadius: BorderRadius.circular(_isExpanded ? 20 : 50),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleContainer,
              child: const Text("Animate Container"),
            ),
            const SizedBox(height: 30),
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _isTextVisible ? 1.0 : 0.0,
              child: const Text(
                "Hello, its me umar!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _toggleTextVisibility,
              child: const Text("Toggle Text Visibility"),
            ),
          ],
        ),
      ),
    );
  }
}