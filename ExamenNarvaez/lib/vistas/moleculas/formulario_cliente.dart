import 'package:flutter/material.dart';
import '../atomos/campo_texto_numerico.dart';
import '../atomos/boton_primario.dart';

/// Formulario para ingresar datos de un cliente
class FormularioCliente extends StatelessWidget {
  final TextEditingController saldoAnteriorController;
  final TextEditingController comprasController;
  final TextEditingController pagoAnteriorController;
  final VoidCallback onCalcular;

  const FormularioCliente({
    super.key,
    required this.saldoAnteriorController,
    required this.comprasController,
    required this.pagoAnteriorController,
    required this.onCalcular,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CampoTextoNumerico(
          label: 'Saldo Anterior',
          hint: 'Ingrese el saldo anterior',
          controller: saldoAnteriorController,
        ),
        const SizedBox(height: 16),
        CampoTextoNumerico(
          label: 'Compras Realizadas',
          hint: 'Ingrese el monto de compras',
          controller: comprasController,
        ),
        const SizedBox(height: 16),
        CampoTextoNumerico(
          label: 'Pago Anterior',
          hint: 'Ingrese el pago realizado',
          controller: pagoAnteriorController,
        ),
        const SizedBox(height: 24),
        BotonPrimario(
          texto: 'Calcular Cliente',
          onPressed: onCalcular,
          expandido: true,
        ),
      ],
    );
  }
}
