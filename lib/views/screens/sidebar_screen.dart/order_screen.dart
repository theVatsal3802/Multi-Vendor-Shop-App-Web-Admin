import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders";
  const OrdersScreen({super.key});

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
            "Manage Orders",
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
                text: "Image",
                flex: 1,
              ),
              _rowWidget(
                text: "Full Name",
                flex: 3,
              ),
              _rowWidget(
                text: "City",
                flex: 2,
              ),
              _rowWidget(
                text: "State",
                flex: 2,
              ),
              _rowWidget(
                text: "Action",
                flex: 1,
              ),
              _rowWidget(
                text: "View More",
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
