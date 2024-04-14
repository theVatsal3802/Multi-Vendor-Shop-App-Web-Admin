import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = "/products";
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Products",
        textScaler: TextScaler.noScaling,
      ),
    );
  }
}
