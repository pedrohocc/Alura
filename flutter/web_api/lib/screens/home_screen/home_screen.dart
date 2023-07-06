import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/journal.dart';
import '../../services/journal_service.dart';
import 'widgets/home_screen_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime currentDay = DateTime.now();
  int windowPage = 10;
  Map<String, Journal> database = {};
  final ScrollController _listScrollController = ScrollController();
  final JournalService _journalService = JournalService();
  int? userId;

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título basado no dia atual
        title: Text(
          "${currentDay.day}  |  ${currentDay.month}  |  ${currentDay.year}",
        ),
        actions: [
          IconButton(
            onPressed: () {
              refresh();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      body: (userId != null)
          ? ListView(
              controller: _listScrollController,
              children: generateListJournalCards(
                userId: userId!,
                windowPage: windowPage,
                currentDay: currentDay,
                database: database,
                refreshFunction: refresh,
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void refresh() {
    SharedPreferences.getInstance().then(
      (prefs) {
        String? acessToken = prefs.getString("acessToken");
        String? email = prefs.getString("email");
        int? id = prefs.getInt("id");

        if (acessToken != null && email != null && id != null) {
          setState(() {
            userId = id;
          });
          _journalService.getAll(id: id, token: acessToken).then(
            (List<Journal> listJournal) {
              setState(
                () {
                  database = {};
                  for (Journal journal in listJournal) {
                    database[journal.id] = journal;
                  }

                  if (_listScrollController.hasClients) {
                    final double position =
                        _listScrollController.position.maxScrollExtent;
                    _listScrollController.jumpTo(position);
                  }
                },
              );
            },
          );
        }
      },
    );
  }
}
