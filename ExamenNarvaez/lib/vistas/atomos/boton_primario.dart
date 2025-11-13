import 'package:flutter/material.dart';

/// Botón primario personalizado
class BotonPrimario extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final bool expandido;

  const BotonPrimario({
    super.key,
    required this.texto,
    required this.onPressed,
    this.expandido = false,
  });

  @override
  Widget build(BuildContext context) {
    final boton = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      child: Text(texto),
    );

    return expandido ? SizedBox(width: double.infinity, child: boton) : boton;
  }
}
