import '../models/venta_model.dart';

class VentaController {
  VentaModel calcularVenta(String s1) {
    if (s1.isEmpty) {
      throw Exception("No se ingresó ningún dato");
    }

    final v1 = double.tryParse(s1);
    if (v1 == null || v1 <= 0) {
      throw Exception("El dato ingresado no es válido");
    }

    return VentaModel(v1);
  }
}
