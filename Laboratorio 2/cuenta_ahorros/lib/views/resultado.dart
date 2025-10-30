import 'package:flutter/material.dart';
import '../models/ahorro_model.dart';

class ResultadoPage extends StatelessWidget {
  const ResultadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ahorro = ModalRoute.of(context)!.settings.arguments as AhorroModel;
    final inversiones = ahorro.obtenerInversionesPorAnio();

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado de Inversión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PROYECCIÓN DE AHORROS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(
              'Depósito mensual: \$${ahorro.depositoMensual.toStringAsFixed(2)}',
            ),
            Text(
              'Depósito anual: \$${ahorro.calcularDepositoAnual().toStringAsFixed(2)}',
            ),
            Text(
              'Tasa de interés: ${(ahorro.tasaInteresAnual * 100).toStringAsFixed(0)}% anual',
            ),
            const SizedBox(height: 20),
            const Text(
              'INVERSIÓN POR AÑO',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: inversiones.length,
                itemBuilder: (context, index) {
                  final inv = inversiones[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${inv['anio']!.toInt()}'),
                      ),
                      title: Text('Año ${inv['anio']!.toInt()}'),
                      subtitle: Text('Inversión final'),
                      trailing: Text(
                        '\$${inv['inversion']!.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
