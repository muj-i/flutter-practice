import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {

   final double width;
  final double height;
  const MyCircleAvatar({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: 
      SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/pc.png'),
                radius: 120,
              ),
              
            ),
            Text('MPG Trident AS 13th', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
          ,SizedBox(height: 3),
          SizedBox(
            width: width,
            height: height,
            child: Text('The MPG Trident AS takes charge by being the most compact gaming desktop. Packed in a 10 liters volume case, it has components that are typically found in full tower cases, including the latest Intel® Core™ processors and NVIDIA® GeForce RTX™ graphics cards. In essence, the MPG Trident AS can only be surpassed by itself.', style: TextStyle(fontSize: 15),))],
        ),
      ),
    
    );
  }
}
