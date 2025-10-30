import 'package:flutter/material.dart';
import '../models/venta_model.dart';

class ResultadoPage extends StatelessWidget {
  const ResultadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final venta = ModalRoute.of(context)!.settings.arguments as VentaModel;

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado de la Venta')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FACTURA DE VENTA',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text('Precio Original: \$${venta.precio.toStringAsFixed(2)}'),
            if (venta.aplicaDescuento())
              Text(
                'Descuento (20%): -\$${venta.calcularDescuento().toStringAsFixed(2)}',
              ),
            Text('Subtotal: \$${venta.calcularSubtotal().toStringAsFixed(2)}'),
            Text('IVA (15%): \$${venta.calcularIVA().toStringAsFixed(2)}'),
            const Divider(),
            Text(
              'TOTAL A PAGAR: \$${venta.calcularTotal().toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'COMISIÓN VENDEDOR',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(
              'Comisión: \$${venta.calcularComision().toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
