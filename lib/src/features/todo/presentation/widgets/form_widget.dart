import 'package:flutter/material.dart';
import 'package:flutter_interview_test/src/core/models/todo.dart';
import 'package:flutter_interview_test/src/features/todo/presentation/widgets/widget.dart';
import 'package:flutter_interview_test/src/features/todo/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class FormWidget extends StatelessWidget {
  FormWidget({super.key});
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _subTitleControllr = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Add Todo',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 24,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: _titleController,
            hintText: 'Enter the title',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: _subTitleControllr,
            hintText: 'Enter the subtitle',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: _descriptionController,
            multiline: true,
            maxLines: 4,
            hintText: 'Enter the description',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                String des = _descriptionController.text.trim();
                String subtitle = _subTitleControllr.text.trim();
                String title = _titleController.text.trim();

                final todo = Todo(
                  id: context.read<TodoProvider>().todos.length + 1,
                  description: des,
                  subtitle: subtitle,
                  title: title,
                );

                context.read<TodoProvider>().addTodo(todo);
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              }
            },
            buttonText: 'Add',
          )
        ],
      ),
    );
  }
}
