import 'package:flutter/material.dart';

class NovoItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
              tag: "novoItem",
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
    );
  }
}
