import 'package:flutter/material.dart';
import 'package:narvaezpruebapracticap1/views/mainPage.dart';
import 'package:narvaezpruebapracticap1/views/resultado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cálculo de Salario Empleado',
      routes: {
        '/': (context) => MainPage(),
        '/resultado': (context) => Resultado(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
    );
  }
}
