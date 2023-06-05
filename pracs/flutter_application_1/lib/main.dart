import 'package:flutter/material.dart';

void main() {
  runApp(dApp(
    appName: 'The TI App',
  ));
}

class dApp extends StatelessWidget {
  final String appName;

  const dApp({super.key, required this.appName});
  @override
  Widget build(Object context) {
    return MaterialApp(
      home: HomeAct(),
      theme: ThemeData.dark(),
    );
  }
}

class HomeAct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("klkok"),
        backgroundColor: Colors.red,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
        Text(
          "New App!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          "New App2!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          "New App!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ]),
    );
  }
}
