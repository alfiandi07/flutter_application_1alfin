import 'package:flutter/material.dart';

class SingelChildScrollviewDay8 extends StatelessWidget {
  const SingelChildScrollviewDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Singlechildscrollview"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.all(16),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),
                    ),
                    height: 350,
                    width: 350,
                  ),
                  Container(color: Colors.black, height: 300, width: 300),
                  Container(color: Colors.brown, height: 200, width: 200),
                ],
              ),
            ),
            Container(color: Colors.amber, height: 400, width: 400),
            Container(color: Colors.black12, height: 200, width: 200),
            Container(color: Colors.blue, height: 100, width: 100),
          ],
        ),
      ),
    );
  }
}
