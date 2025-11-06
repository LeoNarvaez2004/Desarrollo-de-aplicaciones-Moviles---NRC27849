import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tallerbloc/pages/invoice_page.dart';

import 'bloc/invoice_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InvoiceBloc(),
          ),
        ],
        child: const InvoicePage(),
      ),
    );
  }

}