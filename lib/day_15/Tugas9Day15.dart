import 'package:flutter/material.dart';

class Tugas9Alfinlvl2 extends StatelessWidget {
  Tugas9Alfinlvl2({super.key});
  List<Map<String, dynamic>> dataProduk = [
    {"nama": "T-Shirt", "harga": 85000, "Icon": Icons.checkroom},
    {"nama": "Kemeja", "harga": 150000, "Icon": Icons.dry_cleaning},
    {"nama": "Polo Shirt", "harga": 120000, "Icon": Icons.checkroom},
    {"nama": "Sweater", "harga": 230000, "Icon": Icons.checkroom_outlined},
    {"nama": "Hoodie", "harga": 145000, "Icon": Icons.style},
    {"nama": "Jaket", "harga": 180000, "Icon": Icons.dry_cleaning_outlined},
    {"nama": "Blazer", "harga": 220000, "Icon": Icons.work_outline},
    {"nama": "Celana Jeans", "harga": 150000, "Icon": Icons.content_cut},
    {"nama": "Celana Chino", "harga": 120000, "Icon": Icons.straighten},
    {
      "nama": "Celana Pendek",
      "harga": 45000,
      "Icon": Icons.content_cut_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dataProduk.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(dataProduk[index]["nama"]),
            leading: Icon(dataProduk[index]["Icon"]),
            trailing: Text(dataProduk[index]["harga"].toString()),
          );
        },
      ),
    );
  }
}
