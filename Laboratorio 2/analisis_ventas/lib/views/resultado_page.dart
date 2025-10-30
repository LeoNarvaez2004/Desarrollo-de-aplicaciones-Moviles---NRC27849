import 'package:flutter/material.dart';
import '../models/ventas_model.dart';

class ResultadoPage extends StatelessWidget {
  const ResultadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final VentasModel ventas =
        ModalRoute.of(context)!.settings.arguments as VentasModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados del Análisis'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Resumen General
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resumen General',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 20),
                    _buildRow(
                      'Total de ventas realizadas:',
                      '${ventas.getTotalVentas()}',
                    ),
                    const SizedBox(height: 8),
                    _buildRow(
                      'MONTO GLOBAL:',
                      '\$${ventas.getMontoGlobal().toStringAsFixed(2)}',
                      bold: true,
                      fontSize: 18,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Categoría 1: $10,000 o menos
            Card(
              elevation: 4,
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ventas de \$10,000 o menos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const Divider(height: 20),
                    _buildRow(
                      'Cantidad:',
                      '${ventas.getVentasMenoresOIgual10000()} ventas',
                    ),
                    const SizedBox(height: 8),
                    _buildRow(
                      'Monto total:',
                      '\$${ventas.getMontoMenoresOIgual10000().toStringAsFixed(2)}',
                      bold: true,
                    ),
                    if (ventas.getVentasMenoresOIgual10000() > 0) ...[
                      const SizedBox(height: 10),
                      const Text(
                        'Detalle:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      ...ventas.getVentasPorCategoria('menor').map(
                            (venta) => Padding(
                              padding: const EdgeInsets.only(left: 10, top: 3),
                              child: Text('• \$${venta.toStringAsFixed(2)}'),
                            ),
                          ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Categoría 2: Más de $10,000 pero menos de $20,000
            Card(
              elevation: 4,
              color: Colors.orange.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ventas entre \$10,000 y \$20,000',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const Divider(height: 20),
                    _buildRow(
                      'Cantidad:',
                      '${ventas.getVentasEntre10000y20000()} ventas',
                    ),
                    const SizedBox(height: 8),
                    _buildRow(
                      'Monto total:',
                      '\$${ventas.getMontoEntre10000y20000().toStringAsFixed(2)}',
                      bold: true,
                    ),
                    if (ventas.getVentasEntre10000y20000() > 0) ...[
                      const SizedBox(height: 10),
                      const Text(
                        'Detalle:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      ...ventas.getVentasPorCategoria('media').map(
                            (venta) => Padding(
                              padding: const EdgeInsets.only(left: 10, top: 3),
                              child: Text('• \$${venta.toStringAsFixed(2)}'),
                            ),
                          ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Categoría 3: $20,000 o más
            Card(
              elevation: 4,
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ventas de \$20,000 o más',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const Divider(height: 20),
                    _buildRow(
                      'Cantidad:',
                      '${ventas.getVentasMayoresOIgual20000()} ventas',
                    ),
                    const SizedBox(height: 8),
                    _buildRow(
                      'Monto total:',
                      '\$${ventas.getMontoMayoresOIgual20000().toStringAsFixed(2)}',
                      bold: true,
                    ),
                    if (ventas.getVentasMayoresOIgual20000() > 0) ...[
                      const SizedBox(height: 10),
                      const Text(
                        'Detalle:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      ...ventas.getVentasPorCategoria('mayor').map(
                            (venta) => Padding(
                              padding: const EdgeInsets.only(left: 10, top: 3),
                              child: Text('• \$${venta.toStringAsFixed(2)}'),
                            ),
                          ),
                    ],
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
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
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
}
