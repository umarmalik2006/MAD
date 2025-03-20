import 'package:flutter/material.dart';

void main() {
  runApp(SimpleUIApp());
}

class SimpleUIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Simple UI")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, size: 50, color: Colors.blue),
              SizedBox(height: 10),
              Text("Welcome to Flutter", style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  print("Button Pressed!");
                },
                child: Text("Click Me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
