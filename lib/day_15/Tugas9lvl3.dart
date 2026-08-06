import 'package:flutter/material.dart';

class Tugas9Alfinlvl3 extends StatelessWidget {
  Tugas9Alfinlvl3({super.key});
  List<Map<String, dynamic>> pakaianPria = [
    {
      "nama": "T-Shirt",
      "deskripsi":
          "Dengan potongan Regular Fit yang pas di badan, t-shirt ini memberikan ruang gerak bebas untuk menemani segala aktivitasmu, mulai dari nongkrong santai, kuliah, hingga pelapis outer favoritmu",
      "gambar": "assets/images/baju polos.jpg",
    },
    {
      "nama": "Kemeja",
      "deskripsi":
          "Kemeja pria lengan panjang/pendek dengan bahan katun premium yang lembut, dingin, dan nyaman dipakai seharian. Cocok untuk acara formal, kuliah, maupun kerja kantor",
      "gambar": "assets/images/Kemeja.jpg",
    },
    {
      "nama": "Polo Shirt",
      "deskripsi":
          "Didesain dengan estetika minimalis modern, polo shirt ini memberikan siluet tubuh yang tegap dan maskulin. Dibuat dari benang katun pilihan berteknologi breathable, menjaga tubuh tetap sejuk sepanjang hari di berbagai cuaca.",
      "gambar": "assets/images/Polo.jpg",
    },
    {
      "nama": "Sweater",
      "deskripsi":
          "Sweater crewneck pria polos berbahan cotton fleece tebal dan lembut. Sangat nyaman, adem, dan pas untuk melindungi tubuh dari cuaca dingin atau angin malam. Desain simpel elegan untuk OOTD sehari-hari!",
      "gambar": "assets/images/sweater.jpg",
    },
    {
      "nama": "Hoodie",
      "deskripsi":
          "Hoodie pria polos berbahan cotton fleece tebal, halus, dan adem. Dilengkapi saku kangguru dan kupluk bertali. Sangat nyaman untuk dipake kuliah, nongkrong, atau naik motor!",
      "gambar": "assets/images/Hoodie.jpg",
    },
    {
      "nama": "Jaket",
      "deskripsi":
          "Jaket pria kasual berbahan premium yang nyaman, adem, dan tahan angin. Cocok untuk kuliah, nongkrong, hingga berkendara sehari-hari. Pilihan terbaik untuk tampil maskulin dan rapi!",
      "gambar": "assets/images/jaket.jpg",
    },
    {
      "nama": "Blazer",
      "deskripsi":
          "Blazer pria formal & semi-formal berbahan premium tebal dengan furing dalam halus. Tidak gampang kusut, adem, dan memberikan siluet tegap rapi. Cocok untuk kerja, kondangan, wisuda, atau acara formal lainnya",
      "gambar": "assets/images/balzer.jpg",
    },
    {
      "nama": "Celana Jeans",
      "deskripsi":
          "Celana jeans pria berbahan denim premium tebal, adem, dan nyaman dipakai harian. Potongan rapi dan presisi, sangat cocok untuk kuliah, kerja kasual, hingga jalan-jalan santai.",
      "gambar": "assets/images/celana jeans.jpg",
    },
    {
      "nama": "Celana Chino",
      "deskripsi":
          "Celana chino pria bahan cotton twill stretch premium. Melar, halus, adem, dan tidak kaku. Cocok dipakai untuk kerja kasual, kuliah, kondangan, hingga nongkrong harian",
      "gambar": "assets/images/Douglas Chino.jpg",
    },
    {
      "nama": "Celana Pendek",
      "deskripsi":
          "Celana pendek pria bahan cotton twill stretch/sweat premium. Melar, adem, dan super nyaman untuk harian, nongkrong, atau liburan. Tampil santai tapi tetap cool",
      "gambar": 'assets/images/celana pendek.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pakaianPria.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(pakaianPria[index]["nama"]),
            subtitle: Text(pakaianPria[index]["deskripsi"]),
            trailing: Image.asset(pakaianPria[index]["gambar"]),
          );
        },
      ),
    );
  }
}
