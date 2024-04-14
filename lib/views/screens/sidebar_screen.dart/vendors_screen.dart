import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  static const routeName = "/vendors";
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Vendors",
        textScaler: TextScaler.noScaling,
      ),
    );
  }
}
