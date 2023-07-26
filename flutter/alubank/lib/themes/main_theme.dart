import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

const MaterialColor mainColor = ThemeColors.mainColor;

ThemeData mainTheme = ThemeData(
  primarySwatch: mainColor,
  primaryColor: mainColor,
  brightness: Brightness.dark,
  fontFamily: 'Raleway',
  textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16),
      bodyLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontSize: 16),
      ),
    ),
  ),
);
