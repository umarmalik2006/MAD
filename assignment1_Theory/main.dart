import 'package:flutter/material.dart';

void main() {
  runApp(ProfileCardApp());
}

class ProfileCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: ProfileCard(),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Profile Picture from local asset
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
              'assignment1_Theory/assets/image.jpg',
            ),
          ),
          SizedBox(height: 12),
          // Name
          Text(
            'Muhammad Umar Malik',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          // Bio
          Text(
            'Flutter Developer and Mobile UI Designer.',
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
