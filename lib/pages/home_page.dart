import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; // Import provider
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_tile.dart';
import 'package:todo_app/provider/todo_provider.dart'; // Import TodoProvider

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context); // Access provider

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        backgroundColor: Colors.amber.shade300,
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).push('/add'),
            icon: const Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:
            todoProvider.todos.length, // Set to the length of the todos list
        itemBuilder: (BuildContext context, int index) {
          final todo = todoProvider.todos[index]; // Get the todo item
          return TodoTile(todo: todo); // Pass the todo object to TodoTile
        },
      ),
    );
  }
}
