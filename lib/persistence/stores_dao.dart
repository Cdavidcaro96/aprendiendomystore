import 'package:aprendiendomystore/model/store.dart';
import 'dart:convert' as JSON;
import 'package:aprendiendomystore/persistence/server_connection.dart';

class StoresDAO{
  static final List<Store> stores = [];

  static Future<void> addStoresFromServer() async{
    var srvConn = ServerConnection();
    await srvConn.select('Stores').then((stores_data) {
      var json = JSON.jsonDecode(stores_data);
      List records = json["data"];
      records.forEach((element) {
        stores.add(Store.fromJson(element));
      });
    });
  }
}