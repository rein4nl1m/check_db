import 'package:check_compras/db/db_provider.dart';
import 'package:check_compras/models/itemPadraoModel.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final int index;
  final DBProvider db;
  final ItemPadrao item;

  const CustomListTile({Key key, this.index, this.item, this.db}) : super(key: key);

  @override
  _CustomListTileState createState() => _CustomListTileState(index, item, db);
}

class _CustomListTileState extends State<CustomListTile> {
  final int index;
  final DBProvider db;
  final ItemPadrao item;
  ItemPadrao _lastRemoved;
  int _lastRemovedPos;

  _CustomListTileState(this.index, this.item, this.db);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white,),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: ListTile(
        title: Text(item.nome),
        subtitle: Text("Quantidade: ${item.quantidade}"),
        onTap: (){}
      ),
      onDismissed: (direction){
        setState(() {
          _lastRemoved = item;
          _lastRemovedPos = item.id;
          db.deleteItem(item.id);

          final snack = SnackBar(
            content: Text("Item \"${_lastRemoved.nome}\" removido!"),
            action: SnackBarAction(label: "Desfazer",
                onPressed: () {
                  setState(() {
                    db.insertItem(item);
                    //_toDoList.insert(_lastRemovedPos, _lastRemoved);
                  });
                }),
            duration: Duration(seconds: 2),
          );

          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);

        });
      },
    );
    
    
    
    /*return ListTile(
        title: Text(item.nome),
        subtitle: Text("Quantidade: ${item.quantidade}"));*/
  }
}

/*Widget buildItem(BuildContext context, int index){
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white,),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_toDoList[index]["title"]),
        value: _toDoList[index]["ok"],
        secondary: CircleAvatar(
          child: Icon(_toDoList[index]["ok"] ?
          Icons.check : Icons.error),),
        onChanged: (c){
          setState(() {
            _toDoList[index]["ok"] = c;
            _saveData();
          });
        },
      ),
      onDismissed: (direction){
        setState(() {
          _lastRemoved = Map.from(_toDoList[index]);
          _lastRemovedPos = index;
          _toDoList.removeAt(index);

          _saveData();

          final snack = SnackBar(
            content: Text("Tarefa \"${_lastRemoved["title"]}\" removida!"),
            action: SnackBarAction(label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _toDoList.insert(_lastRemovedPos, _lastRemoved);
                    _saveData();
                  });
                }),
            duration: Duration(seconds: 2),
          );

          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);

        });
      },
    );
  }*/