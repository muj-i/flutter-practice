import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget portraitScaffold;
  final Widget landscapeScaffold;
  

  ResponsiveLayout(
      {required this.portraitScaffold,
      required this.landscapeScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return portraitScaffold;
      
        } else {
          return landscapeScaffold;
        }
      },
    );
  }
}
