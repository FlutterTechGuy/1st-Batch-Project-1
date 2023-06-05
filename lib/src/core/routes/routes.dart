import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview_test/src/core/routes/route_contants.dart';
import 'package:flutter_interview_test/src/features/todo/presentation/add_todo_screen.dart';
import 'package:flutter_interview_test/src/features/todo/presentation/todo_detail_page.dart';
import 'package:flutter_interview_test/src/features/todo/presentation/todo_view_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case RouteConstants.todoDetailViewScreen:
      final arugments = args as Map<String, dynamic>?;

      return MaterialPageRoute(
          builder: (context) => TodoDetailPage(
                todo: arugments!['todo'],
              ));
    case RouteConstants.todoListScreen:
      return MaterialPageRoute(builder: (context) => TodoViewScreen());
    case RouteConstants.todoAddScreen:
      return MaterialPageRoute(builder: (context) => AddTodoScreen());
    default:
      throw '404 Not found';
  }
}
