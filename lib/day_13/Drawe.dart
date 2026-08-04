import 'package:flutter/material.dart';
import 'package:flutter_application_1alfin/alfiandiproject.dart';
import 'package:flutter_application_1alfin/day_13/checkbox.dart';
import 'package:flutter_application_1alfin/day_15/list.dart';
import 'package:flutter_application_1alfin/day_15/list_of_map.dart';
import 'package:flutter_application_1alfin/day_15/model/listmodel.dart';
import 'package:flutter_application_1alfin/localmart/test.dart';
import 'package:flutter_application_1alfin/localmart/test2.dart';

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
    ListDataDay15(),
    ListDataDay15(),
    ListOfMapDay15(),
    ListOfModel(),
  ];

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
            icon: Icon(Icons.grid_view_rounded),
            label: "Kategori",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: "Buah"),
        ],
      ),

      appBar: AppBar(title: Text("Tester")),
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
              title: Text("ListDataDay15"),
              onTap: () {
                changeBottom(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.abc_sharp),
              title: Text("ListOfModel"),
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
