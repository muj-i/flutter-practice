import 'package:flutter/material.dart';

mySnackbar(meaasge, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(meaasge)));
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Text(
          "Page 1",
          style: TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.abc_rounded),
        onPressed: () {
          mySnackbar("Page 1 FAB", context);
        },
        backgroundColor: Color.fromARGB(255, 10, 29, 66),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: Text(
          "Page 2",
          style: TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.document_scanner_outlined),
        onPressed: () {
          mySnackbar("Page 2 FAB", context);
        },
        backgroundColor: Colors.green,
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      body: Center(
        child: Text(
          "Page 3",
          style: TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.add),
        onPressed: () {
          mySnackbar("Page 3 FAB", context);
        },
        backgroundColor: Colors.red,
      ),
    );
  }
}
