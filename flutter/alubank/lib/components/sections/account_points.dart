import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/color_dot.dart';
import 'package:alubank/components/division.dart';
import 'package:flutter/material.dart';

class AccountPoints extends StatelessWidget {
  const AccountPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Pontos da conta',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const BoxCard(boxContent: _AccountPointsContent())
        ],
      ),
    );
  }
}

class _AccountPointsContent extends StatelessWidget {
  const _AccountPointsContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text('Pontos totais:'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            '3000',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: DivisionWidget(),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text('Objetivos:'),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 4),
                child: ColorDot(
                  color: Color.fromRGBO(250, 0, 112, 1),
                ),
              ),
              Text('Entraga grátis: 150000pts')
            ],
          ),
        ),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 4),
              child: ColorDot(
                color: Color.fromRGBO(75, 89, 191, 1),
              ),
            ),
            Text('1 mês de streaming: 30000pts')
          ],
        ),
      ],
    );
  }
}
