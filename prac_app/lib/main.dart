import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Center(
        child: Text('Hello, world!'),
      ),
    ),
  );
}


// class NewApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Hello Fu*king World'),
//           centerTitle: false,
//           //leading: Icon(Icons.ac_unit), //onPressed: () {}
//           actions: [
//             IconButton(icon: Icon(Icons.add_alarm), onPressed: () {}),
//             IconButton(icon: Icon(Icons.account_circle), onPressed: () {})
//           ],
//         ),
//         body: Center(
//           child: Text(
//             'pop the puilder',
//             style: TextStyle(fontSize: 38, fontStyle: FontStyle.italic),
//           ),
//         ),
//       ),
//     );
//   }
// }
