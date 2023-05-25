import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vai_vai_traders/controller/const_data.dart';
import 'package:vai_vai_traders/models/local_database/product_details_model.dart';
import 'package:vai_vai_traders/screens/home_page.dart';
import 'package:vai_vai_traders/screens/product_out/product_search_2.dart';

class OrderCardPage extends StatefulWidget {
  const OrderCardPage(
      {super.key, required this.finalListC, required this.finalListP});
  final List<ProductOrder> finalListC;
  final List<ProductOrder> finalListP;

  @override
  State<OrderCardPage> createState() => _OrderCardPageState();
}

class _OrderCardPageState extends State<OrderCardPage> {
  //  Map<String, TextEditingController> controllersC = {};
  // Map<String, TextEditingController> controllersP = {};

  List syncItemList = [];
  List<ProductOrder> finalItemDataListC = [];
  List<ProductOrder> finalItemDataListP = [];
  List<ProductOrder> finalItemDataList = [];
  List<ProductDetails> productList = [];

  void setData() {
    finalItemDataListC = widget.finalListC;
    finalItemDataListP = widget.finalListP;

    if (finalItemDataListC.isNotEmpty || finalItemDataListP.isNotEmpty) {
      for (var i in finalItemDataListP) {
        for (var j in finalItemDataListC) {
          if (i.itemId == j.itemId) {
            finalItemDataList.add(ProductOrder(
                productName: i.productName,
                netWeight: i.netWeight,
                cartonToPcs: i.cartonToPcs,
                cartonPrice: i.cartonPrice,
                itemId: i.itemId,
                carton: j.carton,
                piece: i.piece));
          }
        }
      }
    } else {
      finalItemDataList = [];
    }
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: const Text("Order Card"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: backgroundColor,
              child: Text(
                finalItemDataList.length.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
                height: size.height * .77,
                // color: Colors.red,
                child: finalItemDataList.isNotEmpty
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: finalItemDataList.length,
                        itemBuilder: (_, index) {
                          return Card(
                            elevation: 2,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 6,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            finalItemDataList[index]
                                                .productName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: size.width * .05),
                                          ),
                                          Text(
                                            "${finalItemDataList[index].cartonToPcs} Pcs = 1 carton  , ${finalItemDataListC[index].cartonPrice} TK",
                                            style: TextStyle(
                                                fontSize: size.width * .04),
                                          ),
                                        ],
                                      ),
                                    )),
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  color: Colors.grey,
                                  height: 50,
                                  width: 1,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Carton =   ${finalItemDataList[index].carton}"),
                                        Text(
                                            "Pcs      =   ${finalItemDataList[index].piece}")
                                      ],
                                    ))
                              ],
                            ),
                          );
                        })
                    : const Center(child: Text("Empty list"))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    putData();
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: appbarColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, right: 11, left: 11),
                      child: Text(
                        "Save Item",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * .062),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    getData();
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: appbarColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, right: 11, left: 11),
                      child: Text(
                        "Add Item",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * .062),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future getData() async {
    Box box = Hive.box('productDetails');
    productList = box.toMap().values.toList().cast();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductSearchPage(
          finalItemListC: widget.finalListC,
          finalItemListP: widget.finalListP,
          productDetails: productList,
        ),
      ),
    );
  }

  Future putData() async {
    Box box = Hive.box('productOrder');
    await box.clear();

    print("Order data for save");
    for (var i in finalItemDataList) {
      box.add(ProductOrder(
          productName: i.productName,
          netWeight: i.netWeight,
          cartonToPcs: i.cartonToPcs,
          cartonPrice: i.cartonPrice,
          itemId: i.itemId,
          carton: i.carton,
          piece: i.piece));
      print("P name : ${i.productName}");
    }
    print("Order data save Done");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}
