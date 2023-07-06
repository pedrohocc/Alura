import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helpers/weekday.dart';
import '../../models/journal.dart';
import '../../services/journal_service.dart';

class AddJournalScreen extends StatefulWidget {
  final Journal journal;
  final bool isEditing;
  const AddJournalScreen(
      {Key? key, required this.journal, required this.isEditing})
      : super(key: key);

  @override
  State<AddJournalScreen> createState() => _AddJournalScreenState();
}

class _AddJournalScreenState extends State<AddJournalScreen> {
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    contentController.text = widget.journal.content;
    return Scaffold(
      appBar: AppBar(
        title: Text(WeekDay(widget.journal.createdAt).toString()),
        actions: [
          IconButton(
            onPressed: () {
              registerJournal(context);
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          controller: contentController,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 24),
          expands: true,
          maxLines: null,
          minLines: null,
        ),
      ),
    );
  }

  registerJournal(BuildContext context) async {
    SharedPreferences.getInstance().then((prefs) {
      String? token = prefs.getString("acessToken");
      int? userId = prefs.getInt("id");
      if (token != null && userId != null) {
        JournalService journalService = JournalService();
        widget.journal.content = contentController.text;
        if (widget.isEditing == true) {
          journalService
              .edit(widget.journal.id, widget.journal, token)
              .then((value) {
            if (value != true) {
              Navigator.pop(context, DisposeStatus.error);
            } else {
              Navigator.pop(context, DisposeStatus.success);
            }
          });
        } else {
          journalService.register(widget.journal, token).then((value) {
            if (value) {
              Navigator.pop(context, DisposeStatus.success);
            } else {
              Navigator.pop(context, DisposeStatus.error);
            }
          });
        }
      }
    });
  }
}

enum DisposeStatus { exit, error, success }
