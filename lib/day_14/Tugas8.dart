import 'package:flutter/material.dart';
import 'package:flutter_application_1alfin/day_14/Tugas7.dart';
import 'package:flutter_application_1alfin/day_14/tentangapk.dart';

class Tugas8Day14 extends StatefulWidget {
  const Tugas8Day14({super.key});

  @override
  State<Tugas8Day14> createState() => _Tugas8Day14State();
}

class _Tugas8Day14State extends State<Tugas8Day14> {
  int _selectedBottom = 0;

  void changeBottom(int index) {
    _selectedBottom = index;
    print("ini adalah value dari $_selectedBottom");
    setState(() {});
  }

  final List<Widget> _widgetOption = [Tugas7Day14(), Tugas4Flutter()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          changeBottom(value);
        },
        currentIndex: _selectedBottom,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_blocking),
            label: "Tentang Aplikasi",
          ),
        ],
      ),

      body: _widgetOption.elementAt(_selectedBottom),
    );
  }
}
