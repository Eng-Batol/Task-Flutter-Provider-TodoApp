import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [
    Todo(id: 1, title: "First Todo"),
  ];

  // Add a todo to the list
  void addTodo(String title) {
    final newTodo = Todo(
      id: todos.length + 1, // Generating a new ID
      title: title,
    );
    todos.add(newTodo);
    notifyListeners(); // Notify listeners to rebuild the UI
  }

  void toggleDone(int id) {
    final todo = todos.firstWhere((todo) => todo.id == id);
    todo.done = !todo.done; // Switch the done status
    notifyListeners(); // Notify listeners to rebuild the UI
  }
}
