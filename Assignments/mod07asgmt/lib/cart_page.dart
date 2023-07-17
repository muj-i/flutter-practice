import 'package:flutter/material.dart';
import 'product_list_page.dart';

class CartPage extends StatelessWidget {
  final List<Product> products;

  const CartPage(this.products, {super.key});
  List<Product> getBoughtProducts() {
    return products
        .where((purchasedProducts) => purchasedProducts.count > 0)
        .toList();
  }

  int getTotalCount() {
    int totalCount = 0;
    for (var purchasedProducts in products) {
      totalCount += purchasedProducts.count;
    }
    return totalCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: getBoughtProducts().length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              title: Text(
                'Purchased Item: ${getBoughtProducts()[index].name}',
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                'Quantity: ${getBoughtProducts()[index].count}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50.0,
          child: Center(
            child: Text(
              'Total purchased products: ${getTotalCount()}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
