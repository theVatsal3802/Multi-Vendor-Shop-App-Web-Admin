import 'package:flutter/material.dart';

class WithdrawalScreen extends StatelessWidget {
  static const routeName = "/withdraw";
  const WithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Withdraw",
        textScaler: TextScaler.noScaling,
      ),
    );
  }
}
