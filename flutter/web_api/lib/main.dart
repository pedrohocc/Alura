import 'package:flutter/material.dart';
import 'package:flutter_webapi_second_course/screens/login_screen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/journal.dart';
import 'screens/add_journal_screen/add_journal_screen.dart';
import 'screens/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLogged = await verifyLogin();
  runApp(
    MyApp(
      isLogged: isLogged,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLogged;
  const MyApp({Key? key, required this.isLogged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Journal',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: GoogleFonts.bitterTextTheme(),
      ),
      initialRoute: (isLogged == true) ? "home" : "login",
      routes: {
        "home": (context) => const HomeScreen(),
        "login": (context) => LoginScreen()
      },
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == "add-journal") {
          Map<String, dynamic> map =
              routeSettings.arguments as Map<String, dynamic>;
          final Journal journal = map['journal'] as Journal;
          final bool isEditing = map['is_editing'];
          return MaterialPageRoute(
            builder: (context) {
              return AddJournalScreen(
                journal: journal,
                isEditing: isEditing,
              );
            },
          );
        }
        return null;
      },
    );
  }
}

Future<bool> verifyLogin() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? isLogged = preferences.getString("acessToken");
  if (isLogged != null) {
    return true;
  } else {
    return false;
  }
}
