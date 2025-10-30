import 'package:flutter/material.dart';
import '../controllers/ahorro_controller.dart';

class AhorroPage extends StatefulWidget {
  const AhorroPage({super.key});

  @override
  State<AhorroPage> createState() => _AhorroPageState();
}

class _AhorroPageState extends State<AhorroPage> {
  final controller = AhorroController();
  final depositoCtrl = TextEditingController();
  final aniosCtrl = TextEditingController();

  void _calcular() {
    try {
      final ahorro = controller.calcularAhorro(
        depositoCtrl.text,
        aniosCtrl.text,
      );
      Navigator.pushNamed(context, '/ahorro-resultado', arguments: ahorro);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceAll('Exception: ', '')),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cuenta de Ahorros')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: depositoCtrl,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Depósito mensual',
                hintText: 'Ej: 500',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: aniosCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número de años',
                hintText: 'Ej: 5',
              ),
            ),
            const SizedBox(height: 10),
            const Text('• Interés anual: 10%'),
            const Text('• Cálculo por año'),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _calcular, child: const Text('Calcular')),
          ],
        ),
      ),
    );
  }
}
