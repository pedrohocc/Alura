import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: const Text(
              "Tarefas",
            ),
          ),
          body: ListView(
            children: [
              Card("teste1"),
              Card("teste2"),
              Card("teste3"),
              Card("teste3"),
              Card("teste3"),
              Card("teste3"),
              Card("teste3"),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Text("+"),
          ),
        ));
  }
}

class Card extends StatefulWidget {
  final String titulo;
  const Card(this.titulo, {super.key});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
          color: Colors.blue,
          height: 140,
        ),
        Column(
          children: [
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black26,
                    width: 72,
                    height: 100,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      widget.titulo,
                      style: const TextStyle(
                        fontSize: 24,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel = nivel + 1;
                          });
                        },
                        child: Column(
                          children: [
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 300,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel * 0.1,
                        )),
                    Text(
                      "Nivel: $nivel",
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
