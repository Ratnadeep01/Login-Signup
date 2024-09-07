import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {super.key,
      required this.hint,
      required this.controller,
      this.validator,
      this.verifyButton,
      required this.keyboardType,
      required this.obsecureText});

  TextEditingController controller;
  String hint;
  String? Function(dynamic)? validator;
  TextInputType keyboardType;
  bool obsecureText = false;
  TextButton? verifyButton;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obsecureText,
      validator: validator,
      cursorColor: const Color(0xFFA4A4A4),
      decoration: InputDecoration(
        suffix: verifyButton,
        hintText: hint,
      ),
      style: const TextStyle(color: Color(0xFFA4A4A4)),
    );
  }
}
