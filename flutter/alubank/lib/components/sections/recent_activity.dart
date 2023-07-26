import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/color_dot.dart';
import 'package:alubank/components/division.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BoxCard(
        boxContent: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: ColorDot(color: ThemeColors.dotColors['spent']),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Saída'),
                        Text(
                          '\$9900.97',
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: ColorDot(color: ThemeColors.dotColors['income']),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Entrada'),
                        Text(
                          '\$9332.35',
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 8),
              child: Text(
                'Limite de gastos: \$432.93',
              ),
            ),
            LinearProgressIndicator(
              minHeight: 8,
              borderRadius: BorderRadius.circular(8),
              value: 0.5,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: DivisionWidget(),
            ),
            const Text(
                'Esse mês você gastou \$1500.00 com jogos. Tente abaixar esse custo!'),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Diga-me como',
              ),
            )
          ],
        ),
      ),
    );
  }
}
