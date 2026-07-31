import 'package:flutter/material.dart';
import 'package:flutter_application_1alfin/day_8/stack.dart';
import 'package:flutter_application_1alfin/layouting.dart';
import 'package:flutter_application_1alfin/localmart/test.dart';

class BottomDay13 extends StatefulWidget {
  const BottomDay13({super.key});

  @override
  State<BottomDay13> createState() => _BottomDay13State();
}

class _BottomDay13State extends State<BottomDay13> {
  int _selectedBottom = 0;

  void changeBottom(int index) {
    _selectedBottom = index;
    print("ini adalah value dari $_selectedBottom");
    setState(() {});
  }

  final List<Widget> _widgetOption = [
    LocalMartApp(),
    LayoutingDay5(),
    StackDay8(),
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
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "school"),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Business",
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Bottom Navigation 13"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: _widgetOption.elementAt(_selectedBottom),
    );
  }
}
