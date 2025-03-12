import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomDesign(),
    );
  }
}

class CustomDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Text
          SizedBox(height: 20),
          Text(
            "LAB # 3",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          // Image with border
          Stack(
            alignment: Alignment.center,
            children: [
              // Red Background Box
              Container(
                width: 250, // Adjust width as needed
                height: 150, // Adjust height as needed
                decoration: BoxDecoration(
                  color: Colors.red, // Red background
                  borderRadius: BorderRadius.circular(20), // Rounded edges
                ),
              ),

              // Blue Border Box with Image
              Container(
                padding: EdgeInsets.all(5), // Space for blue border
                decoration: BoxDecoration(
                  color: Colors.blue, // Blue border color
                  borderRadius: BorderRadius.circular(25), // Rounded border
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Match with blue border
                  child: Image.asset(
                    'assets/image.jpeg',
                    width: 180, // Adjust size as needed
                    height: 100, // Adjust size as needed
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          // Overlapping Colored Boxes
          // Overlapping boxes with numbers from 1 to 9
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Blue Box
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),

              // Green Box (Overlapping)
              Positioned(
                bottom: 50,
                left:50,
                child: Container(
                  width: 70,
                  height: 70,
                  color: Colors.green,
                ),
              ),

              // Red Box with 1-9 Numbers
              Positioned(
                bottom: -25,
                top:10,
                left: 80,
                child: Container(
                  width: 40,
                  height: 200, // Increased height to fit 9 numbers
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(9, (index) {
                      return Text(
                        "${index+1}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),


          // Description Text
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "PRACTICE MORE THAN THIS. IT WILL HELP YOU TO DESIGN COMPLEX MOBILE APP DESIGN",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),

          Spacer(),

          // Bottom Section with Circular Image
          Container(
            height: 100,
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("LEADING", style: TextStyle(color: Colors.white, fontSize: 18)),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/image.jpeg'),
                ),
                Text("TRAILING", style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}