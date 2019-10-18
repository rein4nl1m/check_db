import 'package:flutter/material.dart';

class CustomFloatButton extends StatelessWidget {
  //final String route;
  final String label;

  const CustomFloatButton({Key key, /* this.route, */ this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 7.5,
      right: 7.5,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(25),
          child: Hero(
            tag: "novoItem",
            child: Container(
              width: 130,
              height: 50,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.add, color: Colors.white),
                  Text(label,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
