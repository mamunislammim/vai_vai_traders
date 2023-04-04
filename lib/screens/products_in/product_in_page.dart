import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vai_vai_traders/widgets/custom_TextFieldWidget.dart';
import '../../widgets/custom_appbar.dart';

class ProductOutPage extends StatefulWidget {
  const ProductOutPage({Key? key}) : super(key: key);

  @override
  State<ProductOutPage> createState() => _ProductOutPageState();
}

class _ProductOutPageState extends State<ProductOutPage> {
  List<List<String>>? data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      // appBar: const CustomAppbar(
      //   title: 'Product In Page',
      // ),
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
                      color: Colors.red,
                      height: orientation == Orientation.portrait
                          ? size.height * 0.0638
                          : size.height * .1,
                      width: orientation == Orientation.portrait
                          ? 1000
                          : size.width,
                      child: Table(
                        //defaultColumnWidth: const FixedColumnWidth(120.0),
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2),
                        children: const [
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Product Name',
                                          style: TextStyle(fontSize: 20.0))
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Rate(Pcs)',
                                          style: TextStyle(fontSize: 20.0))
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Order',
                                          style: TextStyle(fontSize: 20.0))
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Back',
                                          style: TextStyle(fontSize: 20.0))
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Sell',
                                          style: TextStyle(fontSize: 20.0))
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Total',
                                          style: TextStyle(fontSize: 20.0))
                                    ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: orientation == Orientation.portrait
                          ? size.height * .905
                          : size.height * .8,
                      width: orientation == Orientation.portrait
                          ? 1000
                          : size.width,
                      color: Colors.grey,
                      child: SingleChildScrollView(
                        child: ListView.builder(
                            //scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 50,
                            itemBuilder: (context, index) {
                              return Table(
                                //defaultColumnWidth: const FixedColumnWidth(120.0),
                                border: TableBorder.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 2),
                                children: [
                                  TableRow(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('Funcrack  Buiscuites',
                                                  style: TextStyle())
                                            ]),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('4',
                                                  style:
                                                      TextStyle(fontSize: 20.0))
                                            ]),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('100 Carton\n10 Pcs',
                                                  style:
                                                      TextStyle(fontSize: 15))
                                            ]),
                                      ),
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
                                                  )),
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
                                                  )),
                                            ],
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('2 Cartoon\n0 Pcs',
                                                  style:
                                                      TextStyle(fontSize: 15.0))
                                            ]),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('1000',
                                                  style:
                                                      TextStyle(fontSize: 20.0))
                                            ]),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
      floatingActionButton: CircleAvatar(
        radius: 30,
        child: Text("OK"),
      ),
    );
  }
}
