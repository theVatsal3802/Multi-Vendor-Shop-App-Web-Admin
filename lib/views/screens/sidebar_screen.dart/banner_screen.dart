import 'package:flutter/material.dart';

class BannerScreen extends StatelessWidget {
  static const routeName = "/banners";
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Banners",
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontSize: 36,
            ),
          ),
        ],
      ),
    );
  }
}
