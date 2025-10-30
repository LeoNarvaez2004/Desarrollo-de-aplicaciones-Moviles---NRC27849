import 'package:flutter/material.dart';
import '../controllers/caja_controller.dart';
import '../widgets/input_caja.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final CajaController controller = CajaController();

  // Controllers para billetes
  final TextEditingController b100Ctrl = TextEditingController();
  final TextEditingController b50Ctrl = TextEditingController();
  final TextEditingController b20Ctrl = TextEditingController();
  final TextEditingController b10Ctrl = TextEditingController();
  final TextEditingController b5Ctrl = TextEditingController();
  final TextEditingController b1Ctrl = TextEditingController();

  // Controllers para monedas
  final TextEditingController m50cCtrl = TextEditingController();
  final TextEditingController m25cCtrl = TextEditingController();
  final TextEditingController m10cCtrl = TextEditingController();
  final TextEditingController m5cCtrl = TextEditingController();
  final TextEditingController m1cCtrl = TextEditingController();

  void calcular() {
    try {
      final resultado = controller.calcularCaja(
        b100: b100Ctrl.text,
        b50: b50Ctrl.text,
        b20: b20Ctrl.text,
        b10: b10Ctrl.text,
        b5: b5Ctrl.text,
        b1: b1Ctrl.text,
        m50c: m50cCtrl.text,
        m25c: m25cCtrl.text,
        m10c: m10cCtrl.text,
        m5c: m5cCtrl.text,
        m1c: m1cCtrl.text,
      );

      Navigator.pushNamed(context, '/resultado', arguments: resultado);
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
      appBar: AppBar(
        title: const Text('Caja Registradora'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BILLETES',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            InputCaja(controller: b100Ctrl, label: '\$100', valor: '100'),
            const SizedBox(height: 10),
            InputCaja(controller: b50Ctrl, label: '\$50', valor: '50'),
            const SizedBox(height: 10),
            InputCaja(controller: b20Ctrl, label: '\$20', valor: '20'),
            const SizedBox(height: 10),
            InputCaja(controller: b10Ctrl, label: '\$10', valor: '10'),
            const SizedBox(height: 10),
            InputCaja(controller: b5Ctrl, label: '\$5', valor: '5'),
            const SizedBox(height: 10),
            InputCaja(controller: b1Ctrl, label: '\$1', valor: '1'),
            const SizedBox(height: 25),
            const Text(
              'MONEDAS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            InputCaja(controller: m50cCtrl, label: '50¢', valor: '0.50'),
            const SizedBox(height: 10),
            InputCaja(controller: m25cCtrl, label: '25¢', valor: '0.25'),
            const SizedBox(height: 10),
            InputCaja(controller: m10cCtrl, label: '10¢', valor: '0.10'),
            const SizedBox(height: 10),
            InputCaja(controller: m5cCtrl, label: '5¢', valor: '0.05'),
            const SizedBox(height: 10),
            InputCaja(controller: m1cCtrl, label: '1¢', valor: '0.01'),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calcular,
                child: const Text('Calcular Total'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    b100Ctrl.dispose();
    b50Ctrl.dispose();
    b20Ctrl.dispose();
    b10Ctrl.dispose();
    b5Ctrl.dispose();
    b1Ctrl.dispose();
    m50cCtrl.dispose();
    m25cCtrl.dispose();
    m10cCtrl.dispose();
    m5cCtrl.dispose();
    m1cCtrl.dispose();
    super.dispose();
  }
}
