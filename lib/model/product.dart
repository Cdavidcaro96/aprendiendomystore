class Product {
  late int id;
  late String nombre;
  late String unidad;
  late double precio;

  Product(this.id, this.nombre, this.unidad, this.precio);

  Product.fromString(String texto){
    var list_pr = texto.split(";");
    id = int.parse(list_pr[0]);
    nombre = list_pr[1];
    unidad = list_pr[2];
    precio = double.parse(list_pr[3]);
  }
}