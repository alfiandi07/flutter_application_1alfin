import 'package:flutter/material.dart';

class Tugas4Flutter extends StatelessWidget {
  const Tugas4Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Halaman Utama",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(9),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.all(10),
              height: 400,
              width: 500,
              child: Padding(
                padding: const EdgeInsetsGeometry.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Tentang Aplikasi",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "LocalMart adalah aplikasi e-commerce yang menghubungkan pembeli dengan pelaku UMKM dan toko lokal di seluruh Indonesia. Melalui LocalMart, pengguna dapat menemukan berbagai produk berkualitas dengan harga yang kompetitif sekaligus mendukung pertumbuhan bisnis lokal. Aplikasi ini dirancang dengan tampilan yang mudah digunakan, proses transaksi yang aman, serta fitur pencarian, keranjang belanja, dan pelacakan pesanan untuk memberikan pengalaman berbelanja yang praktis, cepat, dan nyaman.",
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
