import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final Function(String)? onChanged;
  final String initialValue;

  CustomTextArea({
    required this.hint,
    this.onChanged,
    this.initialValue = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        maxLines: 10,
        decoration: InputDecoration(
          hintText: "Enter $hint",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
