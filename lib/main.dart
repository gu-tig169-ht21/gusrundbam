import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo app',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('TIG169 TODO'),
          actions: const [
            IconButton(
              icon: Icon(Icons.more_vert),
              tooltip: 'Dots',
              onPressed: null,
            ),
          ]),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodo()));
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _list() {
    return ListView(children: <Widget>[
      Container(height: 24),
      _item(false, 'Write a book'),
      const Divider(),
      _item(true, 'Do homework'),
      const Divider(),
      _item(false, 'Tidy room'),
      const Divider(),
      _item(false, 'Watch TV'),
      const Divider(),
      _item(false, 'Nap'),
      const Divider(),
      _item(false, 'Shop groceries'),
      const Divider(),
      _item(false, 'Have fun'),
      const Divider(),
      _item(false, 'Meditate'),
    ]);
  }

  Widget _item(bool isChecked, text) {
    return ListTile(
      leading: Checkbox(
        value: isChecked,
        onChanged: (bool? value) {},
      ),
      title: Text(text, style: _getTextStyle(isChecked)),
      trailing: const Icon(Icons.cancel_outlined),
    );
  }

  TextStyle _getTextStyle(isChecked) {
    if (!isChecked) {
      return const TextStyle();
    } else {
      return const TextStyle(
        color: Colors.black54,
        decoration: TextDecoration.lineThrough,
      );
    }
  }
}

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('TIG169 TODO'),
        ),
        body: Center(
            child: Column(children: [
          Container(height: 18),
          _todoInputField(),
          Container(height: 30),
          _addBox(),
        ])));
  }

  Widget _todoInputField() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
          child: const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'What are you going to do?',
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

  Widget _addBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
            icon: const Icon(Icons.add),
            onPressed: () {},
            label: const Text('ADD',
                style: TextStyle(decorationThickness: 5, fontSize: 18)))
      ],
    );
  }
}
 
