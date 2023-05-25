import 'dart:convert';
 import 'package:firebase_database/firebase_database.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vai_vai_traders/models/local_database/product_details_model.dart';
import '../models/product_entry_model.dart';

class AllApiCall {

  Future addProductDetailsHive(data) async {
    print("\n Start create box \n\n");
    Box box = Hive.box('productDetails');
    print("\n box Created\n\n");
    await box.clear();
    print("\n box Clear\n\n");
    for (var m in data) {
      box.add(ProductDetails(
          productName: m.productName.toString(),
          netWeight: m.netWeight.toString(),
          cartonToPcs: m.cartonToPcs.toString(),
          cartonPrice: m.cartonPrice.toString(),
          itemId: m.primaryKey.toString()
      ));
    }
  }

  Future getProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<ProductEntryModels> productData = [];

    await FirebaseDatabase.instance.ref('ProductEntry').orderByKey().get().then((value) {
      for (var data in value.children) {
        productData.add(
            ProductEntryModels.fromJson(jsonDecode(jsonEncode(data.value))));
      }
    }
    );
    await addProductDetailsHive(productData);
    prefs.setString('dataPut', "true");
  }
}
