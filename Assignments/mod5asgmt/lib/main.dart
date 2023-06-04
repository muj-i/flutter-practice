import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeActivity(),
    
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeActivity extends StatefulWidget {

  @override
  _HomeActivityState createState() {
    return _HomeActivityState();
  }
}

class _HomeActivityState extends State<HomeActivity> {
  
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Module 5 Assignment"),
        backgroundColor: const Color.fromARGB(255, 10, 29, 66).withAlpha(2000),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 10, 29, 66).withAlpha(200),
          child: ListView(
            children: [
              DrawerHeader(child: Text("Module 5 Assignment", 
              style: TextStyle(fontSize: 44, color: Colors.white70),
              )),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
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
                iconColor: Colors.white,
                textColor: Colors.white,
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
                iconColor: Colors.white,
                textColor: Colors.white,
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
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Page1(),
          Page2(),
          Page3(),
        ],
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 10, 29, 66).withAlpha(200),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            backgroundColor: const Color.fromARGB(255, 10, 29, 66).withAlpha(0),
            color: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            activeColor: Colors.white,
            tabBackgroundColor:
                Color.fromARGB(255, 228, 231, 238).withOpacity(0.1),
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
      ),
    );
  }
}