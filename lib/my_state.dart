import 'package:flutter/material.dart';
import 'api_response.dart';
import 'todo_list.dart';

class MyState with ChangeNotifier {
  List<Todo> _todoList = [];
  List<Todo> get todoList => _todoList;
  int get filterBy => _filterBy;
  int _filterBy = 1;

  void setFilterby(int filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }

  void _setList(List<Todo> todoList) {
    _todoList = todoList;
    notifyListeners();
  }

  List<Todo> filterList(todoList, value) {
    if (value == 2) {
      return _todoList.where((todo) => todo.isDone == true).toList();
    } else if (value == 3) {
      return _todoList.where((todo) => todo.isDone == false).toList();
    }
    return _todoList;
  }

  var api = ApiResponse();

  void getList() async {
    List<Todo> todoList = await api.getTodos();
    _todoList = todoList;
    notifyListeners();
  }

  void isDone(Todo todo) async {
    _setList(await api.updateTodo(todo));
  }

  void addTodo(Todo todo) async {
    var result = await api.postTodo(todo);
    _setList(result);
  }

  void deleteTodo(Todo todo) async {
    _setList(await api.deleteTodo(todo));
  }
}
