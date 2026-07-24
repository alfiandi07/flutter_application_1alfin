import 'package:flutter/material.dart';

class TugasWidget3 extends StatelessWidget {
  const TugasWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registrasi & Katalog",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
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
                  color: const Color.fromARGB(230, 193, 193, 196),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.all(9),
                height: 400,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Form Registrasi",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 6, 7, 7),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Masukan Email Anda",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
