import 'package:flutter/material.dart';

class ScaffoldDay5 extends StatelessWidget {
  const ScaffoldDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (appBar: AppBar( backgroundColor:const Color.fromRGBO(255, 171, 64, 1),title: Text("Hello Batch 7"),
    centerTitle: true,
    actions: [Text("1"),Text("2")],
    leading: Icon(Icons.arrow_back),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisSize: MainAxisSize.Max,
      spacing: 20,
      children: [
        Text("Hello Batch 7"), 
        Text("Hello Batch 7"),
        Text("Hello Batch 7"),
        Text("Hello Batch 7"),
        Text("Hello Batch 7")
      ],
    )
    );
  }
}