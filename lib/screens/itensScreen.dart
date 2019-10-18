import 'package:check_compras/db/db_provider.dart';
import 'package:check_compras/models/itemPadraoModel.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text("Itens Padrão"), centerTitle: true),
      body: Stack(
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
                            fontWeight: FontWeight.bold, fontSize: 20)));
              }
            },
          ),
          Positioned(
            bottom: 7.5,
            right: 7.5,
            child: Hero(
              tag: "novoItem",
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/novoItemScreen");
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.add, color: Colors.white),
                        Text("Novo Item", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
