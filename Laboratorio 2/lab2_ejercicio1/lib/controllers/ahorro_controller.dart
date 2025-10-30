import '../models/ahorro_model.dart';

class AhorroController {
  AhorroModel calcularAhorro(String depositoStr, String aniosStr) {
    if (depositoStr.isEmpty || aniosStr.isEmpty) {
      throw Exception("Debe ingresar todos los datos");
    }

    final deposito = double.tryParse(depositoStr);
    final anios = int.tryParse(aniosStr);

    if (deposito == null || deposito <= 0) {
      throw Exception("El depósito mensual debe ser mayor a 0");
    }

    if (anios == null || anios <= 0) {
      throw Exception("El número de años debe ser mayor a 0");
    }

    return AhorroModel(deposito, anios);
  }
}
