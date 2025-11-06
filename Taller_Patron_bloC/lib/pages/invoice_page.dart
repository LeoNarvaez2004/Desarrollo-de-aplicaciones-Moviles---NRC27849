import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/invoice_bloc.dart'; // Asegúrate que la ruta sea correcta
import '../bloc/invoice_event.dart';
import '../bloc/invoice_state.dart';
import '../model/invoice_model.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Provee el BLoC al árbol de widgets
    return BlocProvider(
      create: (context) => InvoiceBloc(),
      child: const InvoiceView(),
    );
  }
}

class InvoiceView extends StatelessWidget {
  const InvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Obtiene el BLoC para despachar eventos
    final invoiceBloc = context.read<InvoiceBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Factura Simplificada BLoC'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Modifica los precios para calcular la factura automáticamente.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const Divider(height: 30),

            // --- Campo de Entrada para Item 1 (price1) ---
            _PriceInputField(
              title: InvoiceBloc.item1Name,
              initialValue: invoiceBloc.state.price1,
              onChanged: (value) {
                // Despacha el evento UpdatePrice1 al BLoC
                invoiceBloc.add(UpdatePrice1(value));
              },
            ),

            const SizedBox(height: 20),

            // --- Campo de Entrada para Item 2 (price2) ---
            _PriceInputField(
              title: InvoiceBloc.item2Name,
              initialValue: invoiceBloc.state.price2,
              onChanged: (value) {
                // Despacha el evento UpdatePrice2 al BLoC
                invoiceBloc.add(UpdatePrice2(value));
              },
            ),

            const Divider(height: 40, thickness: 2),

            // --- Sección de Totales (Escucha los cambios de Estado) ---
            const Text(
              'RESUMEN DE LA FACTURA',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo
              ),
            ),
            const SizedBox(height: 10),

            // 3. BlocBuilder: Reconstruye solo esta sección cuando el estado cambia
            BlocBuilder<InvoiceBloc, InvoiceState>(
              builder: (context, state) {
                return Column(
                  children: [
                    _TotalRow(
                      label: 'Subtotal:',
                      value: state.subtotal,
                    ),
                    _TotalRow(
                      label: 'Impuesto (15%):',
                      value: state.tax,
                      isTax: true,
                    ),
                    const Divider(color: Colors.grey, height: 15),
                    _TotalRow(
                      label: 'TOTAL A PAGAR:',
                      value: state.total,
                      isTotal: true,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TotalRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isTax;
  final bool isTotal;

  const _TotalRow({
    required this.label,
    required this.value,
    this.isTax = false,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 20 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.indigo.shade900 : (isTax ? Colors.redAccent : Colors.black),
            ),
          ),
          Text(
            '\$${value.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: isTotal ? 22 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color: isTotal ? Colors.indigo.shade900 : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceInputField extends StatelessWidget {
  final String title;
  final double initialValue;
  final ValueChanged<double> onChanged;

  const _PriceInputField({
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue == 0.0 ? '' : initialValue.toStringAsFixed(2),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            prefixText: '\$',
            labelText: 'Introduce el precio',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          ),
          onChanged: (text) {
            // Convierte el texto a double. Si falla, usa 0.0.
            final value = double.tryParse(text) ?? 0.0;
            onChanged(value);
          },
        ),
      ],
    );
  }
}