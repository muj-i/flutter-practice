import 'package:flutter/material.dart';


class DrawerAct extends StatefulWidget {

  @override
  _DrawerActState createState() {
    return _DrawerActState();
  }
}



class _DrawerActState extends State<DrawerAct> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 10, 29, 66).withAlpha(2000),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  "Module 5 Assignment",
                  style: TextStyle(fontSize: 44, color: Colors.white70),
                ),
              )),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.home),
                ),
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
                leading: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.business_center_outlined),
                ),
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
                leading: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.people),
                ),
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
    );
  }
}
