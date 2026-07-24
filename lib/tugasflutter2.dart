import 'package:flutter/material.dart';

class TugasDay5 extends StatelessWidget {
  const TugasDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Toko"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [Text("LocalMart", style: TextStyle(fontSize: 20))],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20,
                  offset: Offset(5, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(7),
            height: 40,
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.mail_outlined),
                    SizedBox(width: 10),
                    Text("Localmart@gmail.com"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              children: [
                Icon(Icons.phone),
                Text("+6287654321"),
                Spacer(),
                Padding(padding: EdgeInsetsGeometry.only(right: 80)),
                Icon(Icons.location_on),
                Text("Jakarta, Indonesia"),
              ],
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.cyanAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: Offset(5, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    height: 100,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsetsGeometry.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                ),
                                Text(
                                  "1000+",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Terjual per bulan",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.cyanAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: Offset(5, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    height: 100,
                    width: 150,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsetsGeometry.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                ),
                                Text(
                                  "4.8/5⭐",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Penilaian Pengguna ",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Text(
                  "LocalMart merupakan aplikasi e-commerce yang dirancang sebagai wadah digital untuk membantu pelaku Usaha Mikro, Kecil, dan Menengah (UMKM) serta penjual lokal dalam memasarkan dan menjual produk secara lebih luas. Aplikasi ini hadir sebagai solusi untuk mempertemukan penjual dan konsumen dalam satu platform digital yang mudah digunakan, praktis, dan dapat diakses kapan saja",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "serif",
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.amber,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20,
                  offset: Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Image.asset(
                "assets/belanjaonline.jpg",
                fit: BoxFit.contain,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Text("halo everyone"),
                SizedBox(height: 800),
                Text("Saya akan lawan"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
