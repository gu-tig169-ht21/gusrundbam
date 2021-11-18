import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.list}) : super(key: key);

  final List<Todo> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _item(context, list[index]);
        });
  }
}

Widget _item(context, Todo todo) {
  var state = Provider.of<MyState>(context, listen: false);
  return Padding(
    padding: const EdgeInsets.only(top: 3, left: 8, right: 8),
    child: Card(
        margin: const EdgeInsets.only(top: 7),
        child: CheckboxListTile(
          title: Text(
            todo.text,
            style: TextStyle(
              fontSize: 20,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
              color: todo.isDone ? Colors.black54 : null,
            ),
          ),
          secondary: IconButton(
              icon: const Icon(
                Icons.cancel_outlined,
              ),
              onPressed: () {
                state.deleteTodo(todo);
              }),
          tileColor: todo.isDone ? Colors.grey[350] : null,
          controlAffinity: ListTileControlAffinity.leading,
          value: todo.isDone,
          onChanged: (value) {
            state.isDone(todo);
          },
        )),
  );
}

class MyState with ChangeNotifier {
  List<Todo> todoList = [];
  int _filterBy = 3;

  List<Todo> get list => todoList;

  int get filterBy => _filterBy;

  void setFilterby(int filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }

  List<Todo> filterList(list, value) {
    if (value == 2) {
      return todoList.where((todo) => todo.isDone == true).toList();
    } else if (value == 3) {
      return todoList.where((todo) => todo.isDone == false).toList();
    }
    return todoList;
  }

  void isDone(Todo todo) {
    todo.toggleCheckbox(todo);
    notifyListeners();
  }

  void addTodo(Todo todo) {
    todoList.add(todo);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    todoList.remove(todo);
    notifyListeners();
  }
}
