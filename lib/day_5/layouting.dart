import 'package:flutter/material.dart';

class LayoutingDay5 extends StatelessWidget {
  const LayoutingDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 171, 64, 1),
        title: Text("Hello Batch 7"),
        centerTitle: true,
        actions: [Text("1"), Text("2")],
        leading: Icon(Icons.arrow_back),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisSize: MainAxisSize.Max,
        spacing: 20,
        children: [
          Text("Hello Batch 7"),
          Text("Hello Batch 7"),
          Text("Hello Batch 7"),
          Text("Hello Batch 7"),
          Icon(Icons.star),
          Text("Hello Batch 7"),
          Text("Di bawah ini row"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.star), Text("Hello Batch 7")],
          ),
        ],
      ),
    );
  }
}
