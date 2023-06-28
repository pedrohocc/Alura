import 'package:flutter/material.dart';

Future<dynamic> showAlertDialog(BuildContext context,
    {String title = 'Alerta',
    String content = 'Deseja realiar essa operação?',
    String affirmativeText = 'Confirmar'}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
        ),
        content: Text(
          content,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(
                context,
                false,
              );
            },
            child: const Text(
              'Cancelar',
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(
                context,
                true,
              );
            },
            child: Text(
              affirmativeText.toUpperCase(),
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      );
    },
  );
}
