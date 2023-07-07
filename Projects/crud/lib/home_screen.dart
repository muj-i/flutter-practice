import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: const Center(child: Text('C R U D')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
          itemCount: 5,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Product Name'),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product id'),
                    Text('Unit Price'),
                    Text('Quantity'),
                  ],
                ),
                leading: Image.network(
                  'https://images.unsplash.com/photo-1511385348-a52b4a160dc2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1207&q=80',
                  width: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.photo,
                      size: 50,
                    );
                  },
                ),
              ),
            );
          }),
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          }),
    );
  }
}
