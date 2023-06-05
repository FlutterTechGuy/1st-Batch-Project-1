import 'package:flutter/material.dart';
import 'package:flutter_interview_test/src/core/models/todo.dart';

class TodoProvider with ChangeNotifier {
  /// this class will lift the state of the app

  /// can have a boolean flag to track the state but in this case its not need as
  /// i am trying not to use any kind of data base transactions
  ///
  ///
  /// [_todos] is the private variable for the state
  ///

  TodoProvider() {
    _todos = [];
  }
  late List<Todo> _todos;
  List<Todo> get todos => _todos;

  String addTodo(Todo todo) {
    /// [result] will track if the adding is success or not
    String result = 'OK ';
    try {
      _todos.add(todo); //adds to do
      notifyListeners(); // notifies the listners
    } catch (e) {
      result = e.toString();
    }

    return result;
  }

  String toggleDone(Todo todo) {
    /// [result] will track if the adding is success or not
    String result = 'OK ';
    try {
      // adds to do
      /// this will get the position of the passed [todo] which will later toggle
      final position = _todos.indexOf(todo);

      /// this will toggle  [todo completion]
      _todos[position].completed = !_todos[position].completed;

      notifyListeners(); // notifies the listners
    } catch (e) {
      result = e.toString();
    }

    return result;
  }

  String deleteTodo(Todo todo) {
    /// [result] will track if the adding is success or not
    String result = 'OK ';
    try {
      // adds to do
      /// this will get the position of the passed [todo] which will later toggle
      final position = _todos.indexOf(todo);

      /// this will toggle  [todo completion]
      _todos.removeAt(position);

      notifyListeners(); // notifies the listners
    } catch (e) {
      result = e.toString();
    }

    return result;
  }
}
