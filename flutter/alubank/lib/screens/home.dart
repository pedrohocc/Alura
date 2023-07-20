import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/color_dot.dart';
import 'package:alubank/components/division.dart';
import 'package:alubank/components/sections/header.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [const Header(), BoxCard(boxContent: DivisionWidget())],
      ),
    );
  }
}
