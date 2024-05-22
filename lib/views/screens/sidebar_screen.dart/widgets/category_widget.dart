import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> categoryStream =
        FirebaseFirestore.instance.collection("categories").snapshots();
    return StreamBuilder(
      stream: categoryStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Something went wrong",
              textScaler: TextScaler.noScaling,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final category = snapshot.data!.docs[index];
            return Column(
              children: [
                Image.network(
                  category["image"],
                  fit: BoxFit.contain,
                  height: 140,
                  width: 140,
                ),
                Text(
                  category["name"],
                  textScaler: TextScaler.noScaling,
                ),
              ],
            );
          },
          itemCount: snapshot.data!.size,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      },
    );
  }
}
