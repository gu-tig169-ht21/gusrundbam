import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_state.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.list}) : super(key: key);

  final List<Todo> list;
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<MyState>(context, listen: false);
    return RefreshIndicator(
      onRefresh: () async {
        state.getList();
      },
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _item(context, list[index]);
        },
      ),
    );
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
          todo.isDone = !todo.isDone;
          state.isDone(todo);
        },
      ),
    ),
  );
}

class Todo {
  String text;
  bool isDone;
  String id;

  Todo({required this.text, required this.isDone, this.id = ''});
  factory Todo.fromJson(Map<dynamic, dynamic> json) => Todo(
        id: json['id'],
        text: json['title'],
        isDone: json['done'],
      );

  Map<String, dynamic> toJson() => {"id": id, "title": text, "done": isDone};
  @override
  String toString() {
    return "{id: $id title: $text}";
  }
}
