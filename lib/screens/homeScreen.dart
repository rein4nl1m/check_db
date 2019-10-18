import 'package:check_compras/db/db_provider.dart';
import 'package:check_compras/widgets/customAppBar.dart';
import 'package:check_compras/widgets/customBodyBack.dart';
import 'package:check_compras/widgets/customSection.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final DBProvider dbProvider = DBProvider.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        CustomBodyBack(),
        CustomAppBar(title: "Check Compras!"),
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 5),
              Text(
                "Bem vindo(a) ao Check Compras!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomSection(
                      iconData: Icons.add_box,
                      title: "Itens Padrão",
                      route: "/itensScreen"),
                  CustomSection(
                      iconData: Icons.format_list_bulleted,
                      title: "Lista de Compras",
                      route: "/listaScreen")
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomSection(
                      iconData: Icons.history,
                      title: "Histórico de Compras",
                      route: "/historicoScreen"),
                  CustomSection(
                      iconData: Icons.info,
                      title: "Sobre o app",
                      route: "/sobreScreen")
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
