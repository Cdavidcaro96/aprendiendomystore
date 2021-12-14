import 'package:aprendiendomystore/model/store.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseManager{
  static late Database _database;
  String _dataBaseName = "AppMegocioBarrio.db";

  DataBaseManager._();
  static final DataBaseManager db = DataBaseManager._();
  var initialize = false;

  Future<Database> get database async {
    if(!initialize) {
      _database = await iniciarBaseDatos();
      initialize = true;
    }return _database;
  }
  //#region Instruccion SQL para crear la tabla Store
  final String _CREATE_TABLE_STORE = "CREATE TABLE Store("
      "id INTEGER PRIMARY KEY,"
      "name TEXT,"
      "address TEXT,"
      "latitude REAL,"
      "longitude REAL,"
      "cellphone TEXT,"
      "email TEXT,"
      "webpage TEXT,"
      "type TEXT,"
      "logo TEXT"
      ")";
  //#endregion

  iniciarBaseDatos() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _dataBaseName);
    return await openDatabase(path, version: 2, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(_CREATE_TABLE_STORE);
        }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
          if (oldVersion < newVersion) {
            await db.execute("DROP TABLE IF EXISTS Store");
            await db.execute(_CREATE_TABLE_STORE);
          }
        });
  }

  insertarNuevaTienda(Store td) async {
    final db = await database;
    var res = await db.insert("Store", td.toJson());
    return res;
  }

  Future<List<Store>> listaTiendas(String query) async {
    final db = await database;
    var res = await db.rawQuery(query);
    List<Store> list = [];
    if (res.isNotEmpty) {
      List<Map<String, dynamic>> temp = res.toList();
      for (Map<String, dynamic> t in temp) {
        list.add(Store.fromJson(t));
      }
    }
    return list;
  }
}