import 'package:flutter/material.dart';

class ImageContainerDay6 extends StatelessWidget {
  const ImageContainerDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Container day 6"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: Icon(Icons.home),
      ),
      body: Column(
        children: [
          Text(
            "Adul",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 200,
            width: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage("assets/adul.jpg")),
            ),
          ),
        ],
      ),
    );
  }
}
