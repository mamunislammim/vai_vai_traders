


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../controller/const_data.dart';
import '../../widgets/custom_appbar.dart';


class SummaryReport extends StatefulWidget {
  const SummaryReport({Key? key}) : super(key: key);

  @override
  State<SummaryReport> createState() => _SummaryReportState();
}

class _SummaryReportState extends State<SummaryReport> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xffef8f43),
        title: const Text("Thakurganj\n06-04-2023"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 10,right: 10),
            child: Text("Total : 25000",style: TextStyle(fontSize: 15),),
          ),
        ],
      ),
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
                color: Colors.blue,
                height: orientation == Orientation.portrait
                    ? size.height * 0.0638
                    : size.height * .1,
                width: orientation == Orientation.portrait
                    ? 500
                    : size.width,
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(.8),
                    1: FlexColumnWidth(.3),
                    2: FlexColumnWidth(.5),
                    3: FlexColumnWidth(.5),
                    4: FlexColumnWidth(.5),
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
                                        fontWeight: FontWeight.bold))                              ]),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Rate\n(Pcs)',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))                              ]),
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
                                        fontWeight: FontWeight.bold))                              ]),
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
                                        fontWeight: FontWeight.bold))                              ]),
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
                                        fontWeight: FontWeight.bold))                              ]),
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
                    ? 500
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
                          columnWidths: const {
                            0: FlexColumnWidth(.8),
                            1: FlexColumnWidth(.3),
                            2: FlexColumnWidth(.5),
                            3: FlexColumnWidth(.5),
                            4: FlexColumnWidth(.5),
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
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                  color: index.isEven
                                      ? Colors.grey.withOpacity(.1)
                                      : Colors.blueAccent.withOpacity(.1)),
                              children: [
                                Padding(
                                  padding:
                                  orientation == Orientation.portrait
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
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text('Funcrack Biscuits',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: orientation ==
                                                    Orientation
                                                        .portrait
                                                    ? (size.width * .009) *
                                                    (size.height *
                                                        .009)
                                                    : (size.width *
                                                    .007) *
                                                    (size.height *
                                                        .011))),
                                        Text('1 Carton = 72 Pcs, 300 Tk',
                                            style: TextStyle(
                                              color: Colors.white,
                                                fontSize: orientation ==
                                                    Orientation
                                                        .portrait
                                                    ? (size.width *
                                                    .006) *
                                                    (size.height *
                                                        .008)
                                                    : (size.width *
                                                    .006) *
                                                    (size.height *
                                                        .009))),
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 5,
                                      left: 2,
                                      right: 2),
                                  child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        Text('4.5',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: orientation ==
                                                    Orientation
                                                        .portrait
                                                    ? (size.width * .008) *
                                                    (size.height *
                                                        .009)
                                                    : (size.width *
                                                    .007) *
                                                    (size.height *
                                                        .011))),
                                        Text('Tk',
                                            style: TextStyle(
                                                color: Colors.white,

                                                fontSize: orientation ==
                                                    Orientation
                                                        .portrait
                                                    ? (size.width *
                                                    .007) *
                                                    (size.height *
                                                        .008)
                                                    : (size.width *
                                                    .007) *
                                                    (size.height *
                                                        .011))),
                                      ]),
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
                                        Text('Carton = 5',
                                            style: TextStyle(
                                                color: Colors.white,

                                                fontSize: orientation ==
                                                    Orientation
                                                        .portrait
                                                    ? (size.width *
                                                    .007) *
                                                    (size.height *
                                                        .008)
                                                    : (size.width *
                                                    .007) *
                                                    (size.height *
                                                        .011))),
                                        Text('Pcs = 10',
                                            style: TextStyle(
                                                color: Colors.white,

                                                fontSize: orientation ==
                                                    Orientation
                                                        .portrait
                                                    ? (size.width *
                                                    .007) *
                                                    (size.height *
                                                        .008)
                                                    : (size.width *
                                                    .007) *
                                                    (size.height *
                                                        .011))),
                                      ]),
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
                                        Text('Carton = 5',
                                            style: TextStyle(
                                                color: Colors.white,

                                                fontSize: orientation ==
                                                    Orientation
                                                        .portrait
                                                    ? (size.width *
                                                    .007) *
                                                    (size.height *
                                                        .008)
                                                    : (size.width *
                                                    .007) *
                                                    (size.height *
                                                        .011))),
                                        Text('Pcs = 10',
                                            style: TextStyle(
                                                color: Colors.white,

                                                fontSize: orientation ==
                                                    Orientation
                                                        .portrait
                                                    ? (size.width *
                                                    .007) *
                                                    (size.height *
                                                        .008)
                                                    : (size.width *
                                                    .007) *
                                                    (size.height *
                                                        .011))),
                                      ]),
                                ),
                                Padding(
                                  padding : orientation == Orientation.portrait
                                      ? const EdgeInsets.only(
                                      top: 15,
                                      bottom: 5,
                                      left: 20,
                                      right: 2)
                                      : const EdgeInsets.only(
                                      top: 15,
                                      bottom: 5,
                                      left: 2,
                                      right: 2),
                                  child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text('1000.00',
                                            style: TextStyle(
                                                color: Colors.white,

                                                fontSize: orientation ==
                                                    Orientation
                                                        .portrait
                                                    ? (size.width * .008) *
                                                    (size.height *
                                                        .008)
                                                    : (size.width *
                                                    .009) *
                                                    (size.height *
                                                        .011))),
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
    );
  }
}
