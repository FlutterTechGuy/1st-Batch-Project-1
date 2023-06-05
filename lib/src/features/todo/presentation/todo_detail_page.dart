import 'package:flutter/material.dart';
import 'package:flutter_interview_test/src/core/models/todo.dart';
import 'package:flutter_interview_test/src/features/todo/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoDetailPage extends StatelessWidget {
  final Todo todo;
  const TodoDetailPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          todo.title,
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.read<TodoProvider>().deleteTodo(todo);
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Text(
            todo.subtitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            todo.description,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ]),
      ),
    );
  }
}
