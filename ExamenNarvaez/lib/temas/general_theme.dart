import 'package:flutter/material.dart';

import 'appbar_theme.dart';
import 'buttons_theme.dart';
import 'color_scheme.dart';
import 'typo.dart';

class GeneralTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: ColorApp.primary,
      secondary: ColorApp.secondary,
      background: ColorApp.background,
      onPrimary: ColorApp.text,
      onSecondary: ColorApp.text2,
    ),
    textTheme: TipografiaApp.text,
    appBarTheme: MyAppBarTheme.estilo,
    elevatedButtonTheme: ButtonsTheme.primary,
    outlinedButtonTheme: ButtonsTheme.secondary,
    scaffoldBackgroundColor: const Color.fromARGB(255, 245, 221, 88),
  );
}
