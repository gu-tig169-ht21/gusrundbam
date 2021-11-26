import 'dart:convert';
import 'package:http/http.dart';
import 'todo_list.dart';

var apiLink = 'https://todoapp-api-pyq5q.ondigitalocean.app';
var apiKey = 'a863f05a-d76f-4ddd-8fb4-22f974d3b712';

class ApiResponse {
  Future<List<Todo>> getTodos() async {
    var response = await get(Uri.parse('$apiLink/todos?key=$apiKey'));
    if (response.statusCode == 200) {
      return json(response);
    } else {
      throw Exception('Kunde inte ladda listan');
    }
  }

  Future<List<Todo>> postTodo(Todo todo) async {
    Response response = await post(Uri.parse('$apiLink/todos?key=$apiKey'),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(todo));
    if (response.statusCode == 201) {
      return json(response);
    } else {
      throw Exception('Kunde inte lägga till uppgift');
    }
  }

  Future<List<Todo>> updateTodo(Todo todo) async {
    Response response = await put(
        Uri.parse('$apiLink/todos/${todo.id}?key=$apiKey'),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode(todo));
    if (response.statusCode == 200) {
      return json(response);
    } else {
      throw Exception('Kunde inte ändra uppgift');
    }
  }

  Future<List<Todo>> deleteTodo(Todo todo) async {
    Response response =
        await delete(Uri.parse('$apiLink/todos/${todo.id}?key=$apiKey'));
    if (response.statusCode == 200) {
      return json(response);
    } else {
      throw Exception('Kunde inte ta bort uppgift');
    }
  }

  List<Todo> json(response) {
    List<dynamic> listJson = jsonDecode(response.body);
    List<Todo> todoItems =
        List<Todo>.from(listJson.map((i) => Todo.fromJson(i)));
    return todoItems;
  }
}
