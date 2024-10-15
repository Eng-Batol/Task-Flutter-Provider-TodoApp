import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;

  const TodoTile({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      trailing: Checkbox(
        value: todo.done,
        onChanged: (bool? value) {
          // Toggle the done status using the provider
          Provider.of<TodoProvider>(context, listen: false).toggleDone(todo.id);
        },
      ),
    );
  }
}
