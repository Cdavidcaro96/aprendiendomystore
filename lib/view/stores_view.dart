import 'package:aprendiendomystore/model/store.dart';
import 'package:aprendiendomystore/persistence/products_dao.dart';
import 'package:aprendiendomystore/persistence/stores_dao.dart';
import 'package:aprendiendomystore/view/products_view.dart';
import 'package:flutter/material.dart';


class StoresListView extends StatefulWidget {
  @override
  _StoresListViewState createState() => _StoresListViewState();
}

class _StoresListViewState extends State<StoresListView> {
  //final stDAO = StoreDAO();
  final _stores = StoresDAO.stores;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tiendas'),
        backgroundColor: Colors.purple[800],
      ),
      body: _buildStoreList(),
    );
  }

  Widget _buildStoreList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _stores.length,
        itemBuilder: (context, i,) {

          return _buildRow(_stores[i]);
        });
  }

  Widget _buildRow(Store st) {
    return ListTile(
      title: Text(
        st.name,style: TextStyle(fontSize: 25),
      ),
      subtitle: Text(st.address,style:TextStyle(fontSize: 10,color: Colors.blue[900]),),
      leading: Image.network("https://drive.google.com/uc?export=view&id=" + st.logo),
      trailing: Icon(Icons.food_bank ,size:20,color:Colors.purple[800],),
      onTap: () {
        var prDAO = ProductsDAO();
        prDAO.getProductsFromServer(st.id).then((listaProductos) => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductsListView(listaProductos, st)),
          ),
        });
      },
    );
  }
}