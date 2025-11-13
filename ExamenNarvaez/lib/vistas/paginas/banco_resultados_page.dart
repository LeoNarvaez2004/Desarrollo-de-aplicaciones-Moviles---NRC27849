import 'package:flutter/material.dart';
import 'package:tema/controlador/cliente_controller.dart';
import '../moleculas/tarjeta_cliente.dart';

/// Página que muestra los resultados de todos los clientes
class BancoResultadosPage extends StatelessWidget {
  const BancoResultadosPage({super.key});

  String _formatoMoneda(double valor) {
    return '\$${valor.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    // Recibir el controlador desde los argumentos de la ruta
    final controller =
        ModalRoute.of(context)!.settings.arguments as ClienteController;

    int clientesMorosos = 0;
    for (int i = 0; i < controller.clientes.length; i++) {
      if (controller.clientes[i].esMoroso) {
        clientesMorosos = clientesMorosos + 1;
      }
    }
    final clientesAlDia = controller.clientes.length - clientesMorosos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados del Banco'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Resumen general
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Column(
              children: [
                Text(
                  'Resumen General',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _BuildEstadistica(
                      titulo: 'Total Clientes',
                      valor: '${controller.cantidadClientes}',
                      color: Colors.blue,
                    ),
                    _BuildEstadistica(
                      titulo: 'Morosos',
                      valor: '$clientesMorosos',
                      color: Colors.red,
                    ),
                    _BuildEstadistica(
                      titulo: 'Al Día',
                      valor: '$clientesAlDia',
                      color: Colors.green,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Total Ganancias por Intereses',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatoMoneda(controller.totalIntereses),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Lista de clientes
          Expanded(
            child: controller.clientes.isEmpty
                ? const Center(child: Text('No hay clientes registrados'))
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    itemCount: controller.clientes.length,
                    itemBuilder: (context, index) {
                      return TarjetaCliente(
                        cliente: controller.clientes[index],
                        numero: index + 1,
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: const Text('Agregar más clientes'),
      ),
    );
  }
}

class _BuildEstadistica extends StatelessWidget {
  final String titulo;
  final String valor;
  final Color color;

  const _BuildEstadistica({
    required this.titulo,
    required this.valor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          valor,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          titulo,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
