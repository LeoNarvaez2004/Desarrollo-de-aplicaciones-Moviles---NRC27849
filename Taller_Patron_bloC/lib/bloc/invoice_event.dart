import 'package:equatable/equatable.dart';

abstract class InvoiceEvent extends Equatable {
  const InvoiceEvent();

  @override
  List<Object> get props => [];
}

class UpdatePrice1 extends InvoiceEvent {
  final double newPrice;
  const UpdatePrice1(this.newPrice);

  @override
  List<Object> get props => [newPrice];
}

class UpdatePrice2 extends InvoiceEvent {
  final double newPrice;
  const UpdatePrice2(this.newPrice);

  @override
  List<Object> get props => [newPrice];
}