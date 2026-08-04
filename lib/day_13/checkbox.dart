import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputWidgetDay13 extends StatefulWidget {
  const InputWidgetDay13({super.key});

  @override
  State<InputWidgetDay13> createState() => _InputWidgetDay13State();
}

class _InputWidgetDay13State extends State<InputWidgetDay13> {
  bool _isCheck = false;
  bool _isOn = false;
  String? _selected;
  DateTime? _selectedTime;
  TimeOfDay? _selectedTimeOfDay;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _isOn ? Colors.black : Colors.white,
      child: Column(
        children: [
          checkboxwidget(), switchwidget(), dropdownbutton(),
          //date picker
          datetimeWidget(context),
          datepickerWidget(context),

          Text(
            _selectedTimeOfDay == null
                ? "anda belum pilih tanggal"
                : DateFormat('DD-MM-YYYY').format(
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

  Column datepickerWidget(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
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
      ],
    );
  }

  Column datetimeWidget(BuildContext context) {
    return Column(
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
              ? "anda belum pilih tanggal"
              : _selectedTime.toString(),
        ),
        Text(
          _selectedTime == null
              ? "anda belum pilih tanggal"
              : DateFormat(' MM yyyy').format(_selectedTime ?? DateTime.now()),
        ),
        Text(
          _selectedTime == null
              ? "Anda belum pilih tanggal"
              : DateFormat(
                  'EEEE, dd MMM yyyy',
                ).format(_selectedTime ?? DateTime.now()),
        ),
        Text(
          _selectedTime == null
              ? "Anda belum pilih tanggal"
              : DateFormat(
                  'EEE, dd MMMM yyyy',
                ).format(_selectedTime ?? DateTime.now()),
        ),
      ],
    );
  }

  Column dropdownbutton() {
    return Column(
      children: [
        DropdownButton(
          value: _selected,
          items: ["Merah", "Kuning", "Hijau"].map((String val) {
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
          color: _selected == "Kuning"
              ? Colors.amber
              : _selected == "Merah"
              ? Colors.redAccent
              : _selected == "Hijau"
              ? Colors.greenAccent
              : Colors.black,
        ),
      ],
    );
  }

  Column switchwidget() {
    return Column(
      children: [
        Switch(
          activeThumbColor: Colors.blue,
          inactiveThumbColor: Colors.red,
          value: _isOn,
          onChanged: (value) {
            _isOn = value ?? false;
            setState(() {});
          },
        ),
        Text(
          _isOn ? "Nyala" : "Mati",
          style: TextStyle(color: _isOn ? Colors.white : Colors.black),
        ),
        Center(),
      ],
    );
  }

  Column checkboxwidget() {
    return Column(
      children: [
        Checkbox(
          value: _isCheck,
          onChanged: (value) {
            _isCheck = value ?? false;
            setState(() {});
          },
        ),
        Text(_isCheck ? "HAHAHAHA" : "coba klik"),
        Center(),
      ],
    );
  }
}
