import 'package:flutter/material.dart';
import 'package:flutter_application_1/task/task_model.dart';
import 'task_controller.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  TaskListPageState createState() => TaskListPageState();
}

class TaskListPageState extends State<TaskListPage> {
  final TaskController _taskController = TaskController();

  void _showTaskDialog([Task? task]) {
    final TextEditingController taskControllerText = TextEditingController();
    if (task != null) {
      taskControllerText.text = task.title;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(task == null ? 'Adicionar Tarefa' : 'Editar Tarefa'),
        content: TextField(
          controller: taskControllerText,
          decoration: const InputDecoration(hintText: 'Digite a tarefa'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              if (task == null) {
                setState(() {
                  _taskController.addTask(taskControllerText.text);
                });
              } else {
                setState(() {
                  _taskController.editTask(task, taskControllerText.text);
                });
              }
              Navigator.of(context).pop();
            },
            child: Text(task == null ? 'Adicionar' : 'Salvar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tarefas')),
      body: ListView.builder(
        itemCount: _taskController.tasks.length,
        itemBuilder: (context, index) {
          final task = _taskController.tasks[index];
          return ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showTaskDialog(task),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _taskController.deleteTask(index);
                    });
                  },
                ),
              ],
            ),
            onTap: () {
              setState(() {
                _taskController.toggleTaskCompletion(task);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
