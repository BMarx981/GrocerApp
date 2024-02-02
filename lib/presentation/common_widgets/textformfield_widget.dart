import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextformField extends StatelessWidget {
  const CustomTextformField(
      {super.key,
      this.controller,
      this.label = "",
      this.obscureText = false,
      this.validator,
      this.inputFormatters});

  ///This describes the textfield to the user. It is
  ///always visible even when text is entered.
  final String label;

  ///ObscureText hides the characters entered by the user.
  final bool obscureText;

  ///Allows the textifled to only except specified text
  final List<TextInputFormatter>? inputFormatters;

  ///The controller holds the text value
  final TextEditingController? controller;

  ///The validator will check the textfields contents
  final String? Function(String)? validator;

  @override
  Widget build(Object context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      validator: (value) {
        if (validator != null && value != null) {
          return validator!(value);
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text(label),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
