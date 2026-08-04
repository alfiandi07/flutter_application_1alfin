import 'package:flutter/material.dart';

class CheckBoxTugas extends StatefulWidget {
  const CheckBoxTugas({super.key});

  @override
  State<CheckBoxTugas> createState() => _CheckBoxTugasState();
}

class _CheckBoxTugasState extends State<CheckBoxTugas> {
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Padding(padding: EdgeInsetsGeometry.all(39)),
            Text(
              "Syarat dan ketentuan",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 30, width: 40),

            Text(
              "Dengan membuatakun di Aplikasi Ini, Anda mneyatakan bahwa data yang diberikan adalah benar dan lengkap,bertanggung jawab atas keamana akun dan kata sandi, serta menyetujui Syarat dan ketentuan serta kebijakan Privasi yang berlaku. Aplikasi ini berhak menangguhkan atau menghapus akun yang terbukti melanggar ketentuan penggunaan aplikasi",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _isCheck,
                  onChanged: (value) {
                    _isCheck = value ?? false;
                    setState(() {});
                    Text("Saya Menyetujui Persyaratan");
                  },
                ),
                Text("Saya menyetujui syarat \ndan ketentuan yang berlaku"),
              ],
            ),
            Text(
              _isCheck
                  ? "Pengguna Sudah di setujui"
                  : "Pengguna belum  menyetujui",
              style: TextStyle(
                color: const Color.fromARGB(255, 15, 13, 13),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
