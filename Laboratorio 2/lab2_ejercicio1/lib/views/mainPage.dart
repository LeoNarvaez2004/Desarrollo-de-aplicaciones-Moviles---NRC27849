import 'package:flutter/material.dart';
import '../controllers/venta_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = VentaController();
  final precioCtrl = TextEditingController();

  void _calcular() {
    try {
      final venta = controller.calcularVenta(precioCtrl.text);
      Navigator.pushNamed(context, '/resultado', arguments: venta);
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
      appBar: AppBar(title: const Text('Cálculo de Ventas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: precioCtrl,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Precio de venta',
                hintText: 'Ej: 2500',
              ),
            ),
            const SizedBox(height: 10),
            const Text('• IVA: 15%'),
            const Text('• Descuento: 20% (compras > \$2000)'),
            const Text('• Comisión vendedor: 10%'),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _calcular, child: const Text('Calcular')),
          ],
        ),
      ),
    );
  }
}
