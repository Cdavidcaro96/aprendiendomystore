import 'package:aprendiendomystore/model/product.dart';
import 'package:aprendiendomystore/persistence/server_connection.dart';

class ProductsDAO{

  Future<List<Product>> getProductsFromServer(String idstores) async{
    var srvConn = ServerConnection();
    final List<Product> products = [];
    await srvConn.getProducts(idstores).then((productsData) {
      List records = productsData.split("|");
      records.forEach((element) {
        products.add(Product.fromString(element));
      });
    });
    return products;
  }
}