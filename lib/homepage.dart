import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Att göra-lista'),
        centerTitle: true,
        actions: [_filterButton(context)],
      ),
      body: Consumer<MyState>(builder: (context, state, child) {
        return TodoList(list: state.filterList(state.todoList, state.filterBy));
      }),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  Widget _filterButton(context) {
    var state = Provider.of<MyState>(context, listen: false);
    return PopupMenuButton(
        onSelected: (int value) {
          state.setFilterby(value);
        },
        itemBuilder: (context) => [
              const PopupMenuItem(child: Text('Alla'), value: 1),
              const PopupMenuItem(child: Text('Gjorda'), value: 2),
              const PopupMenuItem(child: Text('Kvar att göra'), value: 3)
            ]);
  }

  Widget _floatingActionButton(context) {
    return FloatingActionButton(
      onPressed: () async {
        dynamic todo = await Navigator.pushNamed(context, '/add_todo');
        if (todo != null) {
          Provider.of<MyState>(context, listen: false).addTodo(todo);
        }
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
