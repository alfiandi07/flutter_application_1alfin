import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectAlfin extends StatelessWidget {
  const ProjectAlfin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 192, 192, 192),
      body: Column(
        children: [
          Stack(),
          Padding(
            padding: EdgeInsets.all(50),
            child: Container(
              margin: EdgeInsets.all(9),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 41, 39, 39),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Padding(
                padding: EdgeInsetsGeometry.all(9),
                child: Column(mainAxisAlignment: MainAxisAlignment.start),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
