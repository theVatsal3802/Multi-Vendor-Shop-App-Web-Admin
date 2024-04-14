import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "/dashboard";
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Dashboard",
        textScaler: TextScaler.noScaling,
      ),
    );
  }
}
