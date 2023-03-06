import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';
import 'package:uuid/uuid.dart';

class AddJournalScreen extends StatefulWidget {
  final Journal journal;
  AddJournalScreen({super.key, required this.journal});

  @override
  State<AddJournalScreen> createState() => _AddJournalScreenState();
}

class _AddJournalScreenState extends State<AddJournalScreen> {
  //validar textfield
  TextEditingController _txtController = TextEditingController();

  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${WeekDay(widget.journal.createdAt.weekday).long.toLowerCase()}, ${widget.journal.createdAt.day}  |  ${widget.journal.createdAt.month}  |  ${widget.journal.createdAt.year}"),
        actions: [
          IconButton(
            onPressed: () {
              if (_txtController.text.isEmpty) {
                setState(() {
                  _validate = true;
                });
                
              } else {
                setState(() {
                  _validate = false;
                });
                registerJournal(context);
              }
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _txtController,
          keyboardType: TextInputType.multiline,
          expands: true,
          minLines: null,
          maxLines: null,
          style: const TextStyle(
            fontSize: 24,
          ),
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
              errorText: _validate ? "Insira um valor" : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Escreva algo"),
        ),
      ),
    );
  }

  void registerJournal(BuildContext context) async {
    String content = _txtController.text;

    JournalService servico = JournalService();
    widget.journal.content = content;

    bool resultado = await servico.register(widget.journal);

    Navigator.pop(context, resultado);
  }
}
