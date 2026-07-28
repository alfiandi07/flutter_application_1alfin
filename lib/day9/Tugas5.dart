import 'package:flutter/material.dart';

class TugasDay9 extends StatefulWidget {
  const TugasDay9({super.key});

  @override
  State<TugasDay9> createState() => _Day9State();
}

class _Day9State extends State<TugasDay9> {
  bool showSecret = false;
  bool isFavorite = false;
  bool showDescription = false;

  int counter = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Interaksi Flutter"), centerTitle: true),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.remove),
        onPressed: () {
          setState(() {
            counter--;
          });
          print("Counter dikurangi");
        },
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// ElevatedButton
              const Text("ini tentang ElevatedButton:"),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showSecret = !showSecret;
                  });
                },
                child: const Text("Klik Saya!"),
              ),

              if (showSecret)
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Halo, saya Developer!",
                    style: TextStyle(fontSize: 18),
                  ),
                ),

              const SizedBox(height: 30),

              /// IconButton
              const Text("ini tentang IconButton:"),

              IconButton(
                iconSize: 45,
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),

              Text(
                isFavorite ? "Disukai!" : "Belum Disukai",
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 30),

              /// TextButton
              const Text("ini tentang TextButton:"),

              TextButton(
                onPressed: () {
                  setState(() {
                    showDescription = !showDescription;
                  });
                },
                child: const Text("Lihat Deskripsi"),
              ),

              if (showDescription)
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Flutter adalah framework dari Google untuk membuat aplikasi Android, iOS, Web, dan Desktop menggunakan satu kode program.",
                    textAlign: TextAlign.center,
                  ),
                ),

              const SizedBox(height: 30),

              /// InkWell
              const Text("ini tentang InkWell:"),

              InkWell(
                onTap: () {
                  print("Sentuhan terdeteksi");

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Sentuhan terdeteksi!")),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Sentuh Kotak Ini",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// GestureDetector
              const Text("ini tentang GestureDetector:"),

              GestureDetector(
                onTap: () {
                  setState(() {
                    counter += 1;
                  });

                  print("Ditekan sekali");
                },

                onDoubleTap: () {
                  setState(() {
                    counter += 2;
                  });

                  print("Ditekan dua kali");
                },

                onLongPress: () {
                  setState(() {
                    counter += 3;
                  });

                  print("Tahan lama");
                },

                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Center(
                    child: Text(
                      "Angka: $counter",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "• Tap = +1\n"
                "• Double Tap = +2\n"
                "• Long Press = +3",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
