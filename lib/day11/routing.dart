import 'package:flutter/material.dart';
import 'package:flutter_application_1alfin/day11/home.dart';

class RoutingDay11 extends StatelessWidget {
  const RoutingDay11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routing Day 11"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Home");
              },
              child: Text("Push"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: ((context) => HomeRoutingDay11())),
                );
              },
              child: Text("PushReplacement"),
            ),
          ),
          tombolpush(context),
        ],
      ),
    );
  }

  Center tombolpush(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: ((context) => HomeRoutingDay11())),
          );
        },
        child: Text("PushReplacement"),
      ),
    );
  }
}
