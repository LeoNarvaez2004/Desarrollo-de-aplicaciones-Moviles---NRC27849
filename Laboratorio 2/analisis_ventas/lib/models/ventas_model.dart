class VentasModel {
  final List<double> ventas;

  VentasModel(this.ventas);

  // Obtiene el número total de ventas
  int getTotalVentas() {
    return ventas.length;
  }

  // Cuenta ventas de $10,000 o menos
  int getVentasMenoresOIgual10000() {
    return ventas.where((venta) => venta <= 10000).length;
  }

  // Cuenta ventas mayores a $10,000 pero menores a $20,000
  int getVentasEntre10000y20000() {
    return ventas.where((venta) => venta > 10000 && venta < 20000).length;
  }

  // Cuenta ventas de $20,000 o más
  int getVentasMayoresOIgual20000() {
    return ventas.where((venta) => venta >= 20000).length;
  }

  // Calcula monto total de ventas de $10,000 o menos
  double getMontoMenoresOIgual10000() {
    return ventas
        .where((venta) => venta <= 10000)
        .fold(0.0, (sum, venta) => sum + venta);
  }

  // Calcula monto total de ventas entre $10,000 y $20,000
  double getMontoEntre10000y20000() {
    return ventas
        .where((venta) => venta > 10000 && venta < 20000)
        .fold(0.0, (sum, venta) => sum + venta);
  }

  // Calcula monto total de ventas de $20,000 o más
  double getMontoMayoresOIgual20000() {
    return ventas
        .where((venta) => venta >= 20000)
        .fold(0.0, (sum, venta) => sum + venta);
  }

  // Calcula el monto global de todas las ventas
  double getMontoGlobal() {
    return ventas.fold(0.0, (sum, venta) => sum + venta);
  }

  // Obtiene la lista de ventas por categoría
  List<double> getVentasPorCategoria(String categoria) {
    switch (categoria) {
      case 'menor':
        return ventas.where((venta) => venta <= 10000).toList();
      case 'media':
        return ventas.where((venta) => venta > 10000 && venta < 20000).toList();
      case 'mayor':
        return ventas.where((venta) => venta >= 20000).toList();
      default:
        return [];
    }
  }
}
