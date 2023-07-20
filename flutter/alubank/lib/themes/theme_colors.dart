import 'package:flutter/material.dart';

class ThemeColors {
  static const MaterialColor mainColor = Colors.purple;
  static const List<Color> gradientHeader = [
    Color.fromRGBO(103, 99, 234, 1),
    Color.fromRGBO(155, 105, 254, 1),
    Color.fromRGBO(195, 107, 255, 1),
  ];
  static const Map<String, Color> dotColors = {
    'spent': Color.fromRGBO(255, 175, 29, 1),
    'income': Color.fromRGBO(191, 69, 198, 1)
  };
  static const Color divisonColor = Color.fromRGBO(166, 166, 166, 1);
}
