

import 'package:hive_flutter/adapters.dart';
import 'package:vai_vai_traders/models/local_database/product_details_model.dart';

class OpenAllBox{

  allBox()async{
    Hive.registerAdapter(ProductDetailsAdapter());
    Hive.registerAdapter(ProductOrderAdapter());

    await Hive.openBox('productDetails');
    await Hive.openBox('productOrder');
  }
}
