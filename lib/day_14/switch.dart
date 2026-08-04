import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TugasSwitchAlfin extends StatefulWidget {
  const TugasSwitchAlfin({super.key});

  @override
  State<TugasSwitchAlfin> createState() => _TugasSwitchAlfinState();
}

class _TugasSwitchAlfinState extends State<TugasSwitchAlfin> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isOn
          ? const Color.fromARGB(255, 91, 90, 90)
          : const Color.fromARGB(255, 237, 232, 232),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Text(
              "Model Tampilan Layar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Switch(
              activeThumbColor: const Color.fromARGB(255, 0, 53, 80),
              inactiveThumbColor: Colors.white,
              value: _isOn,
              onChanged: (value) {
                _isOn = value ?? false;
                setState(() {});
              },
            ),
            Text(
              _isOn ? "Mode Gelap Aktif" : "Mode Terang Aktif",
              style: TextStyle(
                color: _isOn
                    ? const Color.fromARGB(255, 231, 232, 234)
                    : const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
