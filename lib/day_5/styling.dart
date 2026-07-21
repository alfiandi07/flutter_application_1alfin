import 'package:flutter/material.dart';

class StylingDay5 extends StatelessWidget {
  const StylingDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (appBar: AppBar( backgroundColor:const Color.fromRGBO(255, 171, 64, 1),title: Text("Hello Batch 7"),
    centerTitle: true,
    actions: [Text("1"),Text("2")],
    leading: Icon(Icons.arrow_back),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisSize: MainAxisSize.Max,
      spacing: 20,
      children: [
        Text("welcome bang bang 7", style: TextStyle(fontSize: 35, //ukuranfont
        fontWeight: FontWeight.bold, //ketebalan
        color: Colors.amberAccent, //warna font,
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.dotted,
        decorationColor: const Color.fromARGB(255, 4, 122, 240),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        fontStyle: FontStyle.italic,
        ))
      ],
    )
    );
  }
}