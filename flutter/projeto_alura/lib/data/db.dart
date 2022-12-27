import 'package:projeto_alura/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDB() async {
  final String path = join(await getDatabasesPath(), "task.db");
  return openDatabase(path, onCreate: (db, version) {
    db.execute(TaskDao.tabelaSql);
  }, version: 1);
}
