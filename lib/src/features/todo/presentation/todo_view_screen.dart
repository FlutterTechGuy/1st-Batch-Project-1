import 'package:flutter/material.dart';
import 'package:flutter_interview_test/src/core/models/todo.dart';
import 'package:flutter_interview_test/src/core/routes/route_contants.dart';
import 'package:flutter_interview_test/src/features/todo/provider/provider.dart';
import 'package:provider/provider.dart';

class TodoViewScreen extends StatelessWidget {
 const  TodoViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: const Text('Todo App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteConstants.todoAddScreen);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Consumer<TodoProvider>(
            builder: (context, value, child) => Column(
                children: value.todos.isEmpty
                    ? const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text("Add a todo"),
                          ),
                        )
                      ]
                    : List.generate(value.todos.length, (index) {
                        Todo todo = value.todos[index];
                        bool done = todo.completed;
                        return ListTile(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteConstants.todoDetailViewScreen,
                              arguments: {"todo": todo},
                            );
                          },
                          title: Text(
                            todo.title,
                            style: TextStyle(
                                decoration:
                                    done ? TextDecoration.lineThrough : null),
                          ),
                          subtitle: Text(
                            todo.subtitle,
                            style: TextStyle(
                                decoration:
                                    done ? TextDecoration.lineThrough : null),
                          ),
                          trailing: InkWell(
                            onTap: () {
                              context.read<TodoProvider>().toggleDone(todo);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                done ? 'Undo' : 'Complete',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      fontSize: 16,
                                      color: done ? Colors.red : Colors.green,
                                    ),
                              ),
                            ),
                          ),
                        );
                      })),
          ),
        ),
      ),
    );
  }
}



