class AhorroModel {
  final double depositoMensual;
  final int numeroAnios;
  final double tasaInteresAnual = 0.10; // 10% anual

  AhorroModel(this.depositoMensual, this.numeroAnios);

  // Calcula el total de depósitos en un año (12 meses)
  double calcularDepositoAnual() {
    return depositoMensual * 12;
  }

  // Calcula el interés ganado en un año sobre el capital acumulado
  double calcularInteresAnual(double capitalAcumulado) {
    return capitalAcumulado * tasaInteresAnual;
  }

  // Calcula la inversión final al terminar un año específico
  double calcularInversionFinalAnio(int anio) {
    double capital = 0;

    for (int i = 1; i <= anio; i++) {
      // Agregar los depósitos mensuales del año
      capital += calcularDepositoAnual();
      // Agregar el interés ganado sobre el capital acumulado al final del año
      double interes = capital * tasaInteresAnual;
      capital += interes;
    }

    return capital;
  }

  // Genera una lista con la inversión final de cada año
  List<Map<String, double>> obtenerInversionesPorAnio() {
    List<Map<String, double>> inversiones = [];

    for (int i = 1; i <= numeroAnios; i++) {
      double inversionFinal = calcularInversionFinalAnio(i);
      inversiones.add({'anio': i.toDouble(), 'inversion': inversionFinal});
    }

    return inversiones;
  }
}
