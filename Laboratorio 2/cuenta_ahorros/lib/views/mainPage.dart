import 'package:flutter/material.dart';
import '../controllers/ahorro_controller.dart';
import '../widgets/input_ahorro.dart';
import '../widgets/boton_calcular.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = AhorroController();
  final depositoCtrl = TextEditingController();
  final aniosCtrl = TextEditingController();

  void _calcular() {
    try {
      final ahorro = controller.calcularAhorro(
        depositoCtrl.text,
        aniosCtrl.text,
      );
      Navigator.pushNamed(context, '/resultado', arguments: ahorro);
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
            InputAhorro(
              controller: depositoCtrl,
              label: 'Depósito mensual',
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            const SizedBox(height: 10),
            InputAhorro(
              controller: aniosCtrl,
              label: 'Número de años',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            const Text('• Interés anual: 10%'),
            const Text('• Cálculo por año'),
            const SizedBox(height: 20),
            BotonCalcular(onPressed: _calcular),
          ],
        ),
      ),
    );
  }
}
