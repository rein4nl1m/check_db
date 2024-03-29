import 'dart:io';
import 'dart:async';
import 'package:check_compras/models/itemPadraoModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final _databaseName = "CheckCompraDB.db";
  static final _databaseVersion = 1;

  static final tableItem = "item_padrao";

  static final columnId = "_id";
  static final columnNome = "nome";
  static final columnQuantidade = "quantidade";

  DBProvider._privateConstructor();
  static final DBProvider instance = DBProvider._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB();
    return _database;
  }

  _initDB() async {
    Directory documentsDiretory = await getApplicationDocumentsDirectory();
    String path = join(documentsDiretory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onOpen: (database) {}, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $tableItem (
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnNome TEXT NOT NULL,
          $columnQuantidade INTEGER NOT NULL,
          UNIQUE($columnNome)
        )
    ''');
  }

  Future<int> insertItem(ItemPadrao item) async {
    final Database db = await instance.database;
    return db.insert(tableItem, item.toJson());
  }

  updateItem(ItemPadrao item) async {
    final Database db = await instance.database;
    return db.update(tableItem, item.toJson(),
        where: '$columnId = ?', whereArgs: [item.id]);
  }

  deleteItem(int id) async {
    final Database db = await instance.database;
    return db.delete(tableItem, where: '$columnId = ?', whereArgs: [id]);
  }

  deleteAllItems() async {
    final Database db = await instance.database;
    db.rawDelete("DELETE * FROM $tableItem");
  }

  Future<int> queryLastId() async {
    final Database db = await instance.database;
    return Sqflite.firstIntValue(await db.query(tableItem, orderBy: "$columnId DESC"));
  }

  Future<List<ItemPadrao>> queryAllRows() async {
    final Database db = await instance.database;
    var res = await db.query(tableItem);
    List<ItemPadrao> list =
        res.isNotEmpty ? res.map((i) => ItemPadrao.fromJson(i)).toList() : null;
    return list;
  }
}
