import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LocalDatabaseScreen(),
  ));
}

class LocalDatabaseScreen extends StatefulWidget {
  @override
  _LocalDatabaseScreenState createState() => _LocalDatabaseScreenState();
}

class _LocalDatabaseScreenState extends State<LocalDatabaseScreen> {
  List<String>? data;
  bool isLoading = true;

  // Simulate fetching data from a local database
  Future<void> fetchDataFromLocalDb() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate delay
    setState(() {
      data = [
        "Item 1 from DB",
        "Item 2 from DB",
        "Item 3 from DB",
        "Item 4 from DB"
      ];
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromLocalDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simulated DB List")),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data![index]),
                  );
                },
              ),
      ),
    );
  }
}
