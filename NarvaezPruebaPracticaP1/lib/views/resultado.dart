import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado({super.key});

  @override
  Widget build(BuildContext context) {
    final resultado = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Resultado')),
      body: Center(
        child: Text(
          resultado,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
