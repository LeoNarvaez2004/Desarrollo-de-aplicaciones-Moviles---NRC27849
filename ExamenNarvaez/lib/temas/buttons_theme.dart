import 'package:flutter/material.dart';
import 'color_scheme.dart';

class ButtonsTheme{
  static final primary = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorApp.primary,
      foregroundColor: ColorApp.background2,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
    ),
  );

  static final secondary = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
        foregroundColor: ColorApp.background2,
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        side: BorderSide(color: ColorApp.primary)
    ),
  );
}