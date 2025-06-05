import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomAuthTextFormField extends StatelessWidget {
  final String title;
  final String errorText;
  final Function(String)? onChanged;
  final bool obscureText;

  const CustomAuthTextFormField({
    required this.title,
    this.errorText = "",
    this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: smallGap),
        TextFormField(
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: "Enter $title",
            errorText: errorText.isEmpty ? null : errorText,
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
      ],
    );
  }
}
