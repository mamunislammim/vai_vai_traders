class ProductEntryModels {
  String? productName;
  String? netWeight;
  String? cartonToPcs;
  String? cartonPrice;
  String? primaryKey;

  ProductEntryModels(
      this.productName, this.netWeight, this.cartonToPcs, this.cartonPrice, this.primaryKey);

  ProductEntryModels.fromJson(dynamic json) {
    productName = json['productName'];
    netWeight = json['netWeight'];
    cartonToPcs = json['cartonToPcs'];
    cartonPrice = json['cartonPrice'];
    primaryKey = json['primaryKey'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productName'] = productName;
    map['netWeight'] = netWeight;
    map['cartonToPcs'] = cartonToPcs;
    map['cartonPrice'] = cartonPrice;
    map['primaryKey'] = primaryKey;
    return map;
  }
}



class Person {
  String name;
  int age;
  Map<String, dynamic> address;

  Person({required this.name, required this.age, required this.address});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['address'] = address;
    return data;
  }
}



