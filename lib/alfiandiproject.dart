import 'package:flutter/material.dart';

class ContainerDay6 extends StatelessWidget {
  const ContainerDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container"), backgroundColor: Colors.amber),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(height: 100, width: 200, color: Colors.redAccent),
          ),

          Container(
            height: 100,
            width: 200,
            color: Colors.blue,
            child: Column(
              children: [
                Text("Nama : Alfiandi"),
                Text("Hoby : sepak bola"),
                Text("Alamat : Jakarta,Indonesia"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(16),
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 8, 238, 142),
              backgroundBlendMode: BlendMode.color,
              border: Border.all(
                color: Colors.black,
                width: 2,
                strokeAlign: 10,
                //style: BorderStyle.none,
              ),
              //borderRadius: BorderRadius.all(Radius.circular(20)),
              //borderRadius: BorderRadius.circular(20),
              //borderRadius: BorderRadius.only(
              //  topLeft: Radius.circular(20),
              // bottomRight: Radius.circular(28),
              //borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Text("Nama : Alfiandi"),
                Text("Hoby : sepak bola"),
                Text("Alamat : Jakarta,Indonesia"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
