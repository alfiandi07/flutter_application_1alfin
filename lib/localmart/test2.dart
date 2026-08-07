import 'package:flutter/material.dart';

class TestDay2 extends StatelessWidget {
  TestDay2({super.key});

  final List<Map<String, dynamic>> categories = [
    {"title": "Makanan", "icon": Icons.restaurant},
    {"title": "Minuman", "icon": Icons.local_cafe},
    {"title": "Fashion", "icon": Icons.checkroom},
    {"title": "Elektronik", "icon": Icons.devices},
    {"title": "Kendaraan", "icon": Icons.directions_car},
    {"title": "Kesehatan", "icon": Icons.medical_services},
    {"title": "Rumah Tangga", "icon": Icons.home},
    {"title": "Kerajinan Lokal", "icon": Icons.brush},
    {"title": "Pertanian", "icon": Icons.agriculture},
    {"title": "Perikanan", "icon": Icons.set_meal},
  ];

  final List<String> collections = [
    "https://picsum.photos/400/200?1",
    "https://picsum.photos/400/200?2",
    "https://picsum.photos/400/200?3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Kategori Produk"),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari kategori atau produk...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Grid Kategori
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            categories[index]["icon"],
                            color: Colors.blue,
                            size: 28,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          categories[index]["title"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              // Judul Koleksi
              const Text(
                "Koleksi Terpilih",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              // Banner Horizontal
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: collections.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 280,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(collections[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
