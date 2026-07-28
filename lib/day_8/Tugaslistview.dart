import 'package:flutter/material.dart';

class ListViewTugas extends StatelessWidget {
  const ListViewTugas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Laporan & Riwayat Udara",
          style: TextStyle(
            color: Colors.white, // warna tulisan
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 11, 114),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(244, 231, 228, 228),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Text(
                  "Laporan Kondisi Udara",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Titik Lokasi (Nama Jalan/Pulau)",
                    prefixIcon: const Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Skor AQI Teramati",
                    prefixIcon: const Icon(Icons.air),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Nama Pelapor",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText:
                        "Catatan Tambahan (Misal: Berkabut, Hujan Deras, Musim Kemarau)",
                    prefixIcon: const Icon(Icons.notes),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Text(
            "Riwayat Laporan Terakhir",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.warning, color: Colors.white),
              ),

              title: Text(
                "Depok",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Text(
                "AQI: 156 • Tidak Sehat\nDilaporkan 5 jam yang lalu",
              ),

              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 10),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.cloud, color: Colors.white),
              ),
              title: Text(
                "Suka Bumi",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("AQI: 95 • Sedang\nDilaporkan 4 jam lalu"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 10),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.check_circle, color: Colors.white),
              ),
              title: Text(
                "Bogor",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("AQI: 42 • Baik\nDilaporkan 1 hari lalu"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 10),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.warning_amber, color: Colors.white),
              ),
              title: Text(
                "Bandung",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("AQI: 120 • Sensitif\nDilaporkan 2 jam lalu"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 10),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.report, color: Colors.white),
              ),
              title: Text(
                "Tangerang Selatan",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "AQI: 180 • Sangat Tidak Sehat\nDilaporkan 10 menit lalu",
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
