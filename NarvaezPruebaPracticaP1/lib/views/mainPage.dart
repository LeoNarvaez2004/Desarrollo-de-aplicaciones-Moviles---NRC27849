import 'package:flutter/material.dart';
import '../controllers/empleado_controller.dart';
import '../widgets/boton_calcular.dart';
import '../widgets/input_empleado.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //instanciar una clase
  final controller = EmpleadoController();
  final edadCtrl = TextEditingController();
  final antiguedadCtrl = TextEditingController();

  void _calcular() {
    final resultado = controller.CalcularSalario(
      edadCtrl.text,
      antiguedadCtrl.text,
    );
    Navigator.pushNamed(context, '/resultado', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Empleado')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputEmpleado(controller: edadCtrl, label: "Edad"),
            SizedBox(height: 10),
            InputEmpleado(controller: antiguedadCtrl, label: "Antiguedad"),
            SizedBox(height: 10),
            BotonCalcular(onPressed: _calcular),
          ],
        ),
      ),
    );
  }
}
