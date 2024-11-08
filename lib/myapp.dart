import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/login_page.dart';
import 'package:flutter_application_1/task/task_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/list': (context) => const TaskListPage(),
      },
    );
  }
}