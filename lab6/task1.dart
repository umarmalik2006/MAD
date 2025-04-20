import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: ImageGridScreen(), debugShowCheckedModeBanner: false),
  );
}

class ImageGridScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://picsum.photos/id/1011/400/400',
    'https://picsum.photos/id/1025/400/400',
    'https://picsum.photos/id/1003/400/400',
    'https://picsum.photos/id/1043/400/400',
    'https://picsum.photos/id/102/400/400',
    'https://picsum.photos/id/1074/400/400',
    'https://picsum.photos/id/1050/400/400',
    'https://picsum.photos/id/1069/400/400',
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate number of columns based on screen width
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth ~/ 180; // 180 is ideal card width

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Image Grid'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount > 1 ? crossAxisCount : 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrls[index], fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}