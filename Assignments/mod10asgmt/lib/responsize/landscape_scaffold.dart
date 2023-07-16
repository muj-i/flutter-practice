import 'package:mod10asgmt/constants.dart';
import 'package:mod10asgmt/utilitis/my_container.dart';
import 'package:mod10asgmt/utilitis/my_circle_avatar.dart';
import 'package:flutter/material.dart';

class LandscapeScaffold extends StatefulWidget {
  const LandscapeScaffold({super.key});

  @override
  State<LandscapeScaffold> createState() => _LandscapeScaffoldState();
}

class _LandscapeScaffoldState extends State<LandscapeScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myBackGroundColor,
      
      body: Row(
        children: const [
          MyCircleAvatar(),
          MyContainer()
        ],
      ),
    );
  }
}