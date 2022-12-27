import 'package:flutter/material.dart';
import 'package:projeto_alura/components/difficulty.dart';
import 'package:projeto_alura/data/task_dao.dart';

class Task extends StatefulWidget {
  final String titulo;
  final String foto;
  final int dificuldade;

  Task(this.titulo, this.foto, this.dificuldade, {super.key});

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int maestria = 0;
  int maximo = 0;

  bool assetOrNetwork() {
    if (widget.foto.contains("http")) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
          color: null,
          height: 140,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.blue, style: BorderStyle.solid, width: 1),
              borderRadius: BorderRadius.circular(10),
              color: maestria == 0
                  ? Colors.blue
                  : maestria == 1
                      ? Colors.green
                      : maestria == 2
                          ? Colors.red
                          : Colors.pink),
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(87, 0, 0, 0),
                        borderRadius: BorderRadius.circular(10)),
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: assetOrNetwork == true
                            ? Image.network(
                                widget.foto,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                widget.foto,
                                fit: BoxFit.cover,
                              )),
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.titulo,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Difficulty(difficultyLevel: widget.dificuldade)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onLongPress: () {
                          TaskDao().deletar(widget.titulo);
                        },
                        onPressed: () {
                          setState(() {
                            widget.nivel = widget.nivel + 1;
                            if ((widget.nivel / widget.dificuldade) * 0.1 ==
                                1) {
                              maestria += 1;
                              widget.nivel = 0;
                            }
                          });
                        },
                        child: Column(
                          children: const [
                            Icon(Icons.arrow_drop_up),
                            Text(
                              "Lvl Up",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 250,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: widget.dificuldade > 0
                              ? (widget.nivel / widget.dificuldade) * 0.1
                              : 1,
                        )),
                    Text(
                      "Nivel: ${widget.nivel}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
