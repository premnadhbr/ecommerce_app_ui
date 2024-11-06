import 'package:ecommerce_appui/screens/products_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ecommerece App Ui',
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}
