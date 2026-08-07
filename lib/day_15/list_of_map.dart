import 'package:flutter/material.dart';

class ListOfMapDay15 extends StatelessWidget {
  ListOfMapDay15({super.key});
  List<Map<String, dynamic>> dataProduk = [
    {"nama": "T-Shirt", "harga": 85000, "asal": "Jepang"},
    {"nama": "Kemeja", "harga": 150000, "asal": "Indonesia"},
    {"nama": "Polo Shirt", "harga": 120000, "asal": "Spanyol"},
    {"nama": "Sweater", "harga": 230000, "asal": "India"},
    {"nama": "Hoodie", "harga": 145000, "asal": "Italia"},
    {"nama": "Jaket", "harga": 180000, "asal": "Brazil"},
    {"nama": "Blazer", "harga": 220000, "asal": "Australia"},
    {"nama": "Celana Jeans", "harga": 150000, "asal": "Selandia Baru"},
    {"nama": "Celana Chino", "harga": 120000, "icon": "Filipina"},
    {"nama": "Celana Pendek", "harga": 45000, "icon": "Icons.abc_sharp"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dataProduk.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(dataProduk[index]["nama"]),
            subtitle: Text(dataProduk[index]["icon"]),
            trailing: Text(dataProduk[index]["harga"].toString()),
          );
        },
      ),
    );
  }
}
