import 'package:flutter/material.dart';

class SpacerDay6 extends StatelessWidget {
  const SpacerDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spacer day 6"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.red)),
          Spacer(),
          Expanded(child: Container(color: Colors.amber)),
          Expanded(child: Container(color: Colors.green)),
        ],

        //row
      ),
    );
  }
}
