import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TugasDateAlfin extends StatefulWidget {
  const TugasDateAlfin({super.key});

  @override
  State<TugasDateAlfin> createState() => _TugasDateAlfinState();
}

class _TugasDateAlfinState extends State<TugasDateAlfin> {
  DateTime? _selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2021),
                  lastDate: DateTime.now(),
                  initialDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() {
                    _selectedTime = picked;
                  });
                }
              },
              child: Text("Pilih Tanggal"),
            ),
            Text(
              _selectedTime == null
                  ? "Anda belum pilih tanggal"
                  : DateFormat(
                      "'Tanggal hari ini' dd MM yyyy",
                    ).format(_selectedTime ?? DateTime.now()),
            ),
          ],
        ),
      ),
    );
  }
}
