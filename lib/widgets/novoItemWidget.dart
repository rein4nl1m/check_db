import 'package:flutter/material.dart';

class NovoItemWidget extends StatefulWidget {
  @override
  _NovoItemWidgetState createState() => _NovoItemWidgetState();
}

class _NovoItemWidgetState extends State<NovoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Hero(
        tag: "novoItem",
        child: Container(
          height: MediaQuery.of(context).size.height * .4,
          color: Colors.white,
        ),
      ),
    );
  }
}
