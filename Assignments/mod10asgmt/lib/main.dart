
import 'package:mod10asgmt/responsize/portrait_scaffold.dart';
import 'package:mod10asgmt/responsize/responsive_layout.dart';
import 'package:mod10asgmt/responsize/landscape_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
       portraitScaffold: PortraitScaffold(),
        landscapeScaffold: LandscapeScaffold(),
        
      ),
    );
  }
}
