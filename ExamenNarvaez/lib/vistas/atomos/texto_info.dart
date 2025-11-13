import 'package:flutter/material.dart';

/// Texto de información personalizado
class TextoInfo extends StatelessWidget {
  final String etiqueta;
  final String valor;
  final bool esDestacado;
  final Color? color;

  const TextoInfo({
    super.key,
    required this.etiqueta,
    required this.valor,
    this.esDestacado = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: '$etiqueta: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: esDestacado ? 16 : 14,
            ),
          ),
          TextSpan(
            text: valor,
            style: TextStyle(
              fontSize: esDestacado ? 16 : 14,
              color: color,
              fontWeight: esDestacado ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
