import 'package:flutter/material.dart';
import 'package:flutter_application_1alfin/day_14/Kategori.dart';
import 'package:flutter_application_1alfin/day_14/checkbox.dart';
import 'package:flutter_application_1alfin/day_14/date.dart';
import 'package:flutter_application_1alfin/day_14/switch.dart';
import 'package:flutter_application_1alfin/day_14/time.dart';

class Tugas7Day14 extends StatefulWidget {
  const Tugas7Day14({super.key});

  @override
  State<Tugas7Day14> createState() => _Tugas7Day14State();
}

class _Tugas7Day14State extends State<Tugas7Day14> {
  int _selectedBottom = 0;

  void changeBottom(int index) {
    _selectedBottom = index;
    print("Ini adalah value dari $_selectedBottom");
    setState(() {});
  }

  final List<Widget> _widgetOption = [
    CheckBoxTugas(),
    TugasSwitchAlfin(),
    TugasKategoriAlfin(),
    TugasDateAlfin(),
    TugasTimeAlfin(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Input Interaktif",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.indigo,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.check_box_outline_blank_outlined),
              title: Text("Syarat dan Ketentuan"),
              onTap: () {
                changeBottom(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.mode_outlined),
              title: Text("Mode Tampilan"),
              onTap: () {
                changeBottom(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Kategori"),
              onTap: () {
                changeBottom(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text("Pilih Tanggal"),
              onTap: () {
                changeBottom(3);
              },
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text("Atur Pengingat"),
              onTap: () {
                changeBottom(4);
              },
            ),
          ],
        ),
      ),
      body: _widgetOption.elementAt(_selectedBottom),
    );
  }
}
