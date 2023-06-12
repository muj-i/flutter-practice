/// github repository link
/// https://github.com/muj-i/Flutter-Practice/tree/main/LiveTests/mod6lt

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Shopping List',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Cart is empty')),
              );
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(206, 223, 87, 160),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    ListTile(
                      leading: Icon(Icons.shopping_basket,
                          color: Color.fromARGB(206, 223, 87, 160), size: 40),
                      title: Text(
                        'Apples',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_basket,
                          color: Color.fromARGB(206, 223, 87, 160), size: 40),
                      title: Text(
                        'Bread',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_basket,
                          color: Color.fromARGB(206, 223, 87, 160), size: 40),
                      title: Text(
                        'Milk',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_basket,
                          color: Color.fromARGB(206, 223, 87, 160), size: 40),
                      title: Text(
                        'Bananas',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_basket,
                          color: Color.fromARGB(206, 223, 87, 160), size: 40),
                      title: Text(
                        'Eggs',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
