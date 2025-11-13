import 'package:flutter/material.dart';
import '../../modelo/cliente_model.dart';
import '../atomos/texto_info.dart';

/// Tarjeta que muestra la información de un cliente
class TarjetaCliente extends StatelessWidget {
  final ClienteModel cliente;
  final int numero;

  const TarjetaCliente({
    super.key,
    required this.cliente,
    required this.numero,
  });

  String _formatoMoneda(double valor) {
    return '\$${valor.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: cliente.esMoroso ? Colors.red : Colors.green,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cliente #$numero',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Chip(
                    label: Text(
                      cliente.esMoroso ? 'MOROSO' : 'AL DÍA',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: cliente.esMoroso
                        ? Colors.red
                        : Colors.green,
                  ),
                ],
              ),
              const Divider(height: 24),

              // Datos iniciales
              Text(
                'Datos Iniciales',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextoInfo(
                etiqueta: 'Saldo Anterior',
                valor: _formatoMoneda(cliente.saldoAnterior),
              ),
              TextoInfo(
                etiqueta: 'Compras',
                valor: _formatoMoneda(cliente.compras),
              ),
              TextoInfo(
                etiqueta: 'Pago Anterior',
                valor: _formatoMoneda(cliente.pagoAnterior),
              ),

              const Divider(height: 24),

              // Cálculos
              Text(
                'Cálculos',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextoInfo(
                etiqueta: 'Saldo Actual',
                valor: _formatoMoneda(cliente.saldoActual),
                esDestacado: true,
                color: Theme.of(context).colorScheme.primary,
              ),
              TextoInfo(
                etiqueta: 'Pago Mínimo (15%)',
                valor: _formatoMoneda(cliente.pagoMinimo),
              ),
              TextoInfo(
                etiqueta: 'Pago Total sin Intereses (85%)',
                valor: _formatoMoneda(cliente.pagoTotal),
              ),

              if (cliente.esMoroso) ...[
                const Divider(height: 24),
                Text(
                  'Penalizaciones',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                TextoInfo(
                  etiqueta: 'Interés (12%)',
                  valor: _formatoMoneda(cliente.interes),
                  color: Colors.red,
                ),
                TextoInfo(
                  etiqueta: 'Multa',
                  valor: _formatoMoneda(cliente.multa),
                  color: Colors.red,
                ),
                TextoInfo(
                  etiqueta: 'Ganancia del Banco',
                  valor: _formatoMoneda(cliente.gananciaBanco),
                  esDestacado: true,
                  color: Colors.red.shade900,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
