import 'package:flutter/material.dart';
import 'product_list_page.dart';

void main() {
  runApp(const ProductListApp());
}

class ProductListApp extends StatelessWidget {
  const ProductListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const ProductListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
