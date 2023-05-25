import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vai_vai_traders/models/product_entry_model.dart';
import '../../controller/const_data.dart';

class ProductEntryScreen extends StatefulWidget {
  const ProductEntryScreen({Key? key}) : super(key: key);

  @override
  State<ProductEntryScreen> createState() => _ProductEntryScreenState();
}

class _ProductEntryScreenState extends State<ProductEntryScreen> {
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _netWeight = TextEditingController();
  final TextEditingController _cartonToPcs = TextEditingController();
  final TextEditingController _cartonPrice = TextEditingController();

  String _dateTime = '0';

  void setTime() {
    DateTime date = DateTime.now();
    _dateTime =
        "${date.toString().substring(0, 10)}-${date.toString().substring(11, 13)}-${date.toString().substring(14, 16)}-${date.toString().substring(17, 19)}";
    // print("Date : $date\n$dateTime");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: const Text("Product Entry"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Card(
            child: TextField(
              controller: _productName,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "পণ্যের  নাম কি ?",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Card(
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: _netWeight,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "পণ্যের ওজন কত ?",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Card(
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: _cartonToPcs,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "প্রতি কার্টুন এ কত পিস ",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Card(
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: _cartonPrice,
              decoration: const InputDecoration(
                hintText: "কার্টুন এর  দাম  কত ?",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: Card(
              color: appbarColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: InkWell(
                onTap: () async {
                  if (_productName.text.isEmpty) {
                    await EasyLoading.showError("Enter Product Name");
                  } else if (_netWeight.text.isEmpty) {
                    await EasyLoading.showError("Enter Product Weight");
                  } else if (_cartonToPcs.text.isEmpty) {
                    await EasyLoading.showError("Enter Product Piece");
                  } else if (_cartonPrice.text.isEmpty) {
                    await EasyLoading.showError("Enter Carton price");
                  } else {
                    await EasyLoading.show();
                    setTime();
                    ProductEntryModels models = ProductEntryModels(
                        _productName.text,
                        _netWeight.text,
                        _cartonToPcs.text,
                        _cartonPrice.text,
                        _dateTime.replaceAll(RegExp(r'[^\w\s]+'),'')
                    );
                    await FirebaseDatabase.instance
                        .ref('ProductEntry')
                        .child(_dateTime)
                        .set(models.toJson());
                    await EasyLoading.showSuccess("Success");

                    _productName.clear();
                    _netWeight.clear();
                    _cartonPrice.clear();
                    _cartonToPcs.clear();
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add Product",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
