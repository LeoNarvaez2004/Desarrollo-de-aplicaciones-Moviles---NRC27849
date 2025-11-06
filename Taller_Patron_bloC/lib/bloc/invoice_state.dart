import 'package:equatable/equatable.dart';

class InvoiceState extends Equatable {
  final double price1;
  final double price2;

  final double taxRate = 0.15;

  double get subtotal => price1 + price2;
  double get tax => subtotal * taxRate;
  double get total => subtotal + tax;

  const InvoiceState({
    this.price1 = 0.0,
    this.price2 = 0.0,
  });

  InvoiceState copyWith({
    double? price1,
    double? price2,
  }) {
    return InvoiceState(
      price1: price1 ?? this.price1,
      price2: price2 ?? this.price2,
    );
  }

  @override
  List<Object> get props => [
    price1,
    price2,
    subtotal,
    tax,
    total,
  ];
}