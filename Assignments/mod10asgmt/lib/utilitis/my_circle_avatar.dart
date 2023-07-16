import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  const MyCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: 
      Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/pc.png'),
              radius: 150,
            ),
            
          ),
          Text('MPG Trident AS')
        ],
      ),
    
    );
  }
}
