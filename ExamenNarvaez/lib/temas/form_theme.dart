import 'package:flutter/material.dart';
import 'color_scheme.dart';

class FomularyTheme{
  static final campoTexto = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    labelStyle: TextStyle(
      color: Colors.black12
    ),
    prefixIconColor: ColorApp.primary,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: ColorApp.primary, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: ColorApp.accent, width: 2),
    ),
  );
}