// lib/ui/widgets/reusable_text_field.dart

import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?) validator;
  final void Function(String?) onSaved;

  const ReusableTextField({
    super.key,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    required this.validator,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: Icon(icon),
      ),
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
