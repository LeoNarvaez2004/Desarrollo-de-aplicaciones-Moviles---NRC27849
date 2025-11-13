class ClienteModel {
  final double saldoAnterior;
  final double compras;
  final double pagoAnterior;
  double saldoActual = 0;
  double pagoMinimo = 0;
  double pagoTotal = 0;
  double interes = 0;
  double multa = 0;
  bool esMoroso = false;

  ClienteModel({
    required this.saldoAnterior,
    required this.compras,
    required this.pagoAnterior,
  }) {
    calcularSaldoActual();
    calcularPagos();
    calcularInteres();
  }

  /// Calcula el saldo actual
  void calcularSaldoActual() {
    saldoActual = saldoAnterior + compras - pagoAnterior;
    if (saldoActual < 0) saldoActual = 0;
  }

  void calcularPagos() {
    pagoMinimo = saldoActual * 0.15;
    pagoTotal = saldoActual * 0.85;
  }

  void calcularInteres() {
    // Si el pago anterior fue menor al pago mínimo que debía, es moroso
    double pagoMinimoAnterior = saldoAnterior * 0.15;

    if (pagoAnterior < pagoMinimoAnterior && saldoAnterior > 0) {
      esMoroso = true;
      interes = saldoActual * 0.12;
      multa = 200;
      saldoActual = saldoActual + interes + multa;
      pagoMinimo = saldoActual * 0.15;
      pagoTotal = saldoActual * 0.85;
    }
  }

  /// Retorna el total de ganancias del banco (intereses + multa)
  double get gananciaBanco => interes + multa;

  Map<String, dynamic> toJson() {
    return {
      'saldoAnterior': saldoAnterior,
      'compras': compras,
      'pagoAnterior': pagoAnterior,
      'saldoActual': saldoActual,
      'pagoMinimo': pagoMinimo,
      'pagoTotal': pagoTotal,
      'interes': interes,
      'multa': multa,
      'esMoroso': esMoroso,
      'gananciaBanco': gananciaBanco,
    };
  }
}
