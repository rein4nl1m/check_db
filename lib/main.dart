import 'package:check_compras/screens/homeScreen.dart';
import 'package:check_compras/screens/itensScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Check Compras',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          '/itensScreen': (context) => ItensScreen(),
        });
  }
}
