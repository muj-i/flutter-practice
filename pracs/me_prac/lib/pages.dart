import 'package:flutter/material.dart';






class Page1 extends StatelessWidget {
  @override
 abstract Future<Widget> build(BuildContext context) async {
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Page 1 Floating Action Button",
              ),
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 10, 29, 66),
      ),
    );
  }
}

class Page2 extends Page1 {
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Page 2 Floating Action Button",
              ),
            ),
          );
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Page 3 Floating Action Button",
              ),
            ),
          );
        },
        backgroundColor: Colors.red,
      ),
    );
  }
}