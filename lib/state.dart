import 'package:flutter/material.dart';

class ContohStatefull extends StatefulWidget {
  const ContohStatefull({super.key});

  @override
  State<ContohStatefull> createState() => _ContohStatefullState();
}

class _ContohStatefullState extends State<ContohStatefull> {
  int counter = 0;

  bool showImage = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        TextButton(
          onPressed: () {
            setState(() {
              showImage = !showImage;
            });
          },
          child: Text(showImage ? "Sembunyikan Gambar" : "Lihat Gambar"),
        ),
        if (showImage)
          Image.network("https://picsum.photos/200", width: 120, height: 120),

        Text("Nilai: $counter"),
        ElevatedButton(
          onPressed: () {
            // Langkah 6: Tambahkan setState di dalam fungsi aksi
            setState(() {
              counter++; // Memperbarui nilai state
            });
          },
          child: Text("Tambah"),
        ),
      ],
    );
  }
}
