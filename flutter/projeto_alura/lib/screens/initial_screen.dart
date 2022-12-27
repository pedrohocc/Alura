import 'package:flutter/material.dart';
import 'package:projeto_alura/data/task_dao.dart';
import 'package:projeto_alura/screens/form_screen.dart';

import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
        title: const Text(
          "Tarefas",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().procurarTudo(),
          builder: (context, snapshot) {
            List<Task>? itens = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(children: const [
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ]),
                );
              case ConnectionState.waiting:
                return Center(
                  child: Column(children: const [
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ]),
                );
              case ConnectionState.active:
                return Center(
                  child: Column(children: const [
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ]),
                );
              case ConnectionState.done:
                if (snapshot.hasData && itens != null) {
                  if (itens.isNotEmpty) {
                    return ListView.builder(
                      itemCount: itens.length,
                      itemBuilder: (context, index) {
                        final Task tarefa = itens[index];
                        return tarefa;
                      },
                    );
                  } else {
                    return Center(
                      child: Column(
                        children: [
                          Image.asset("assets/imagens/404.png"),
                          const Text('Nenhuma tarefa criada, crie uma!')
                        ],
                      ),
                    );
                  }
                } else {
                  return const Text(
                      'Não foi posivel carreagar as tarefas. Fale com o suporte!');
                }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (contextNew) =>
                          FormScreen(taskContext: context)))
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
