import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab View Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildFloatingActionButton(int pageIndex) {
    Color fabColor;
    switch (pageIndex) {
      case 0:
        fabColor = Colors.red;
        break;
      case 1:
        fabColor = Colors.green;
        break;
      case 2:
        fabColor = Colors.blue;
        break;
      default:
        fabColor = Colors.blue;
    }

    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: fabColor,
      child: Icon(Icons.add),
    );
  }

  Widget buildPage(int pageIndex) {
    return Center(
      child: Text(
        'Page ${pageIndex + 1}',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab View Example'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.looks_one)),
            Tab(icon: Icon(Icons.looks_two)),
            Tab(icon: Icon(Icons.looks_3)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildPage(0),
          buildPage(1),
          buildPage(2),
        ],
      ),
      
    );
  }
}
