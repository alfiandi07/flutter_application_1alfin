import 'package:flutter/material.dart';
import 'package:flutter_application_1alfin/day_13/Drawe.dart';
import 'package:flutter_application_1alfin/day_13/checkbox.dart';
import 'package:flutter_application_1alfin/day_14/Tugas7.dart';

class Tugas7day14 extends StatefulWidget {
  const Tugas7day14({super.key});

  @override
  State<Tugas7day14> createState() => _Tugas7day14State();
}

class _Tugas7day14State extends State<Tugas7day14> {
  int _selectedBottom = 0;

  void changeBottom(int index) {
    print("ini adalah value dari $_selectedBottom");
    setState(() {
      _selectedBottom = index;
    });
  }

  final List<Widget> _widgetOption = [Tugas7day14(), DrawerDay13()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Interaktif")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                changeBottom(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Pencarian"),
              onTap: () {
                changeBottom(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.abc_sharp),
              title: Text("Asal"),
              onTap: () {
                changeBottom(2);
              },
            ),
          ],
        ),
      ),
      body: _widgetOption.elementAt(_selectedBottom),
    );
  }
}
