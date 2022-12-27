import 'package:flutter/material.dart';
import 'package:projeto_alura/components/task.dart';
import 'package:projeto_alura/data/task_dao.dart';
import 'package:projeto_alura/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController dificuldadeController = TextEditingController();
  TextEditingController imagemController = TextEditingController();

  final _chaveForm = GlobalKey<FormState>();

  bool isNullOrEmpty(String? valor) {
    if (valor != null && valor.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool difficultyValidator(String? valor) {
    if (valor!.isEmpty || int.parse(valor) < 1 || int.parse(valor) > 5) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _chaveForm,
      child: Scaffold(
        appBar: AppBar(title: const Text("Nova task")),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              height: 650,
              width: 375,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (isNullOrEmpty(value)) {
                          return "Insira um titulo para a tarefa!";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.text,
                      controller: tituloController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Exemplo: Ler, Escrever...",
                          label: const Text("Titulo"),
                          filled: true,
                          fillColor: Colors.white24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (difficultyValidator(value)) {
                          return "Valor deve estar entre 1 e 5";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      controller: dificuldadeController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Exemplo: 1,2...",
                          label: const Text("Dificuldade"),
                          filled: true,
                          fillColor: Colors.white24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (isNullOrEmpty(value)) {
                          return "Insira um link";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.url,
                      controller: imagemController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "url da imagem",
                          label: const Text("Imagem"),
                          filled: true,
                          fillColor: Colors.white24),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                            color: Colors.blue,
                            style: BorderStyle.solid,
                            width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imagemController.text,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset("assets/imagens/error.png");
                          },
                          fit: BoxFit.cover,
                        )),
                  ),
                  ElevatedButton(
                      onPressed: (() {
                        if (_chaveForm.currentState!.validate()) {
                          TaskDao().salvar(Task(tituloController.text, imagemController.text, int.parse(dificuldadeController.text)));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Tarefa Criada. Atualize a pagina!"),
                            backgroundColor: Colors.blue,
                          ));
                          Navigator.pop(context);
                        }
                      }),
                      child: const Text("Adicionar"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
