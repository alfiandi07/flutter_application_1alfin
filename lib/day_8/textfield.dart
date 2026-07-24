import 'package:flutter/material.dart';

class TextfieldDay8 extends StatelessWidget {
  const TextfieldDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Textfield"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Masukan email anda",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Kata sandi",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          TextField(),
          TextField(),
        ],
      ),
    );
  }
}
