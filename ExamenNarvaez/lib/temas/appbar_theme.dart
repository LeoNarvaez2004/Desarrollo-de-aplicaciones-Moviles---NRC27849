import 'package:flutter/material.dart';
import 'color_scheme.dart';

class MyAppBarTheme {
  static const AppBarTheme estilo = AppBarTheme(
    backgroundColor: ColorApp.background,
    foregroundColor: ColorApp.background2,
    centerTitle: true,
    elevation: 3,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: ColorApp.text2,
    ),
  );
}