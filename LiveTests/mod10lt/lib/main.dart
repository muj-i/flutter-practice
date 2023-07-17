import 'package:mod10lt/responsize/portrait_scaffold.dart';
import 'package:mod10lt/responsize/responsive_layout.dart';
import 'package:mod10lt/responsize/landscape_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed App',
      debugShowCheckedModeBanner: false,
      home: const ResponsiveLayout(
        portraitScaffold: PortraitScaffold(),
        landscapeScaffold: LandscapeScaffold(),
      ),
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
    );
  }
}
