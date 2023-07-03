import 'package:flutter/material.dart';
import 'contact_list_screen.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      title: 'Material App',
      home: ContactListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
