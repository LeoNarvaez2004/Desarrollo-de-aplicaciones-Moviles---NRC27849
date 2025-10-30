import 'package:flutter/material.dart';
import '../models/escuela_model.dart';

class ResultadoPage extends StatelessWidget {
  const ResultadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final escuela = ModalRoute.of(context)!.settings.arguments as EscuelaModel;
    final promediosPorSalon = escuela.obtenerPromediosPorSalon();

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PROMEDIOS POR SALÓN',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: promediosPorSalon.length,
                itemBuilder: (context, index) {
                  final salon = promediosPorSalon[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${salon['salon']}')),
                      title: Text('Salón ${salon['salon']}'),
                      subtitle: Text('${salon['estudiantes']} estudiantes'),
                      trailing: Text(
                        '${salon['promedio'].toStringAsFixed(2)} años',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            Card(
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PROMEDIO DE TODA LA ESCUELA',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total de estudiantes: ${escuela.obtenerTotalEstudiantes()}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          '${escuela.calcularPromedioEscuela().toStringAsFixed(2)} años',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
