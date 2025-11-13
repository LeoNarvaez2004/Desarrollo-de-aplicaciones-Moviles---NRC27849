import 'package:flutter/material.dart';
import '../modelo/cliente_model.dart';

class ClienteController extends ChangeNotifier {
  final List<ClienteModel> _clientes = [];
  double _totalIntereses = 0;

  List<ClienteModel> get clientes => _clientes;
  double get totalIntereses => _totalIntereses;
  int get cantidadClientes => _clientes.length;

  /// Agrega un nuevo cliente y recalcula el total de intereses
  void agregarCliente({
    required double saldoAnterior,
    required double compras,
    required double pagoAnterior,
  }) {
    final cliente = ClienteModel(
      saldoAnterior: saldoAnterior,
      compras: compras,
      pagoAnterior: pagoAnterior,
    );

    _clientes.add(cliente);
    _calcularTotalIntereses();
    notifyListeners();
  }

  /// Calcula el total de intereses ganados por el banco
  void _calcularTotalIntereses() {
    _totalIntereses = 0;
    for (int i = 0; i < _clientes.length; i++) {
      _totalIntereses = _totalIntereses + _clientes[i].gananciaBanco;
    }
  }

  /// Limpia todos los clientes
  void limpiarClientes() {
    _clientes.clear();
    _totalIntereses = 0;
    notifyListeners();
  }

  /// Valida que los datos sean válidos
  String validarDato(String valor) {
    if (valor.trim().isEmpty) {
      return 'Ingrese un valor';
    }

    final numero = double.tryParse(valor);
    if (numero == null) {
      return 'Ingrese un número válido';
    }

    if (numero < 0) {
      return 'El valor no puede ser negativo';
    }

    return '';
  }
}
