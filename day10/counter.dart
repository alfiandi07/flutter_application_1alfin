import 'package:flutter/material.dart';

class CounterDay10 extends StatefulWidget {
  const CounterDay10({super.key});

  @override
  State<CounterDay10> createState() => _CounterDay10State();
}

class _CounterDay10State extends State<CounterDay10> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CounterDay10"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(counter.toString(), style: TextStyle(fontSize: 100)),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     // ElevatedButton(
          //     //   onPressed: () {
          //     //     log(counter.toString())
          //     //   },
          //     //   child: Text("Kurang"),
          //     // ),
          //     ElevatedButton(onPressed: () {}, child: Text("Back To Zero")),
          //     ElevatedButton(onPressed: () {}, child: Text("Tambah")),
          //   ],
          // ),
        ],
      ),
    );
  }
}
