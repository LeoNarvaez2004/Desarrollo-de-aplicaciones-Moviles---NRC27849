import '../models/escuela_model.dart';

class EscuelaController {
  EscuelaModel calcularPromedios(
    String numeroSalonesStr,
    List<String> edadesPorSalonStr,
  ) {
    if (numeroSalonesStr.isEmpty) {
      throw Exception("Debe ingresar el número de salones");
    }

    final numeroSalones = int.tryParse(numeroSalonesStr);
    if (numeroSalones == null || numeroSalones <= 0) {
      throw Exception("El número de salones debe ser mayor a 0");
    }

    if (edadesPorSalonStr.length != numeroSalones) {
      throw Exception(
        "Debe ingresar las edades para los $numeroSalones salones",
      );
    }

    List<List<int>> edadesPorSalon = [];

    for (int i = 0; i < numeroSalones; i++) {
      String edadesStr = edadesPorSalonStr[i].trim();

      if (edadesStr.isEmpty) {
        throw Exception("Debe ingresar las edades del salón ${i + 1}");
      }

      // Separar las edades por comas
      List<String> edadesStrList = edadesStr.split(',');
      List<int> edades = [];

      for (String edadStr in edadesStrList) {
        final edad = int.tryParse(edadStr.trim());
        if (edad == null || edad <= 0) {
          throw Exception(
            "Edad inválida en salón ${i + 1}: '${edadStr.trim()}'",
          );
        }
        edades.add(edad);
      }

      edadesPorSalon.add(edades);
    }

    return EscuelaModel(numeroSalones, edadesPorSalon);
  }
}
