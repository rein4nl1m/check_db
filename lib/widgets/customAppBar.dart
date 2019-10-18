import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12,
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: 75,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 30),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
