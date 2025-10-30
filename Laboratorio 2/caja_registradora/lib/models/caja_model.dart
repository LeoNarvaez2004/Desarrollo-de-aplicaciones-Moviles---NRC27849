class CajaModel {
  // Billetes
  final int billetes100;
  final int billetes50;
  final int billetes20;
  final int billetes10;
  final int billetes5;
  final int billetes1;

  // Monedas
  final int monedas50c;
  final int monedas25c;
  final int monedas10c;
  final int monedas5c;
  final int monedas1c;

  CajaModel({
    required this.billetes100,
    required this.billetes50,
    required this.billetes20,
    required this.billetes10,
    required this.billetes5,
    required this.billetes1,
    required this.monedas50c,
    required this.monedas25c,
    required this.monedas10c,
    required this.monedas5c,
    required this.monedas1c,
  });

  // Calcula el total de billetes
  double calcularTotalBilletes() {
    return (billetes100 * 100.0) +
        (billetes50 * 50.0) +
        (billetes20 * 20.0) +
        (billetes10 * 10.0) +
        (billetes5 * 5.0) +
        (billetes1 * 1.0);
  }

  // Calcula el total de monedas
  double calcularTotalMonedas() {
    return (monedas50c * 0.50) +
        (monedas25c * 0.25) +
        (monedas10c * 0.10) +
        (monedas5c * 0.05) +
        (monedas1c * 0.01);
  }

  // Calcula el total general de la caja
  double calcularTotal() {
    return calcularTotalBilletes() + calcularTotalMonedas();
  }

  // Obtiene el total de piezas (billetes + monedas)
  int getTotalPiezas() {
    return billetes100 +
        billetes50 +
        billetes20 +
        billetes10 +
        billetes5 +
        billetes1 +
        monedas50c +
        monedas25c +
        monedas10c +
        monedas5c +
        monedas1c;
  }
}
