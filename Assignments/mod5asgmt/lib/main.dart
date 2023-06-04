
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeActivity(),
      debugShowCheckedModeBanner: false,);
  }
}

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() {
    return _HomeActivityState();
  }
}

class _HomeActivityState extends State<HomeActivity> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Module 5 Assignment"),
        backgroundColor: const Color.fromARGB(255, 130, 31, 89).withAlpha(2000),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Module 5 Assignment")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Page 1"),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.business_center_outlined),
              title: Text("Page 2"),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Page 3"),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Page1(),
          Page2(),
          Page3(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: GNav(
          iconSize: 24,
          padding: EdgeInsets.all(16),
          activeColor: const Color.fromARGB(255, 130, 31, 89),
          tabBackgroundColor:
              const Color.fromARGB(255, 130, 31, 89).withOpacity(0.1),
          gap: 8,
          tabs: [
            GButton(icon: Icons.home, text: "Page 1"),
            GButton(icon: Icons.business_center_outlined, text: "Page 2"),
            GButton(icon: Icons.people, text: "Page 3"),
          ],
          onTabChange: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Page 1",
          style: TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.abc_rounded),
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 130, 31, 89),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Page 2",
          style: TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.document_scanner_outlined),
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Page 3",
          style: TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.add),
        onPressed: () {},
        backgroundColor: Colors.red,
      ),
    );
  }
}
