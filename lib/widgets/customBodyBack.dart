import 'package:flutter/material.dart';

class CustomBodyBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.lightBlue, Colors.cyanAccent[400], Colors.white],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
    );
  }
}
