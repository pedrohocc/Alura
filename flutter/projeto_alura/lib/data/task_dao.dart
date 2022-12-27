import 'package:projeto_alura/components/task.dart';
import 'package:projeto_alura/data/db.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tabelaSql = 'CREATE TABLE $_nomeTabela('
      '$_titulo TEXT, '
      '$_dificuldade INTEGER, '
      '$_imagem TEXT)';

  static const String _nomeTabela = "task_tabela";
  static const String _titulo = "titulo";
  static const String _dificuldade = "dificuldade";
  static const String _imagem = "imagem";

  salvar(Task task) async {
    final Database banco = await getDB();
    var isExists = await procurarUnico(task.titulo);
    Map<String, dynamic> mapTarefa = toMap(task);
    if (isExists.isEmpty) {
      return await banco.insert(_nomeTabela, mapTarefa);
    } else {
      return await banco.update(_nomeTabela, mapTarefa,
          where: '$_titulo = ?', whereArgs: [task.titulo]);
    }
  }

  Future<List<Task>> procurarTudo() async {
    final Database banco = await getDB();
    final List<Map<String, dynamic>> result = await banco.query(_nomeTabela);
    return toTask(result);
  }

  Future<List<Task>> procurarUnico(String tituloDaTask) async {
    final Database banco = await getDB();
    final List<Map<String, dynamic>> result = await banco
        .query(_nomeTabela, where: '$_titulo = ?', whereArgs: [tituloDaTask]);
    return toTask(result);
  }

  deletar(String tituloDaTask) async {
    final Database banco = await getDB();
    var isExists = await procurarUnico(tituloDaTask);
    if (isExists.isEmpty) {
      print("item não encontrado");
    } else {
      banco.delete(_nomeTabela,
          where: '$_titulo = ?', whereArgs: [tituloDaTask]);
    }
  }

  List<Task> toTask(List<Map<String, dynamic>> listaBanco) {
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in listaBanco) {
      final Task tarefa =
          Task(linha[_titulo], linha[_imagem], linha[_dificuldade]);
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  Map<String, dynamic> toMap(Task tarefa) {
    Map<String, dynamic> mapTarefas = {};
    mapTarefas[_titulo] = tarefa.titulo;
    mapTarefas[_dificuldade] = tarefa.dificuldade;
    mapTarefas[_imagem] = tarefa.foto;
    return mapTarefas;
  }
}
