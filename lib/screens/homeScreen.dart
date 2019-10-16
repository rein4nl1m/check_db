import 'package:check_compras/db/db_provider.dart';
import 'package:check_compras/widgets/customSection.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final DBProvider dbProvider = DBProvider.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Check Compras!"), centerTitle: true, elevation: 10),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
                  route: "/itensScreen",
                ),
                CustomSection(
                  iconData: Icons.format_list_bulleted,
                  title: "Lista de Compras",
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomSection(
                  iconData: Icons.history,
                  title: "Histórico de Compras",
                ),
                CustomSection(
                  iconData: Icons.info,
                  title: "Sobre o app",
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
