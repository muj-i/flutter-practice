import 'package:flutter/material.dart';

BoxDecoration getBackgroundDecoration(BuildContext context) {
  Brightness currentBrightness = Theme.of(context).brightness;
    if (currentBrightness == Brightness.light) {
      return const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/day_background.png'), // Set your desired day background image
          fit: BoxFit.cover,
        ),
      );
    } else {
      return const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/night_background.png'), // Set your desired day background image
          fit: BoxFit.cover,
        ),
      );
    }
  }