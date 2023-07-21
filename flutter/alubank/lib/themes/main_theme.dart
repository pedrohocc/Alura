import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

const MaterialColor mainColor = ThemeColors.mainColor;

ThemeData mainTheme = ThemeData(
  primarySwatch: mainColor,
  primaryColor: mainColor,
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16),
    bodyLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontSize: 16),
      ),
    ),
  ),
);
