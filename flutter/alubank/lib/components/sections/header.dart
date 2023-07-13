import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(103, 99, 234, 1),
                Color.fromRGBO(155, 105, 254, 1),
                Color.fromRGBO(195, 107, 255, 1),
              ])),
      child: const Padding(
        padding: EdgeInsets.fromLTRB(16, 80, 16, 16),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: '\$',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  children: [
                    TextSpan(
                      text: '1000.00',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(
                'Balanço disponível',
                style: TextStyle(fontSize: 16, color: Colors.white),
              )
            ],
          ),
          Icon(
            Icons.account_circle,
            size: 42,
            color: Colors.white,
          )
        ]),
      ),
    );
  }
}
