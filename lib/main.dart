import 'package:aprendiendomystore/view/home_view.dart';
import 'package:aprendiendomystore/persistence/stores_dao.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StoresDAO.addStoresFromServer().then((value){
    runApp(HomeView());
  });
}

