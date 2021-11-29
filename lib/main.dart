import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_todo.dart';
import 'homepage.dart';
import 'my_state.dart';

void main() {
  var state = MyState();
  state.getList();
  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/add_todo': (context) => const AddTodo(),
        },
        title: 'Todo app',
        theme: ThemeData(primarySwatch: Colors.teal),
      ),
    ),
  );
}
