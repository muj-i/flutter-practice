import 'package:flutter/material.dart';

BoxDecoration getBackgroundDecoration(bool _isDayTime) {
  //Brightness currentBrightness = Theme.of(context).brightness;
  if (_isDayTime) {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
            'assets/images/day_background.png'), // Set your desired day background image
        fit: BoxFit.cover,
      ),
    );
  } else {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
            'assets/images/night_background.png'), // Set your desired day background image
        fit: BoxFit.cover,
      ),
    );
  }
}
