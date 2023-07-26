import 'package:alubank/components/box_card.dart';
import 'package:flutter/material.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({super.key});

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
              'Ações da Conta',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: const BoxCard(
                  boxContent: _AccountActionsContent(
                    icone: Icons.account_balance_wallet,
                    texto: 'Depositar',
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: const BoxCard(
                  boxContent: _AccountActionsContent(
                    icone: Icons.cached,
                    texto: 'Transferir',
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: const BoxCard(
                  boxContent: _AccountActionsContent(
                    icone: Icons.center_focus_strong,
                    texto: 'Ler',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _AccountActionsContent extends StatelessWidget {
  final IconData icone;
  final String texto;
  const _AccountActionsContent({required this.icone, required this.texto});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Icon(icone),
          ),
          Text(texto)
        ],
      ),
    );
  }
}
