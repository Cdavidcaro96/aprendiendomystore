import 'package:aprendiendomystore/model/store.dart';
import 'package:aprendiendomystore/persistence/database_manager.dart';
import 'package:aprendiendomystore/view/stores_view.dart';
import 'package:flutter/material.dart';

import 'customer_view.dart';

class HomeView extends StatelessWidget {
  List<String> images = [
    "images/listado_tiendas.png",
    "images/generar_pedido.png",
    "images/registro_clientes.png",
    "images/buzon_sugerencias.png"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tienda mi barrio"),
          backgroundColor: Colors.purple[800],
        ),
        body: Container(
            padding: EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 24.0,
              ),
              itemBuilder: (context, index) => buildCell(context, index),
            )),
      ),
    );
  }

  Widget buildCell(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        _navigateTo(context, index);
      }, // handle your image tap here
      child: Image.asset(
        images[index],
        fit: BoxFit.cover, // this is the solution for border
        width: 110.0,
        height: 110.0,
      ),
    );
  }

  _navigateTo(context, int index) {

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoresListView()),
      );
    }

    else if(index == 1){
      var t1 = Store("600", "El raton", "Usaquen", 25.02668, -71.258997, "77777", "elraton@correo", "www.elraton.com", BusinessType.pet, "xxx");
      DataBaseManager.db.insertarNuevaTienda(t1);
      DataBaseManager.db.listaTiendas("select * FROM Store").then((value) => print(value));
    }

    else if(index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CustomerFormView()),
      );
    }
    return;
  }
}