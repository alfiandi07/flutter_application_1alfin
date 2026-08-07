import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ImageDay10 extends StatefulWidget {
  const ImageDay10({super.key});

  @override
  State<ImageDay10> createState() => _ImageDay10State();
}

class _ImageDay10State extends State<ImageDay10> {
  bool showImage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image day 10"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          showImage
              ? Image.asset("assets/adul.jpg", height: 100)
              : Image.network(
                  "https://blog.tokowahab.com/wp-content/uploads/2018/11/resep-nasi-liwet-khas-sunda.jpg",
                  height: 200,
                ),
          Container(color: Colors.blue, height: 100, width: 100),
          showImage
              ? Image.asset("assets/adul.jpg", height: 100)
              : Image.network(
                  "https://blog.tokowahab.com/wp-content/uploads/2018/11/resep-nasi-liwet-khas-sunda.jpg",
                  height: 100,
                ),
          Shimmer(
            child: Container(
              color: const Color.fromARGB(255, 59, 73, 85),
              height: 100,
              width: 100,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: showImage
                  ? const Color.fromARGB(255, 6, 89, 233)
                  : const Color.fromARGB(255, 238, 9, 9),
            ),
            onPressed: () {
              setState(() {});
              showImage = !showImage;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    !showImage
                        ? "Gambar di sembunyikan"
                        : "Gambar di tampilkan",
                  ),
                ),
              );
            },
            child: Text(
              showImage ? "sembunyikan" : "Tampilkan",
              style: TextStyle(color: Colors.brown),
            ),
          ),
        ],
      ),
    );
  }
}
