import 'package:flutter/material.dart';

class StackDay8 extends StatelessWidget {
  const StackDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Localmart"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 243, 162, 115),
      ),
      body: Column(
        children: [
          Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Container(color: Colors.blue, height: 400, width: 400),
              Container(color: Colors.amber, height: 300, width: 300),
              Container(color: Colors.black, height: 200, width: 200),
            ],
          ),
          Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Container(color: Colors.blue, height: 200, width: 200),
              Container(color: Colors.amber, height: 100, width: 100),
              Positioned(top: 10, left: 10, child: Text("Halo")),
            ],
          ),
        ],
      ),
    );
  }
}
