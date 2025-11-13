import 'package:flutter/material.dart';
import 'package:tema/controlador/cliente_controller.dart';
import '../moleculas/formulario_cliente.dart';
import '../atomos/texto_info.dart';

/// Página para ingresar datos de clientes del banco
class BancoClientePage extends StatefulWidget {
  const BancoClientePage({super.key});

  @override
  State<BancoClientePage> createState() => _BancoClientePageState();
}

class _BancoClientePageState extends State<BancoClientePage> {
  final _saldoAnteriorController = TextEditingController();
  final _comprasController = TextEditingController();
  final _pagoAnteriorController = TextEditingController();
  final _controller = ClienteController();

  @override
  void dispose() {
    _saldoAnteriorController.dispose();
    _comprasController.dispose();
    _pagoAnteriorController.dispose();
    super.dispose();
  }

  void _calcularCliente() {
    // Validar campos
    String errorSaldo = _controller.validarDato(_saldoAnteriorController.text);
    String errorCompras = _controller.validarDato(_comprasController.text);
    String errorPago = _controller.validarDato(_pagoAnteriorController.text);

    if (errorSaldo.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Saldo Anterior: $errorSaldo'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (errorCompras.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Compras: $errorCompras'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (errorPago.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pago Anterior: $errorPago'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Si todo es válido, agregar cliente
    final saldoAnterior = double.parse(_saldoAnteriorController.text);
    final compras = double.parse(_comprasController.text);
    final pagoAnterior = double.parse(_pagoAnteriorController.text);

    _controller.agregarCliente(
      saldoAnterior: saldoAnterior,
      compras: compras,
      pagoAnterior: pagoAnterior,
    );

    // Limpiar formulario
    _saldoAnteriorController.clear();
    _comprasController.clear();
    _pagoAnteriorController.clear();

    // Mostrar confirmación
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Cliente #${_controller.cantidadClientes} agregado correctamente',
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _verResultados() {
    if (_controller.cantidadClientes == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe agregar al menos un cliente'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Navegar a resultados pasando el controlador como parámetro
    Navigator.pushNamed(context, '/banco-resultados', arguments: _controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banco "Bandido de Peluche"'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Encabezado
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Sistema de Cálculo de Clientes',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    ListenableBuilder(
                      listenable: _controller,
                      builder: (context, child) {
                        return TextoInfo(
                          etiqueta: 'Clientes registrados',
                          valor: '${_controller.cantidadClientes}',
                          esDestacado: true,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Instrucciones
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Instrucciones:',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('1. Ingrese el saldo anterior del cliente'),
                    const Text('2. Ingrese el monto de compras realizadas'),
                    const Text(
                      '3. Ingrese el pago que realizó en el corte anterior',
                    ),
                    const Text('4. Presione "Calcular Cliente" para agregar'),
                    const Text('5. Agregue todos sus clientes'),
                    const Text(
                      '6. Presione "Ver Resultados" para ver el resumen',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Formulario
            FormularioCliente(
              saldoAnteriorController: _saldoAnteriorController,
              comprasController: _comprasController,
              pagoAnteriorController: _pagoAnteriorController,
              onCalcular: _calcularCliente,
            ),
            const SizedBox(height: 24),

            // Botón para ver resultados
            ElevatedButton(
              onPressed: _verResultados,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Ver Resultados'),
            ),
          ],
        ),
      ),
    );
  }
}
