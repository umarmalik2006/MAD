import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TimerApp(),
  ));
}

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  int _seconds = 10; // Countdown from 10 seconds
  bool _isRunning = false;

  void startTimer() async {
    if (_isRunning) return; // Prevent multiple timers
    setState(() {
      _isRunning = true;
      _seconds = 10;
    });

    for (int i = _seconds; i > 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        _seconds--;
      });
    }

    setState(() {
      _isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Countdown: $_seconds',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: startTimer,
              child: Text(_isRunning ? 'Running...' : 'Start Timer'),
            ),
          ],
        ),
      ),
    );
  }
}
