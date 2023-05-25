import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vai_vai_traders/controller/const_data.dart';
import '../../models/local_database/product_details_model.dart';

class ProductInPage extends StatefulWidget {
  const ProductInPage({Key? key, required this.productOrder}) : super(key: key);
  final List<ProductOrder> productOrder;

  @override
  State<ProductInPage> createState() => _ProductInPageState();
}

class _ProductInPageState extends State<ProductInPage> {
  List<ProductOrder> productList = [];
  final Map<String, TextEditingController> _cartonController = {};
  final Map<String, TextEditingController> _pcsController = {};
  Map<String, int> sellCarton = {};
  Map<String, int> sellPcs = {};
  Map<String, double> totalAmounts = {};
  int totalPcs = 0;


  getProduct() {
    if (widget.productOrder.isNotEmpty) {
      productList = widget.productOrder;
    }
  }

  @override
  void initState() {
    getProduct();

    for (var element in productList) {
      _cartonController[element.itemId] = TextEditingController();
      sellCarton[element.itemId] = 0;
      sellPcs[element.productName] = 0;
      totalAmounts[element.itemId] = 0.0;
    }
    super.initState();
  }


  void totalAmountCount({c, p, i}){
    var top = 0;
    var oc = int.parse(productList[i].carton);
    var op = int.parse(productList[i].piece);
    top = (oc * int.parse(productList[i].cartonToPcs)) + op;

    if(c != null ){
      var car = top - (int.parse(c) * int.parse(productList[i].cartonToPcs));
      var C = car ~/ int.parse(productList[i].cartonToPcs);
      var P = car % int.parse(productList[i].cartonToPcs);
      print("\n\n\n Car = $C   $P");
    }

    if(p != null){
      // var pcs = 
    }

    setState(() {
    });

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: orientation == Orientation.portrait
                ? Axis.horizontal
                : Axis.vertical,
            // physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: appbarColor.withOpacity(.8),
                    color: Colors.blue,
                    height: orientation == Orientation.portrait
                        ? size.height * 0.0638
                        : size.height * .1,
                    width:
                        orientation == Orientation.portrait ? 800 : size.width,
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(.65),
                        2: FlexColumnWidth(.65),
                        3: FlexColumnWidth(.65),
                        4: FlexColumnWidth(.65),
                      },
                      //defaultColumnWidth: const FixedColumnWidth(120.0),
                      // border: TableBorder.all(
                      //     color: Colors.black,
                      //     style: BorderStyle.solid,
                      //     width: 2),
                      border: TableBorder.symmetric(
                          inside: const BorderSide(color: Colors.white),
                          outside:
                              BorderSide(color: Colors.white.withOpacity(1))),
                      children: const [
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Product Name',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.all(8.0),
                            //   child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Text('Rate',
                            //             style: TextStyle(fontSize: 15.0))
                            //       ]),
                            // ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Back',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Order',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Sell',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Total',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  productList.isNotEmpty
                      ? SizedBox(
                          height: orientation == Orientation.portrait
                              ? size.height * .905
                              : size.height * .8,
                          width: orientation == Orientation.portrait
                              ? 800
                              : size.width,
                          //color: buttonColor.withOpacity(0.5),
                          child: SingleChildScrollView(
                            child: ListView.builder(
                              //scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: productList.length,
                              itemBuilder: (context, index) {
                                return Table(
                                  columnWidths: const {
                                    0: FlexColumnWidth(1),
                                    1: FlexColumnWidth(.65),
                                    2: FlexColumnWidth(.65),
                                    3: FlexColumnWidth(.65),
                                    4: FlexColumnWidth(.65),
                                  },
                                  border: TableBorder.symmetric(
                                      inside:
                                          const BorderSide(color: Colors.white),
                                      outside: BorderSide(
                                          color: Colors.white.withOpacity(1))),
                                  children: [
                                    TableRow(
                                      decoration: BoxDecoration(
                                          color: index.isEven
                                              ? Colors.grey.withOpacity(.1)
                                              : Colors.blueAccent
                                                  .withOpacity(.1)),
                                      children: [
                                        Padding(
                                          padding: orientation ==
                                                  Orientation.portrait
                                              ? const EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 5,
                                                  left: 3,
                                                  right: 2)
                                              : const EdgeInsets.only(
                                                  top: 15,
                                                  bottom: 5,
                                                  left: 2,
                                                  right: 2),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8),
                                                child: Text(
                                                 totalPcs
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: orientation ==
                                                            Orientation.portrait
                                                        ? (size.width * .009) *
                                                            (size.height * .01)
                                                        : (size.width * .03),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8),
                                                child: Text(
                                                  '1 Carton = ${productList[index].cartonToPcs} Pcs, ${productList[index].cartonPrice} Tk',
                                                  style: TextStyle(
                                                    fontSize: orientation ==
                                                            Orientation.portrait
                                                        ? (size.width * .007) *
                                                            (size.height * .008)
                                                        : (size.width * .015),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(
                                        //       top: 10, bottom: 5, left: 2, right: 2),
                                        //   child: Column(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.end,
                                        //       children: [
                                        //         Text(
                                        //           '4.5',
                                        //           style: TextStyle(
                                        //             fontSize: orientation ==
                                        //                     Orientation.portrait
                                        //                 ? (size.width * .01) *
                                        //                     (size.height * .01)
                                        //                 : (size.width * .007) *
                                        //                     (size.height * .011),
                                        //           ),
                                        //         ),
                                        //         Text(
                                        //           'Tk',
                                        //           style: TextStyle(
                                        //             fontSize: orientation ==
                                        //                     Orientation.portrait
                                        //                 ? (size.width * .008) *
                                        //                     (size.height * .009)
                                        //                 : (size.width * .007) *
                                        //                     (size.height * .011),
                                        //           ),
                                        //         ),
                                        //       ]),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                height: orientation ==
                                                        Orientation.portrait
                                                    ? size.height * .08
                                                    : size.height * 0.1,
                                                width: orientation ==
                                                        Orientation.portrait
                                                    ? size.width * 0.15
                                                    : size.width * 0.06,
                                                child: TextField(
                                                  controller: _cartonController[
                                                      productList[index]
                                                          .itemId],
                                                  onChanged: (value) {
                                                    if (value != '') {
                                                       totalAmountCount(c: value, i: index);
                                                        setState(() {});
                                                    }
                                                  },
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly
                                                  ],
                                                  decoration:
                                                      const InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.all(10),
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              SizedBox(
                                                height: orientation ==
                                                        Orientation.portrait
                                                    ? size.height * .08
                                                    : size.height * 0.1,
                                                width: orientation ==
                                                        Orientation.portrait
                                                    ? size.width * 0.15
                                                    : size.width * 0.06,
                                                child: TextField(
                                                  controller: _pcsController[
                                                      productList[index]
                                                          .itemId],
                                                  onChanged: (pcsValue) {
                                                    if (pcsValue != '') {
                                                      totalAmountCount(p: pcsValue, i: index);
                                                     setState(() {});
                                                    }
                                                  },
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly
                                                  ],
                                                  decoration:
                                                      const InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.all(10),
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 5,
                                              left: 10,
                                              right: 2),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Carton = ${productList[index].carton}',
                                                style: TextStyle(
                                                  fontSize: orientation ==
                                                          Orientation.portrait
                                                      ? (size.width * .008) *
                                                          (size.height * .01)
                                                      : (size.width * .022),
                                                ),
                                              ),
                                              Text(
                                                'Pcs = ${productList[index].piece}',
                                                style: TextStyle(
                                                    fontSize: orientation ==
                                                            Orientation.portrait
                                                        ? (size.width * .008) *
                                                            (size.height * .01)
                                                        : (size.width * .022)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 5,
                                              left: 10,
                                              right: 2),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Carton = ${sellCarton[productList[index].itemId]}',
                                                style: TextStyle(
                                                    fontSize: orientation ==
                                                            Orientation.portrait
                                                        ? (size.width * .008) *
                                                            (size.height * .01)
                                                        : (size.width * .022)),
                                              ),
                                              Text(
                                                'Pcs = ${sellPcs[productList[index].productName]}',
                                                style: TextStyle(
                                                    fontSize: orientation ==
                                                            Orientation.portrait
                                                        ? (size.width * .008) *
                                                            (size.height * .01)
                                                        : (size.width * .022)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: orientation ==
                                                  Orientation.portrait
                                              ? const EdgeInsets.only(
                                                  top: 15,
                                                  bottom: 5,
                                                  left: 15,
                                                  right: 2)
                                              : const EdgeInsets.only(
                                                  top: 15,
                                                  bottom: 5,
                                                  left: 10,
                                                  right: 2),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${totalAmounts[productList[index].itemId]}",
                                                style: TextStyle(
                                                    fontSize: orientation ==
                                                            Orientation.portrait
                                                        ? (size.width * .01) *
                                                            (size.height * .01)
                                                        : (size.width * .022)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        )
                      : const Center(child: Text("Product not out"))
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: const CircleAvatar(
        radius: 30,
        child: Text("OK"),
      ),
    );
  }
}
