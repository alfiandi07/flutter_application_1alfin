import 'package:flutter/material.dart';

class Tugas5Alfin extends StatefulWidget {
  const Tugas5Alfin({super.key});

  @override
  State<Tugas5Alfin> createState() => _Tugas5AlfinState();
}

class _Tugas5AlfinState extends State<Tugas5Alfin> {
  bool elevated = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lab Interaksi Flutter",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("Ini tentang ElevatedBotton"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  elevated = !elevated;
                  setState(() {});
                  print("Tombol Tekan");
                },
                child: Text("Klik Saya"),
              ),
            ],
          ),
          if (elevated) const Text("Halo alfin "),
        ],
      ),
    );
  }
}
