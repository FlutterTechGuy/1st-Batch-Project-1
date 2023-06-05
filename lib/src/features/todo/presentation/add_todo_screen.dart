import 'package:flutter/material.dart';
import 'package:flutter_interview_test/src/features/todo/presentation/widgets/form_widget.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormWidget(),
      )),
    );
  }
}
