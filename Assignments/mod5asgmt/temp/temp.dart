import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabbed App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabbedScreen(),
    );
  }
}

class TabbedScreen extends StatefulWidget {
  @override
  _TabbedScreenState createState() => _TabbedScreenState();
}

class _TabbedScreenState extends State<TabbedScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Page(number: 1, color: Colors.red),
    Page(number: 2, color: Colors.green),
    Page(number: 3, color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabbed App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Page 1'),
              onTap: () {
                _navigateToPage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 2'),
              onTap: () {
                _navigateToPage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 3'),
              onTap: () {
                _navigateToPage(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _navigateToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Page 3',
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class Page extends StatelessWidget {
  final int number;
  final Color color;

  const Page({required this.number, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'Page $number',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
