import 'package:flutter/material.dart';

class CustomTextformField extends StatelessWidget {
  const CustomTextformField(
      {super.key, this.label = "", this.obscureText = false});

  ///This describes the textfield to the user. It is
  ///always visible even when text is entered.
  final String label;

  ///ObscureText hides the characters entered by the user.
  final bool obscureText;

  @override
  Widget build(Object context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
          label: Text(label),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue))),
    );
  }
}
