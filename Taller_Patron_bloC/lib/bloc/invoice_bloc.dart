import 'package:flutter_bloc/flutter_bloc.dart';
import 'invoice_event.dart';
import 'invoice_state.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {

  static const String item1Name = "Servicio de Consultoría";
  static const String item2Name = "Licencia de Software";

  InvoiceBloc() : super(const InvoiceState()) {

    on<UpdatePrice1>((event, emit) {
      emit(state.copyWith(price1: event.newPrice));
    });

    on<UpdatePrice2>((event, emit) {
      emit(state.copyWith(price2: event.newPrice));
    });
  }
}