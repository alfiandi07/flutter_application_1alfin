import 'package:flutter/material.dart';

class GridviewDay8 extends StatelessWidget {
  const GridviewDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gridview"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 1 / 2,
        ),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return;
        },
      ),

      // GridView.count(
      //   crossAxisSpacing: 1,
      //   mainAxisSpacing: 2,
      //   crossAxisCount: 2,
      //   children: [
      //     Container(color: Colors.amber),
      //     Container(color: Colors.black),
      //     Container(color: Colors.brown),
      //     Container(color: Colors.deepPurple),
      //   ],
      // ),
    );
  }
}
