import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TugasTimeAlfin extends StatefulWidget {
  const TugasTimeAlfin({super.key});

  @override
  State<TugasTimeAlfin> createState() => _TugasTimeAlfinState();
}

class _TugasTimeAlfinState extends State<TugasTimeAlfin> {
  TimeOfDay? _selectedTimeOfDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  // firstDate: DateTime(2021),
                  // lastDate: DateTime.now(),
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    _selectedTimeOfDay = picked;
                  });
                }
              },
              child: Text("Pilih Jam"),
            ),
          ),
          Text(
            _selectedTimeOfDay == null
                ? "Anda belum memilih jam"
                : DateFormat('HH:mm').format(
                    DateTime(
                      0,
                      0,
                      0,
                      _selectedTimeOfDay!.hour,
                      _selectedTimeOfDay!.minute,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
