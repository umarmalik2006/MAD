import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(home: CrudApp()));
}

class CrudApp extends StatefulWidget {
  @override
  _CrudAppState createState() => _CrudAppState();
}

class _CrudAppState extends State<CrudApp> {
  List<dynamic> users = [];
  List<dynamic> posts = [];
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUsers();
    fetchPosts();
  }

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      setState(() {
        users = json.decode(response.body);
      });
    }
  }

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      setState(() {
        posts = json.decode(response.body);
      });
    }
  }

  Future<void> createPost(String title, String body) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode({'title': title, 'body': body, 'userId': 1}),
    );
    if (response.statusCode == 201) {
      setState(() {
        posts.insert(0, json.decode(response.body));
      });
    }
  }

  Future<void> updatePost(int id, String title, String body) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode({'title': title, 'body': body, 'userId': 1}),
    );
    if (response.statusCode == 200) {
      setState(() {
        int index = posts.indexWhere((post) => post['id'] == id);
        if (index != -1) {
          posts[index] = json.decode(response.body);
        }
      });
    }
  }

  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    if (response.statusCode == 200) {
      setState(() {
        posts.removeWhere((post) => post['id'] == id);
      });
    }
  }

  void showEditDialog(Map<String, dynamic> post) {
    titleController.text = post['title'];
    bodyController.text = post['body'];

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit Post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: bodyController, decoration: InputDecoration(labelText: 'Body')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              updatePost(post['id'], titleController.text, bodyController.text);
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void showCreateDialog() {
    titleController.clear();
    bodyController.clear();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Create Post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: bodyController, decoration: InputDecoration(labelText: 'Body')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              createPost(titleController.text, bodyController.text);
              Navigator.of(context).pop();
            },
            child: Text('Create'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter CRUD with JSONPlaceholder')),
      body: Column(
        children: [
          ListTile(title: Text("Users", style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text(users[index]['name'])),
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Posts", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: showCreateDialog,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(post['title']),
                    subtitle: Text(post['body']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: Icon(Icons.edit), onPressed: () => showEditDialog(post)),
                        IconButton(icon: Icon(Icons.delete), onPressed: () => deletePost(post['id'])),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}