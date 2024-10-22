import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {required this.label,
      this.isPassword = false,
      required this.controller,
      required this.validator,
      super.key});
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        isDense: true,
      ),
    );
  }
}
