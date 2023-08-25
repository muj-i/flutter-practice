import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mod14asgmt/firebase_options.dart';
import 'package:mod14asgmt/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'FOOTBAL MATCHES',
      theme: const CupertinoThemeData(
        primaryColor: Colors.deepPurple,
      ),
      builder: (context, child) {
        return CupertinoTheme(
          data: const CupertinoThemeData(
            primaryColor: Colors.deepPurple,
          ),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      home: const HomePage(title: 'FOOTBAL MATCHES'),
    );
  }
}
