import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: RandomPostApp(),
  ));
}

class RandomPostApp extends StatefulWidget {
  @override
  _RandomPostAppState createState() => _RandomPostAppState();
}

class _RandomPostAppState extends State<RandomPostApp> {
  Map<String, dynamic>? post;
  bool isLoading = false;

 Future<void> fetchRandomPost() async {
  setState(() {
    isLoading = true;
  });

  final int randomId = Random().nextInt(30) + 1; // IDs: 1 to 30
  final url = Uri.parse('https://dummyjson.com/posts/$randomId');

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        post = {'title': jsonData['title'], 'body': jsonData['body']};
      });
    } else {
      setState(() {
        post = {'title': 'Error', 'body': 'Failed to fetch post'};
      });
    }
  } catch (e) {
    setState(() {
      post = {'title': 'Error', 'body': e.toString()};
    });
  } finally {
    setState(() {
      isLoading = false;
    });
  }
}

  @override
  void initState() {
    super.initState();
    fetchRandomPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Random Post Viewer")),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : post == null
                ? Text("No post loaded")
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          post!['title'],
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Text(
                          post!['body'],
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: fetchRandomPost,
                          child: Text("Load Another Post"),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
