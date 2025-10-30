import 'package:flutter/material.dart';
import '../models/caja_model.dart';

class ResultadoPage extends StatelessWidget {
  const ResultadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CajaModel caja =
        ModalRoute.of(context)!.settings.arguments as CajaModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resumen de Caja',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 20),
                    _buildRow(
                      'Total en Billetes:',
                      '\$${caja.calcularTotalBilletes().toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 8),
                    _buildRow(
                      'Total en Monedas:',
                      '\$${caja.calcularTotalMonedas().toStringAsFixed(2)}',
                    ),
                    const Divider(height: 20),
                    _buildRow(
                      'TOTAL GENERAL:',
                      '\$${caja.calcularTotal().toStringAsFixed(2)}',
                      bold: true,
                      fontSize: 18,
                    ),
                    const SizedBox(height: 8),
                    _buildRow(
                      'Total de piezas:',
                      '${caja.getTotalPiezas()}',
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detalle de Billetes',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 15),
                    _buildDetalle('\$100', caja.billetes100, 100.0),
                    _buildDetalle('\$50', caja.billetes50, 50.0),
                    _buildDetalle('\$20', caja.billetes20, 20.0),
                    _buildDetalle('\$10', caja.billetes10, 10.0),
                    _buildDetalle('\$5', caja.billetes5, 5.0),
                    _buildDetalle('\$1', caja.billetes1, 1.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detalle de Monedas',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 15),
                    _buildDetalle('50¢', caja.monedas50c, 0.50),
                    _buildDetalle('25¢', caja.monedas25c, 0.25),
                    _buildDetalle('10¢', caja.monedas10c, 0.10),
                    _buildDetalle('5¢', caja.monedas5c, 0.05),
                    _buildDetalle('1¢', caja.monedas1c, 0.01),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value,
      {bool bold = false, double fontSize = 16}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildDetalle(String denominacion, int cantidad, double valor) {
    double total = cantidad * valor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$denominacion × $cantidad'),
          Text('\$${total.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
