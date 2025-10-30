import '../models/ventas_model.dart';

class VentasController {
  VentasModel procesarVentas(String ventasTexto) {
    if (ventasTexto.isEmpty) {
      throw Exception("No se ingresaron ventas");
    }

    // Dividir el texto por comas
    List<String> ventasStr = ventasTexto.split(',');

    if (ventasStr.isEmpty) {
      throw Exception("Debe ingresar al menos una venta");
    }

    List<double> ventas = [];

    for (String ventaStr in ventasStr) {
      String ventaLimpia = ventaStr.trim();

      if (ventaLimpia.isEmpty) {
        continue;
      }

      final venta = double.tryParse(ventaLimpia);

      if (venta == null) {
        throw Exception("El valor '$ventaLimpia' no es válido");
      }

      if (venta < 0) {
        throw Exception("Las ventas no pueden ser negativas");
      }

      ventas.add(venta);
    }

    if (ventas.isEmpty) {
      throw Exception("Debe ingresar al menos una venta válida");
    }

    return VentasModel(ventas);
  }
}
