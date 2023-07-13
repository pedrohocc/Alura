import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  final Widget boxContent;
  const BoxCard({super.key, required this.boxContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          boxShadow: kElevationToShadow[3],
          color: Color.fromRGBO(75, 75, 75, 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: boxContent,
    );
  }
}
