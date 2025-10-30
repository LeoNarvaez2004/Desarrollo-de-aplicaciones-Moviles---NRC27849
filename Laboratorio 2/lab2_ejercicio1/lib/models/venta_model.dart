class VentaModel {
  final double precio;
  final double iva = 0.15;
  final double precioBase = 2000;
  final double descuento = 0.20;
  final double comisionVendedor = 0.10;
  VentaModel(this.precio);

  // Calcula el subtotal con descuento si aplica
  double calcularSubtotal() {
    if (precio > precioBase) {
      return precio - (precio * descuento);
    } else {
      return precio;
    }
  }

  // Calcula el total con IVA
  double calcularTotal() {
    double subtotal = calcularSubtotal();
    return subtotal + (subtotal * iva);
  }

  // Calcula el descuento aplicado
  double calcularDescuento() {
    if (precio > precioBase) {
      return precio * descuento;
    }
    return 0;
  }

  // Calcula el IVA del subtotal
  double calcularIVA() {
    double subtotal = calcularSubtotal();
    return subtotal * iva;
  }

  // Calcula la comisión del vendedor (sobre el subtotal)
  double calcularComision() {
    double subtotal = calcularSubtotal();
    return subtotal * comisionVendedor;
  }

  // Verifica si aplica descuento
  bool aplicaDescuento() {
    return precio > precioBase;
  }
}
