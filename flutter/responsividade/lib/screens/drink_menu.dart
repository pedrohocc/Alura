import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/drink_item.dart';

class DrinkMenu extends StatelessWidget {
  const DrinkMenu({super.key});
  final List items = drinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: CustomScrollView(slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Bebidas',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Caveat',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return DrinkItem(
                imageURI: items[index]['image'],
                itemTitle: items[index]['name'],
                itemPrice: items[index]['price'],
              );
            },
            childCount: items.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
        )
      ]),
    );
  }
}
