import 'package:flutter/material.dart';

void main() => runApp(NewApp()
  // MaterialApp(
  //   home: Center(
  //     child: Text('Hello world'),
  //   ),
  // ),
);

class NewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Fu*king World'),
          centerTitle: true,
          actions: [
            IconButton(icon: Icon(Icons.add_alarm), onPressed: () {})
          ],
        ),
      ),
    );
    // TODO: implement build
    //throw UnimplementedError();
  }
}
