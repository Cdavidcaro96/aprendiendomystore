import 'package:aprendiendomystore/model/product.dart';
import 'package:aprendiendomystore/model/store.dart';
import 'package:aprendiendomystore/view/google_maps.dart';
import 'package:flutter/material.dart';

class ProductsListView extends StatefulWidget {

  final List<Product> LstPr;
  final Store tienda;
  ProductsListView(this.LstPr, this.tienda);

  @override
  _ProductsListViewState createState() => _ProductsListViewState();

}


class _ProductsListViewState extends State<ProductsListView> {
  //final stDAO = StoreDAO();
  final _biggerFont = const TextStyle(fontSize: 25.0);

  void handleTap(int item) {
    switch (item) {
      case 0:
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GoogleMapsWidget(widget.tienda)),
      );
        break;
      case 1: print("Selecciono carrito de compra");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de productos'),
        backgroundColor: Colors.purple[800],
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: (item) => handleTap(item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Ver en google maps')),
              PopupMenuItem<int>(value: 1, child: Text('Carrito de compra')),
            ],
          ),
        ],
      ),
      body: _buildStoreList(),
    );
  }

  Widget _buildStoreList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.LstPr.length,
        itemBuilder: (
            context,
            i,
            ) {
          return _buildRow(widget.LstPr[i]);
        });
  }

  Widget _buildRow(Product pdt) {
    return ListTile(
      title: Text(
        pdt.nombre,
        style: _biggerFont,
      ),
      subtitle: Text("COP  " +
        pdt.precio.toString(),
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
      trailing: Icon(
        Icons.attach_money,
        size: 20,
        color: Colors.purple[800],
      ),
      onTap: () {



      },
    );
  }
}