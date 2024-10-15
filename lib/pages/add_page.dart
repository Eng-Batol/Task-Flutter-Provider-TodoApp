import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'package:todo_app/provider/todo_provider.dart'; // Import TodoProvider

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  final todoController =
      TextEditingController(); // Correct TextEditingController name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
        backgroundColor: Colors.amber.shade300,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                controller: todoController, // Attach todoController
                decoration: InputDecoration(
                  hintText: 'Your todo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Access TodoProvider and add new todo
                final todoProvider =
                    Provider.of<TodoProvider>(context, listen: false);
                todoProvider.addTodo(todoController.text); // Add the new todo
                GoRouter.of(context)
                    .pop(); // Go back to the home page after adding
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.amber.shade300),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Add"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
