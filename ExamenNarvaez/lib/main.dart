import 'package:flutter/material.dart';
import 'package:tema/temas/index.dart';
import 'package:tema/vistas/paginas/banco_cliente_page.dart';
import 'package:tema/vistas/paginas/banco_resultados_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco Bandido de Peluche',
      debugShowCheckedModeBanner: false,
      theme: GeneralTheme.light,
      initialRoute: '/',
      routes: {
        '/': (context) => const BancoClientePage(),
        '/banco-resultados': (context) => const BancoResultadosPage(),
      },
    );
  }
}
