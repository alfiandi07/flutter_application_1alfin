import 'package:flutter/material.dart';

class StylingTugas5 extends StatelessWidget {
  const StylingTugas5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 171, 64, 1),
        title: Text("Profil Saya"),
        centerTitle: true,
        actions: [Text("1"), Text("2")],
        leading: Icon(Icons.people),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //mainAxisSize: MainAxisSize.Max,
        spacing: 20,
        children: [
          Align(),
          Text(
            "Alfiandi Shafar M",
            style: TextStyle(
              fontSize: 22, //ukuranfont
              fontWeight: FontWeight.bold, //ketebalan
              color: const Color.fromARGB(255, 3, 3, 3), //warna font,
              decoration: TextDecoration.underline,
              decorationColor: const Color.fromARGB(255, 4, 122, 240),
              fontStyle: FontStyle.normal,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.location_on), Text("Jakarta")],
          ),
          Text(
            "Seorang peserta pelatihan yang sedang mendalami Flutter di PPKD",
          ),
        ],
      ),
    );
  }
}
