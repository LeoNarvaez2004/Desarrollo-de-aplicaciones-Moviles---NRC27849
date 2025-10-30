import 'package:flutter/material.dart';
import 'views/mainPage.dart';
import 'views/resultado.dart';
import 'views/ahorro_page.dart';
import 'views/ahorro_resultado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicios Lab 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuPage(),
        '/ventas': (context) => const MainPage(),
        '/resultado': (context) => const ResultadoPage(),
        '/ahorros': (context) => const AhorroPage(),
        '/ahorro-resultado': (context) => const AhorroResultadoPage(),
      },
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Principal')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/ventas'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('Ejercicio 1: Cálculo de Ventas'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/ahorros'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('Ejercicio 2: Cuenta de Ahorros'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
