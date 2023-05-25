import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vai_vai_traders/controller/const_data.dart';
import 'package:vai_vai_traders/models/local_database/product_details_model.dart';
import 'package:vai_vai_traders/screens/product_out/order_card_page.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({
    super.key,
    required this.finalItemListC,
    required this.finalItemListP,
    required this.productDetails,
    // required this.tempListFuncC,
    // required this.tempListFuncP
  });
  final List<ProductOrder> finalItemListC;
  final List<ProductOrder> finalItemListP;
  final List<ProductDetails> productDetails;
  // final Function tempListFuncC;
  // final Function tempListFuncP;

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _cartonController = TextEditingController();
  final TextEditingController _pcsController = TextEditingController();

  Map<String, TextEditingController> controllersC = {};
  Map<String, TextEditingController> controllersP = {};
  bool _checkText = false;
  String _ck = "Mama";
  List<ProductOrder> tempListC = [];
  List<ProductOrder> tempListP = [];
  List<ProductDetails> productList = [];

  void insertData() {
    if (widget.finalItemListC.isNotEmpty && widget.finalItemListP.isNotEmpty) {
      tempListC = widget.finalItemListC;
      tempListP = widget.finalItemListP;
    }
  }

  @override
  void initState() {
    setState(() {
      // print("\n\nInitState Start\n");
      // for (var a in widget.finalItemListC) {
      //   print(
      //       "My _C = ${widget.finalItemListC.length} C== ${a.carton} Pcs: ${a.piece} PN : ${a.productName}  PI: ${a.itemId}");
      // }
      //
      // print("\n\n");
      //
      // for (var b in widget.finalItemListP) {
      //   print(
      //       "My _P = ${widget.finalItemListP.length} C== ${b.carton} Pcs: ${b.piece} PN : ${b.productName}  PI: ${b.itemId}");
      // }
      // print("\n\nInitState End\n");

      // tempListC = widget.finalItemListC;
      // tempListP = widget.finalItemListP;

      insertData();

      productList = widget.productDetails;
      for (var i in productList) {
        controllersC[i.itemId] = TextEditingController();
        controllersP[i.itemId + i.productName] = TextEditingController();
      }

      for (var element in tempListC) {
        controllersC.forEach((key, value) {
          if (key == element.itemId) {
            value.text = element.carton.toString();
          }
        });
      }

      for (var element in tempListP) {
        controllersP.forEach((key, value) {
          if (key == element.itemId + element.productName) {
            value.text = element.piece.toString();
          }
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        // appBar: App(),
        //appBar: const CustomAppbar(title: 'Product Search Page',),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: appbarColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 10, right: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      Container(
                        width: size.width * .77,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _ck = value;
                              _checkText = true;
                            });
                          },
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            hintText: 'Search product here...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: _checkText == false
                                ? const Icon(Icons.search)
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        _searchController.clear();
                                      });
                                    },
                                    child: const Icon(Icons.close)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: const Color(0xff008080),
                elevation: .5,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 7,
                          child: Text(
                            "  Product Name",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * .05,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            "Carton",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * .05),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            "  Pcs",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * .05),
                          )),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: SizedBox(
                    height: size.height * .65,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: productList.length,
                      itemBuilder: (_, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 3, left: 6, right: 6),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  productList[index]
                                                          .productName
                                                          .toString() ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize: (size.height *
                                                              .0093) *
                                                          (size.width * .009),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  "  (${productList[index].netWeight.toString() ?? ""}mg)",
                                                  style: TextStyle(
                                                    fontSize: (size.height *
                                                            .0083) *
                                                        (size.width * .0065),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "1 Carton = ${productList[index].cartonToPcs.toString() ?? ""} Pcs,   ${productList?[index].cartonPrice.toString() ?? ""}Tk",
                                            style: TextStyle(
                                              fontSize: (size.height * .007) *
                                                  (size.width * .007),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: TextField(
                                          controller: controllersC[
                                              productList[index].itemId],
                                          onChanged: (value) {
                                            if (value != '') {
                                              var temp1 = ProductOrder(
                                                  productName:
                                                      productList[index]
                                                          .productName,
                                                  netWeight: productList[index]
                                                      .netWeight,
                                                  cartonToPcs:
                                                      productList[index]
                                                          .cartonToPcs,
                                                  cartonPrice:
                                                      productList[index]
                                                          .cartonPrice,
                                                  itemId:
                                                      productList[index].itemId,
                                                  carton: controllersC[
                                                          productList[index]
                                                              .itemId]!
                                                      .text,
                                                  piece: '0');

                                              var tList =
                                                  temp1.itemId.toString();
                                              tempListC.removeWhere((element) =>
                                                  tList == element.itemId);
                                              tempListC.add(temp1);
                                              setState(() {});
                                            } else if (value == '') {
                                              var temp = ProductOrder(
                                                  productName:
                                                      productList[index]
                                                          .productName,
                                                  netWeight: productList[index]
                                                      .netWeight,
                                                  cartonToPcs:
                                                      productList[index]
                                                          .cartonToPcs,
                                                  cartonPrice:
                                                      productList[index]
                                                          .cartonPrice,
                                                  itemId:
                                                      productList[index].itemId,
                                                  carton: value == ''
                                                      ? '0'
                                                      : controllersC[
                                                              productList[index]
                                                                  .itemId]!
                                                          .text,
                                                  piece: '0');

                                              var tList =
                                                  temp.itemId.toString();
                                              tempListC.removeWhere((element) =>
                                                  tList == element.itemId);
                                              setState(() {});
                                            } else if (value.isEmpty) {
                                              var temp = ProductOrder(
                                                  productName:
                                                      productList[index]
                                                          .productName,
                                                  netWeight: productList[index]
                                                      .netWeight,
                                                  cartonToPcs:
                                                      productList[index]
                                                          .cartonToPcs,
                                                  cartonPrice:
                                                      productList[index]
                                                          .cartonPrice,
                                                  itemId:
                                                      productList[index].itemId,
                                                  carton: '0',
                                                  piece: value.isEmpty
                                                      ? '0'
                                                      : controllersP[productList[
                                                                      index]
                                                                  .itemId +
                                                              productList[index]
                                                                  .productName]!
                                                          .text);

                                              var tList =
                                                  temp.itemId.toString();
                                              tempListP.removeWhere((element) =>
                                                  tList == element.itemId);
                                            } else {}
                                          },
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(2),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: TextField(
                                          controller: controllersP[
                                              productList[index].itemId +
                                                  productList[index]
                                                      .productName],
                                          onChanged: (value) {
                                            setState(() {
                                              if (value != '') {
                                                var temp = ProductOrder(
                                                    productName:
                                                        productList[index]
                                                            .productName,
                                                    netWeight:
                                                        productList[index]
                                                            .netWeight,
                                                    cartonToPcs:
                                                        productList[index]
                                                            .cartonToPcs,
                                                    cartonPrice:
                                                        productList[index]
                                                            .cartonPrice,
                                                    itemId: productList[index]
                                                        .itemId,
                                                    carton: '0',
                                                    piece: controllersP[
                                                            productList[index]
                                                                    .itemId +
                                                                productList[
                                                                        index]
                                                                    .productName]!
                                                        .text);

                                                var tList =
                                                    temp.itemId.toString();
                                                tempListP.removeWhere(
                                                    (element) =>
                                                        tList ==
                                                        element.itemId);

                                                tempListP.add(temp);
                                              } else if (value == '') {
                                                var temp = ProductOrder(
                                                    productName:
                                                        productList[index]
                                                            .productName,
                                                    netWeight:
                                                        productList[index]
                                                            .netWeight,
                                                    cartonToPcs:
                                                        productList[index]
                                                            .cartonToPcs,
                                                    cartonPrice:
                                                        productList[index]
                                                            .cartonPrice,
                                                    itemId: productList[index]
                                                        .itemId,
                                                    carton: '0',
                                                    piece: value == ''
                                                        ? '0'
                                                        : controllersP[productList[
                                                                        index]
                                                                    .itemId +
                                                                productList[
                                                                        index]
                                                                    .productName]!
                                                            .text);

                                                var tList =
                                                    temp.itemId.toString();
                                                tempListP.removeWhere(
                                                    (element) =>
                                                        tList ==
                                                        element.itemId);
                                              } else if (value.isEmpty) {
                                                var temp = ProductOrder(
                                                    productName:
                                                        productList[index]
                                                            .productName,
                                                    netWeight:
                                                        productList[index]
                                                            .netWeight,
                                                    cartonToPcs:
                                                        productList[index]
                                                            .cartonToPcs,
                                                    cartonPrice:
                                                        productList[index]
                                                            .cartonPrice,
                                                    itemId: productList[index]
                                                        .itemId,
                                                    carton: '0',
                                                    piece: value.isEmpty
                                                        ? '0'
                                                        : controllersP[productList[
                                                                        index]
                                                                    .itemId +
                                                                productList[
                                                                        index]
                                                                    .productName]!
                                                            .text);

                                                var tList =
                                                    temp.itemId.toString();
                                                tempListP.removeWhere(
                                                    (element) =>
                                                        tList ==
                                                        element.itemId);
                                              } else {}
                                            });
                                          },
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(2),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ),
              InkWell(
                onTap: () {
                  // widget.tempListFuncC(widget.finalItemListC);
                  // widget.tempListFuncP(widget.finalItemListP);

                  for (var a in widget.finalItemListC) {
                    print(
                        "CC = ${widget.finalItemListC.length} C== ${a.carton} Pcs: ${a.piece} PN : ${a.productName}  PI: ${a.itemId}");
                  }

                  print("\n\n");

                  for (var b in widget.finalItemListP) {
                    print(
                        "PCs = ${widget.finalItemListP.length} C== ${b.carton} Pcs: ${b.piece} PN : ${b.productName}  PI: ${b.itemId}");
                  }

                  for (var a in tempListC) {
                    print(
                        "C = ${tempListC.length} C== ${a.carton} Pcs: ${a.piece} PN : ${a.productName}  PI: ${a.itemId}");
                  }

                  print("\n\n");

                  for (var b in tempListP) {
                    print(
                        "P = ${tempListP.length} C== ${b.carton} Pcs: ${b.piece} PN : ${b.productName}  PI: ${b.itemId}");
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderCardPage(
                                finalListC: tempListC,
                                finalListP: tempListP,
                              )));

                  // Navigator.pop(context);

                  // print("sdfvgfr");
                  // var list1 = [
                  //   {"m": 'FN', "n": 10, "o": 30},
                  //   {"m": 'MB', "n": 11, "o": 30},
                  //   {"m": "KC", "n": 12, "o": 30}
                  // ];
                  // var list2 = [
                  //   {"m": "MB", "n": 13, "o": 60},
                  //   {"m": "KK", "n": 14, "o": 30},
                  //   {"m": "NM", "n": 15, "o": 30},
                  //   {"m": "FN", "n": 16, "o": 30}
                  //
                  // ];
                  // // var expectedList = list1.toSet().intersection(list2.toSet()).toSet();
                  // var expectedList =  list1[0]['m'].toString();
                  // for(var i in list1){
                  //   var x = i['m'];
                  //   for(var j in list2){
                  //     if(x== j['m']){
                  //       print("X = $x  == ${j['m']}");
                  //     }
                  //   }
                  // }

                  // print(" Temp : ${tempList[0].itemId}");

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => OrderCardPage(
                  //       draftOrderItem: widget.finalItemList,
                  //     ),
                  //   ),
                  // );
                },
                child: Row(
                  children: [
                    Card(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
