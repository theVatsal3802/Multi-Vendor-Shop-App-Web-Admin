import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = "/categories";
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Category",
        textScaler: TextScaler.noScaling,
      ),
    );
  }
}
