
enum BusinessType {bakery, clothing, candy, coffee, laundry, market, pet, stationery, restaurant}

class Store {
  final String id, name, address, cellphone, email, webpage, logo;
  final double latitude, longitude;
  final BusinessType type;


  Store(this.id, this.name, this.address, this.latitude, this.longitude, this.cellphone, this.email, this.webpage, this.type, this.logo);

  Store.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'],
        address = json['address'],
        latitude = double.parse(json['latitude'].toString()),
        longitude = double.parse(json['longitude'].toString()),
        cellphone = json['cellphone'].toString(),
        email = json['email'],
        webpage = json['webpage'],
        type = BusinessType.values.firstWhere((element) =>
        element.toString() == json['type'].toString()),
        logo = json['logo'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "cellphone": cellphone,
    "email": email,
    "webpage": webpage,
    "type": type.toString(),
    "logo": logo,
  };

  String toString(){
    return name+";"+address+";"+cellphone;
  }
}


