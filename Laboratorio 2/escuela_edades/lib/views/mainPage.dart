import 'package:flutter/material.dart';
import '../controllers/escuela_controller.dart';
import '../widgets/input_escuela.dart';
import '../widgets/boton_calcular.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = EscuelaController();
  final numeroSalonesCtrl = TextEditingController();
  List<TextEditingController> edadesControllers = [];
  int numeroSalones = 0;

  void _generarCamposSalones() {
    final num = int.tryParse(numeroSalonesCtrl.text);
    if (num == null || num <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingrese un número válido de salones'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      numeroSalones = num;
      edadesControllers = List.generate(
        numeroSalones,
        (index) => TextEditingController(),
      );
    });
  }

  void _calcular() {
    try {
      List<String> edadesPorSalon = edadesControllers
          .map((ctrl) => ctrl.text)
          .toList();

      final escuela = controller.calcularPromedios(
        numeroSalonesCtrl.text,
        edadesPorSalon,
      );
      Navigator.pushNamed(context, '/resultado', arguments: escuela);
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
      appBar: AppBar(title: const Text('Promedios de Escuela')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputEscuela(
              controller: numeroSalonesCtrl,
              label: 'Número de salones',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _generarCamposSalones,
              child: const Text('Generar campos'),
            ),
            const SizedBox(height: 20),
            if (numeroSalones > 0) ...[
              const Text(
                'Ingrese las edades separadas por comas',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: numeroSalones,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InputEscuela(
                        controller: edadesControllers[index],
                        label: 'Salón ${index + 1} (ej: 15,16,14,15)',
                        keyboardType: TextInputType.text,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              BotonCalcular(onPressed: _calcular),
            ],
          ],
        ),
      ),
    );
  }
}
