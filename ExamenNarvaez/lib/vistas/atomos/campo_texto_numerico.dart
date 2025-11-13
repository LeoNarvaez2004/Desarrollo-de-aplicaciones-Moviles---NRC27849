import 'package:flutter/material.dart';

/// Campo de texto personalizado para números
class CampoTextoNumerico extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const CampoTextoNumerico({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
