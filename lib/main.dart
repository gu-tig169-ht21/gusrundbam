import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_todo.dart';
import 'homepage.dart';
import 'todo_list.dart';

void main() {
  var state = MyState();
  runApp(ChangeNotifierProvider(
      create: (context) => state,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/add_todo': (context) => const AddTodo(),
        },
        title: 'Todo app',
        theme: ThemeData(primarySwatch: Colors.teal),
      )));
}

class Todo {
  String text;
  bool isDone;

  Todo({required this.text, this.isDone = false});

  void toggleCheckbox(todo) {
    isDone = !isDone;
  }
}
