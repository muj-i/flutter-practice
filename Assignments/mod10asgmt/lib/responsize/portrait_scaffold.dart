import 'package:mod10asgmt/constants.dart';
import 'package:mod10asgmt/utilitis/my_circle_avatar.dart';
import 'package:flutter/material.dart';

import '../utilitis/my_container.dart';

class PortraitScaffold extends StatefulWidget {
  const PortraitScaffold({super.key});

  @override
  State<PortraitScaffold> createState() => _PortraitScaffoldState();
}

class _PortraitScaffoldState extends State<PortraitScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myBackGroundColor,
      body: const Column(
        children: [
          SizedBox(height: 10),
          MyCircleAvatar(
            height: 145.0,
            width: 2000.0,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: MyContainer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
