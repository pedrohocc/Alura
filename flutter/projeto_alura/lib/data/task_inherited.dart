import 'package:flutter/material.dart';
import 'package:projeto_alura/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task("Exemplo",
        "assets/imagens/20-sites-para-aprender-como-programar-de-graça.png", 3),
  ];

  void newTask(String title, String photo, int difficulty) {
    taskList.add(Task(title, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
