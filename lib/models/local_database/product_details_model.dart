import 'package:hive_flutter/hive_flutter.dart';
part 'product_details_model.g.dart';

@HiveType(typeId: 0)
class ProductDetails extends HiveObject{
  @HiveField(0)
  String productName;
  @HiveField(1)
  String netWeight;
  @HiveField(2)
  String cartonToPcs;
  @HiveField(3)
  String cartonPrice;
  @HiveField(4)
  String itemId;

  ProductDetails(
      {required this.productName,
      required this.netWeight,
      required this.cartonToPcs,
      required this.cartonPrice,
      required this.itemId});
}

@HiveType(typeId: 1)
class ProductOrder extends HiveObject{
  @HiveField(0)
  String productName;
  @HiveField(1)
  String netWeight;
  @HiveField(2)
  String cartonToPcs;
  @HiveField(3)
  String cartonPrice;
  @HiveField(4)
  String itemId;
  @HiveField(5)
  String carton;
  @HiveField(6)
  String piece;

  ProductOrder(
      {required this.productName,
        required this.netWeight,
        required this.cartonToPcs,
        required this.cartonPrice,
        required this.itemId,
        required this.carton,
        required this.piece
      });
}