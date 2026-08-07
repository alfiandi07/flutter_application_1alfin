import 'package:flutter/material.dart';
import 'package:flutter_application_1alfin/Day_16/textformfield.dart';

import 'package:flutter_application_1alfin/day_15/Tugas9.dart';
import 'package:flutter_application_1alfin/day_15/Tugas9Day15.dart';
import 'package:flutter_application_1alfin/day_15/Tugas9lvl3.dart';

class DrawerDay13 extends StatefulWidget {
  const DrawerDay13({super.key});

  @override
  State<DrawerDay13> createState() => _DrawerDay13State();
}

class _DrawerDay13State extends State<DrawerDay13> {
  int _selectedBottom = 0;

  void changeBottom(int index) {
    _selectedBottom = index;
    print("ini adalah value dari $_selectedBottom");
    setState(() {});
  }

  final List<Widget> _widgetOption = [
    Tugas9Alfinlvl1(),
    Tugas9Alfinlvl2(),
    Tugas9Alfinlvl3(),
    TextformfieldDay16(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas 10 day 16")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.category_sharp),
              title: Text("Pakaian Pria Level 1"),
              onTap: () {
                changeBottom(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.category_rounded),
              title: Text("Pakaian Pria Level 2"),
              onTap: () {
                changeBottom(1);
              },
            ),

            ListTile(
              leading: Icon(Icons.category),
              title: Text("Pakaian Pria Level 3"),
              onTap: () {
                changeBottom(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.data_object_outlined),
              title: Text("TextformfieldDay16"),
              onTap: () {
                changeBottom(3);
              },
            ),
          ],
        ),
      ),
      body: _widgetOption.elementAt(_selectedBottom),
    );
  }
}
