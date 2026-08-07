import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registrasi & Login",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF2196F3),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(244, 231, 228, 228),
                  borderRadius: BorderRadius.circular(15),
                ),

                height: 400,
                child: Padding(
                  padding: const EdgeInsetsGeometry.all(9.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Form Registrasi",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),

                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Nama Pengguna",
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      TextField(
                        decoration: InputDecoration(
                          hintText: "Email Pengguna",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      TextField(
                        decoration: InputDecoration(
                          hintText: "Telepon Pengguna",
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Masukan Password Anda",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Konfirmasi Password Anda",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.visibility),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              "Destinasti Wisata Jakarta",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3, // Menampilkan 2 kotak per baris
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: <Widget>[
                Stack(
                  alignment: AlignmentGeometry.bottomCenter,
                  children: [
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/kota tua.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      color: const Color.fromARGB(255, 135, 134, 134),
                      child: Text(
                        "Kota Tua",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentGeometry.bottomCenter,
                  children: [
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/monas.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      color: const Color.fromARGB(121, 13, 13, 13),
                      child: Text(
                        "Monas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentGeometry.bottomCenter,
                  children: [
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/dufan.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      color: const Color.fromARGB(255, 104, 103, 103),
                      child: Text(
                        "Dufan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentGeometry.bottomCenter,
                  children: [
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/planetariumJakarta.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      color: const Color.fromARGB(255, 127, 126, 126),
                      child: Text(
                        "Planetarium",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentGeometry.bottomCenter,
                  children: [
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/TMII.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      color: const Color.fromARGB(255, 130, 129, 129),
                      child: Text(
                        "TMII",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentGeometry.bottomCenter,
                  children: [
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/museum BI.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      color: const Color.fromARGB(221, 126, 126, 126),
                      child: Text(
                        "Museum BI",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
