import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders";
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Order",
        textScaler: TextScaler.noScaling,
      ),
    );
  }
}
