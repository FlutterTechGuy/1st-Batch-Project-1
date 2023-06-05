import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final bool multiline;
  final int maxLines;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    required this.controller,
    this.multiline = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: multiline ? maxLines : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Can\'t be empty';
        }
        if (value.length < 3) {
          return 'Too Short';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: const OutlineInputBorder()),
    );
  }
}
