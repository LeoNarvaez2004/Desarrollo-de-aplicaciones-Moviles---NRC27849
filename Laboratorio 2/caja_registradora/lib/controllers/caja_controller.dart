import '../models/caja_model.dart';

class CajaController {
  CajaModel calcularCaja({
    required String b100,
    required String b50,
    required String b20,
    required String b10,
    required String b5,
    required String b1,
    required String m50c,
    required String m25c,
    required String m10c,
    required String m5c,
    required String m1c,
  }) {
    // Validar que no estén vacíos
    if (b100.isEmpty ||
        b50.isEmpty ||
        b20.isEmpty ||
        b10.isEmpty ||
        b5.isEmpty ||
        b1.isEmpty ||
        m50c.isEmpty ||
        m25c.isEmpty ||
        m10c.isEmpty ||
        m5c.isEmpty ||
        m1c.isEmpty) {
      throw Exception("Todos los campos deben estar llenos");
    }

    // Convertir y validar
    final billetes100 = int.tryParse(b100);
    final billetes50 = int.tryParse(b50);
    final billetes20 = int.tryParse(b20);
    final billetes10 = int.tryParse(b10);
    final billetes5 = int.tryParse(b5);
    final billetes1 = int.tryParse(b1);
    final monedas50c = int.tryParse(m50c);
    final monedas25c = int.tryParse(m25c);
    final monedas10c = int.tryParse(m10c);
    final monedas5c = int.tryParse(m5c);
    final monedas1c = int.tryParse(m1c);

    if (billetes100 == null ||
        billetes50 == null ||
        billetes20 == null ||
        billetes10 == null ||
        billetes5 == null ||
        billetes1 == null ||
        monedas50c == null ||
        monedas25c == null ||
        monedas10c == null ||
        monedas5c == null ||
        monedas1c == null) {
      throw Exception("Todos los valores deben ser números válidos");
    }

    if (billetes100 < 0 ||
        billetes50 < 0 ||
        billetes20 < 0 ||
        billetes10 < 0 ||
        billetes5 < 0 ||
        billetes1 < 0 ||
        monedas50c < 0 ||
        monedas25c < 0 ||
        monedas10c < 0 ||
        monedas5c < 0 ||
        monedas1c < 0) {
      throw Exception("Las cantidades no pueden ser negativas");
    }

    return CajaModel(
      billetes100: billetes100,
      billetes50: billetes50,
      billetes20: billetes20,
      billetes10: billetes10,
      billetes5: billetes5,
      billetes1: billetes1,
      monedas50c: monedas50c,
      monedas25c: monedas25c,
      monedas10c: monedas10c,
      monedas5c: monedas5c,
      monedas1c: monedas1c,
    );
  }
}
