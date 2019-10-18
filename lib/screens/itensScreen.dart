import 'package:check_compras/db/db_provider.dart';
import 'package:check_compras/models/itemPadraoModel.dart';
import 'package:check_compras/widgets/customAppBar.dart';
import 'package:check_compras/widgets/customBodyBack.dart';
import 'package:check_compras/widgets/customFloatButton.dart';
//import 'package:check_compras/widgets/customFloatButton.dart';
import 'package:check_compras/widgets/customListTile.dart';
import 'package:flutter/material.dart';

class ItensScreen extends StatefulWidget {
  @override
  _ItensScreenState createState() => _ItensScreenState();
}

class _ItensScreenState extends State<ItensScreen> {
  final DBProvider db = DBProvider.instance;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomBodyBack(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Itens Padrão",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FutureBuilder<List<ItemPadrao>>(
                      future: db.queryAllRows(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<ItemPadrao>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              ItemPadrao itemPadrao = snapshot.data[index];
                              return CustomListTile(
                                  index: index, item: itemPadrao, db: db);
                            },
                          );
                        } else {
                          return Center(
                              child: Text("Insira um novo item!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)));
                        }
                      },
                    ),
                  ])),
        ),
        CustomFloatButton(label: "Novo Item")
      ],
    );
  }
}
