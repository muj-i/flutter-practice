import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Activity(),
    );
  }
}

class Activity extends StatelessWidget {
  const Activity({super.key});

/////////////////////////Alert Dialog
  MyAletrtDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
            actions: [],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data')),
      body: Center(
        child: ElevatedButton(
          child: Text('jjjj'),
          onPressed: () {},
        ),
      ),
    );
  }
}
