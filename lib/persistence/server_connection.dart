import 'package:http/http.dart' as http;

class ServerConnection {
  final _svrUrl =
      'https://script.google.com/macros/s/AKfycbynu_IaU5DkVd5yYb0PyTRw2-L1IX5oaHSo8hD3XRb2lu3AXxA/exec';

  Future<String> select(String table) async {
    final url = Uri.parse(_svrUrl+'?acc=1&tbl='+table);
    var response = await http.get(url);
    if(response.statusCode == 200){
      return response.body;
    }else{
      return 'Response status: ${response.statusCode}';
    }
  }

  Future<String> insert(String table, String data) async {
    final url = Uri.parse(_svrUrl);
    var response = await http.post(url, body: {'acc': '2', 'tbl': table, 'data': data});
    if(response.statusCode == 200){
      return response.body;
    }else{
      return 'Response status: ${response.statusCode}';
    }
  }

  Future<String> getProducts(String idstores) async {
    final url = Uri.parse(_svrUrl+'?acc=3&idt='+idstores);
    var response = await http.get(url);
    if(response.statusCode == 200){
      return response.body;
    }else{
      return 'Response status: ${response.statusCode}';
    }
  }
}