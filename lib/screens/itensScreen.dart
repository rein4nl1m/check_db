import 'package:check_compras/db/db_provider.dart';
import 'package:check_compras/models/itemPadraoModel.dart';
import 'package:check_compras/widgets/customListTile.dart';
import 'package:flutter/material.dart';

class ItensScreen extends StatefulWidget {
  final DBProvider db;

  const ItensScreen({Key key, this.db}) : super(key: key);

  @override
  _ItensScreenState createState() => _ItensScreenState();
}

class _ItensScreenState extends State<ItensScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _itemController = TextEditingController();
  TextEditingController _quantController = TextEditingController();

  void _resetControllers() {
    _itemController.text = "";
    _quantController.text = "";
    setState(() {
      _formKey.currentState.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Itens Padrão"),
        ),
        body: FutureBuilder<List<ItemPadrao>>(
          future: widget.db.queryAllRows(),
          builder:
              (BuildContext context, AsyncSnapshot<List<ItemPadrao>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  ItemPadrao itemPadrao = snapshot.data[index];
                  return CustomListTile(index: index, item: itemPadrao, db: widget.db);
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
        floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.add),
            label: Text("Novo Item"),
            onPressed: _novoItem));
  }

  _novoItem() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text("Novo Item"),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 120,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _itemController,
                          decoration: InputDecoration(
                              labelText: "Item", icon: Icon(Icons.add_box)),
                          validator: (value) {
                            if (value.isEmpty || value == "") {
                              return "Insira um item válido";
                            }
                          },
                        ),
                        TextFormField(
                          controller: _quantController,
                          decoration: InputDecoration(
                              labelText: "Quantidade",
                              icon: Icon(Icons.confirmation_number)),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Insira um valor válido";
                            }
                            if (int.parse(value) == 0) {
                              return _quantController.text = "1";
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    child:
                        const Text("Cancelar", style: TextStyle(fontSize: 12)),
                    onPressed: () {
                      Navigator.pop(context);
                      _resetControllers();
                    }),
                InkWell(
                  child: Container(
                    width: 80,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(14)),
                    child: Text("Inserir",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ),
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      var item = ItemPadrao();
                      //int id = await widget.db.queryLastId();
                      //item.id = (id != null) ? id++ : 1;
                      item.nome = _itemController.text;
                      item.quantidade = int.parse(_quantController.text);
                      widget.db.insertItem(item);
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ));
  }
}
