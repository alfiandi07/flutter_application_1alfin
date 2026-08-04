import 'package:flutter/material.dart';

class TugasKategoriAlfin extends StatefulWidget {
  const TugasKategoriAlfin({super.key});

  @override
  State<TugasKategoriAlfin> createState() => _TugasKategoriAlfinState();
}

class _TugasKategoriAlfinState extends State<TugasKategoriAlfin> {
  String? _selected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          value: _selected,
          items: ["Elektronik", "Pakaian", "Makanan", "lainnya"].map((
            String val,
          ) {
            return DropdownMenuItem(value: val, child: Text(val));
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selected = value;
            });
          },
        ),
        Text(_selected.toString()),
        Container(
          height: 50,
          width: 50,
          color: _selected == "Elektronik"
              ? Colors.amber
              : _selected == "Pakaian"
              ? Colors.redAccent
              : _selected == "Makanan"
              ? Colors.greenAccent
              : Colors.black,
        ),
      ],
    );
  }
}
