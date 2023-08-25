import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Module 5 Live Test',
      home: HomeAct(),
    );
  }
}

class HomeAct extends StatelessWidget {
  const HomeAct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.withAlpha(2000),
        elevation: 6,
        title: const Text('Module 5 Live Test'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  "Search",
                ),
              ));
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  "Settings",
                ),
              ));
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo.withAlpha(200),
              ),
              child: const Column(
                children: [
                  Text(
                    'Module 5 Live Test',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Navigate to home
              },
            ),
            ListTile(
              leading: const Icon(Icons.people_alt),
              title: const Text('Profile'),
              onTap: () {
                // Navigate to Profile
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to my app!',
          style: TextStyle(fontSize: 34),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Add",
              ),
            ));
          },
          backgroundColor: Colors.indigo.withAlpha(200),
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
