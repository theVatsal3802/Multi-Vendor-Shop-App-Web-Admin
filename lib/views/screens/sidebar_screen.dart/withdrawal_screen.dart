import 'package:flutter/material.dart';

class WithdrawalScreen extends StatelessWidget {
  static const routeName = "/withdraw";
  const WithdrawalScreen({super.key});

  Widget _rowWidget({
    required String text,
    required int flex,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade800,
          ),
          color: Colors.yellow.shade900,
        ),
        child: Text(
          text,
          textScaler: TextScaler.noScaling,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Manage Withdrawals",
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              _rowWidget(
                text: "Name",
                flex: 1,
              ),
              _rowWidget(
                text: "Amount",
                flex: 2,
              ),
              _rowWidget(
                text: "Bank Name",
                flex: 2,
              ),
              _rowWidget(
                text: "Bank Account Number",
                flex: 2,
              ),
              _rowWidget(
                text: "Email",
                flex: 2,
              ),
              _rowWidget(
                text: "Phone No.",
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
