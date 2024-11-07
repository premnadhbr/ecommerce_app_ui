import 'package:ecommerce_appui/bloc/bloc/products_bloc.dart';
import 'package:ecommerce_appui/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc()..add(ProductsLoadedEvent()),
      child: const MaterialApp(
        title: 'Ecommerece App Ui',
        debugShowCheckedModeBanner: false,
        home: ProductScreen(),
      ),
    );
  }
}
