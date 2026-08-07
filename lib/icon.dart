// import 'package:flutter/material.dart';

// class MyWidget3 extends StatelessWidget {
//   const MyWidget3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "SAYA AKAN LAWAN",
//           style: TextStyle(fontVariations: List.empty(growable: true)),
//         ),
//         backgroundColor: Colors.amber,
//         centerTitle: true,
//         actions: [Icon(Icons.home)],
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 150),
//           ElevatedButton(
//             onPressed: () {
//               debugPrint('Notifikasi Debug Console');
//               ScaffoldMessenger.of(
//                 context,
//               ).showSnackBar(const SnackBar(content: Text("Kotak disentuh")));
//             },
//             child: const Text("klik saya"),
//           ),
//           if (showImage)
//             Image.network("https://picsum.photos/200", width: 120, height: 120),

//           Text("Nilai: $counter"),
//           ElevatedButton(
//             onPressed: () {
//               // Langkah 6: Tambahkan setState di dalam fungsi aksi
//               setState(() {
//                 counter++; // Memperbarui nilai state
//               });
//             },
//             child: Text("Tambah"),
//           ),
//           IconButton(
//             icon: Icon(Icons.favorite),
//             onPressed: () {
//               debugPrint("ikon klik");
//             },
//           ),
//           TextButton(
//             onPressed: () {
//               debugPrint("tekan woii");
//             },
//             child: Text("HAHA"),
//           ),
//           InkWell(
//             onTap: () {
//               debugPrint("gambar klik");
//             },
//             child: Text("halo"),
//           ),
//           SizedBox(height: 100),
//           GestureDetector(
//             onTap: () {
//               print("Disentuh sekali");
//             },
//             onDoubleTap: () {
//               print("Disentuh dua kali");
//             },
//             onLongPress: () {
//               print("Tahan lama");
//             },
//             child: Container(
//               color: Colors.blue,
//               padding: EdgeInsets.all(10),
//               child: Text("Tekan saya", style: TextStyle(color: Colors.white)),
//             ),
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               print("FAB ditekan");
//             },
//             child: Icon(Icons.add),
//             tooltip: "Tambah Data",
//           ),
//         ],
//       ),
//     );
//     ;
//   }
// }
