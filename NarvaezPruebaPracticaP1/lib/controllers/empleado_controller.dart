import '../models/empleado_model.dart';

class EmpleadoController {
  String CalcularSalario(String s1, String s2) {
    if (s1.isEmpty || s2.isEmpty) {
      return 'Los campos no pueden estar vacios';
    }
    final v1 = double.tryParse(s1);
    final v2 = double.tryParse(s2);

    if (v1 == null || v2 == null || v1 <= 0 || v2 <= 0) {
      return 'Ingrese valores numericos validos mayores a cero';
    }
    if (v2 > v1) {
      return 'La antiguedad no puede ser mayor que la edad';
    }
    final empleado = EmpleadoModel(v1, v2);
    final salario = empleado.calcularSalario();

    return "El salario es: \$${salario.toString()}";
  }
}
