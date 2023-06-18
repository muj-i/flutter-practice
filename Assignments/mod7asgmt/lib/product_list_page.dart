import 'package:flutter/material.dart';
import 'cart_page.dart';

class Product {
  final String name;
  final double price;
  int count;

  Product(this.name, this.price, this.count);
}

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> products = [
    Product('Motherboard', 239.0, 0),
    Product('CPU', 259.0, 0),
    Product('RAM', 109.0, 0),
    Product('M.2 SSD', 99.0, 0),
    Product('SSD', 79.0, 0),
    Product('HDD', 59.0, 0),
    Product('PSU', 89.0, 0),
    Product('GPU', 199.0, 0),
    Product('Cooling Solutions', 69.0, 0),
    Product('Computer Case', 99.0, 0),
    Product('Monitor', 129.0, 0),
    Product('Keyboard', 59.0, 0),
    Product('Mouse', 29.0, 0),
    Product('Windows OS', 20.0, 0),
    Product('Sound Card', 199.0, 0),
    Product('NIC', 19.0, 0),
    Product('Optical Drive', 29.0, 0),
    Product('Expansion Cards', 39.0, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 6,
        title: const Text('Product List'),
        centerTitle: true,

      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                products[index].name,
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                'Price: \$${products[index].price}',
                style: const TextStyle(fontSize: 14.5),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 34,
                    child: ElevatedButton(
                      child: const Text('Buy Now'),
                      onPressed: () {
                        setState(() {
                          products[index].count++;
                          if (products[index].count == 5) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Congratulations!'),
                                content: Text(
                                  'You\'ve bought 5 ${products[index].name}!',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                actions: [
                                  OutlinedButton(
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                        });
                      },
                    ),
                  ),
                  Text(
                    'Count: ${products[index].count}',
                    style: const TextStyle(fontSize: 12.5),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage(products)),
            );
          },
        ),
    );
  }
}
