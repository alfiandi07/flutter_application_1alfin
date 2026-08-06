import 'package:flutter/material.dart';

class Tugas9Alfinlvl1 extends StatelessWidget {
  Tugas9Alfinlvl1({super.key});

  List<String> pakaianPria = [
    "T-Shirt",
    "Kemeja",
    "Polo Shirt",
    "Sweater",
    "Hoodie",
    "Jaket",
    "Blazer",
    "Celana Jeans",
    "Celana Chino",
    "Celana Pendek (Short)",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pakaianPria.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(pakaianPria[index]);
        },
      ),
    );
  }
}
