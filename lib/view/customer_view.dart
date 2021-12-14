import 'package:flutter/material.dart';
import 'package:aprendiendomystore/persistence/server_connection.dart';

void main () => runApp(CustomerFormView());

class CustomerFormView extends StatelessWidget {
  const CustomerFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  late String _name,_address,_cellphone,_email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text ('Nombre del Cliente'),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Pro favor agregue un texto';
              }else{
                setState(() {
                  this._name = value;
                });
              }return null;
            },
          ),

          const Text ('Direccion'),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Pro favor agregue un texto';
              }else{
                setState(() {
                  this._address = value;
                });
              }return null;
            },
          ),

          const Text ('Telefono'),
          TextFormField(
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Pro favor agregue un texto';
              }else{
                setState(() {
                  this._cellphone = value;
                });
              }return null;
            },
          ),

          const Text ('Email'),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Pro favor agregue un texto';
              }else{
                setState(() {
                  this._email = value;
                });
              }return null;
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var srvcon=ServerConnection();
                  srvcon.insert('Customers', this._name+';'+this._address+';'+this._cellphone+';'+this._email).then ((value){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Datos insertados en el servidor')),
                    );
                  });
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}