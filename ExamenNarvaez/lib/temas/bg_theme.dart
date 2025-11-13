import 'package:flutter/material.dart';
import 'color_scheme.dart';

class AppBg{
  static const BoxDecoration mainGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: [ColorApp.background, ColorApp.background2],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );

  static const BoxDecoration brightBg = BoxDecoration(
    color: Colors.white
  );

  static const BoxDecoration darkBg = BoxDecoration(
      color: ColorApp.text2,
  );
}