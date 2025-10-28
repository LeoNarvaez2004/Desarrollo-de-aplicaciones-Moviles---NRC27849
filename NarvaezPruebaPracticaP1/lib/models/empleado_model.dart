class EmpleadoModel {
  final double edadEmpleado;
  final double antiguedad;
  final double salarioBase = 35000;
  EmpleadoModel(this.edadEmpleado, this.antiguedad);
  double calcularSalario() {
    double calcularAntiguedad = (antiguedad * (antiguedad + 1)) / 2;
    return salarioBase + edadEmpleado + 100 * calcularAntiguedad;
  }
}
