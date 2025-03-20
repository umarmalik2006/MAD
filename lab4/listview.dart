import 'package:flutter/material.dart';

void main() {
  runApp(ListViewApp());
}

class ListViewApp extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ListView by Umar")),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.label, color: const Color.fromARGB(255, 33, 243, 145)),
                title: Text(items[index]),
                subtitle: Text("Description for ${items[index]}"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("${items[index]} clicked");
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
