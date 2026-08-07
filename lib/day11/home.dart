import 'package:flutter/material.dart';

class HomeRoutingDay11 extends StatelessWidget {
  const HomeRoutingDay11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Routing Day11"),
        backgroundColor: const Color.fromARGB(255, 26, 185, 48),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Balik/Pop"),
            ),
          ),
        ],
      ),
    );
  }
}
