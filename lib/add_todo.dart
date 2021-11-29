import 'package:flutter/material.dart';
import 'todo_list.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);
  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _textController = TextEditingController();
  bool noInput = true;

  void submit() {
    Todo todo = Todo(text: _textController.text, isDone: false);
    Navigator.pop(context, todo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lägg till uppgift'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(height: 18),
            _todoInputField(),
            Container(height: 30),
            _addButton(),
          ],
        ),
      ),
    );
  }

  Widget _todoInputField() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
          child: TextField(
            onChanged: (_textController) {
              if (_textController.isEmpty) {
                setState(
                  () {
                    noInput = true;
                  },
                );
              } else {
                setState(
                  () {
                    noInput = false;
                  },
                );
              }
            },
            controller: _textController,
            decoration: const InputDecoration(
              label: Text(
                'Att göra...',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic),
              ),
              border: OutlineInputBorder(),
              hintText: 'Vad vill du göra?',
              contentPadding: EdgeInsets.only(
                left: 24,
                right: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _addButton() {
    return ElevatedButton.icon(
      icon: const Icon(Icons.add),
      label: const Text(
        'Lägg till',
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () {
        if (_textController.text.isNotEmpty) {
          submit();
        } else {}
      },
    );
  }
}
