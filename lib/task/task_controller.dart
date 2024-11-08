import 'package:flutter_application_1/task/task_model.dart';

class TaskController {
  List<Task> tasks = [];

  void addTask(String title) {
    tasks.add(Task(title: title));
  }

  void editTask(Task task, String newTitle) {
    task.title = newTitle;
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }

  void toggleTaskCompletion(Task task) {
    task.isCompleted = !task.isCompleted;
  }
}
