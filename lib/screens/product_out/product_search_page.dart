// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:vai_vai_traders/controller/const_data.dart';
// import 'package:vai_vai_traders/models/local_database/product_details_model.dart';
//
// class ProductSearchPage extends StatefulWidget {
//   ProductSearchPage(
//       {super.key,
//       required this.finalItemList,
//       required this.productDetails,
//       required this.tempListFunc});
//   List<ProductOrder> finalItemList;
//   List<ProductDetails> productDetails;
//   Function tempListFunc;
//
//   @override
//   State<ProductSearchPage> createState() => _ProductSearchPageState();
// }
//
// class _ProductSearchPageState extends State<ProductSearchPage> {
//   final TextEditingController _searchController = TextEditingController();
//   final TextEditingController _cartonController = TextEditingController();
//   final TextEditingController _pcsController = TextEditingController();
//
//   Map<String, TextEditingController> controllers = {};
//   bool _checkText = false;
//   String _ck = "Mama";
//   List<ProductOrder> tempList = [];
//   List<ProductDetails> productList = [];
//
//   @override
//   void initState() {
//     setState(() {
//       productList = widget.productDetails;
//       for (var i in productList) {
//         controllers[i.itemId] = TextEditingController();
//       }
//
//       for (var element in widget.finalItemList) {
//         controllers.forEach((key, value) {
//           if (key == element.itemId) {
//             value.text = element.carton.toString();
//           }
//         });
//       }
//
//       for (var i in productList) {
//         controllers["${i.itemId}P"] = TextEditingController();
//       }
//
//       for (var element in widget.finalItemList) {
//         controllers.forEach((key, value) {
//           if (key == "${element.itemId}P") {
//             value.text = element.piece.toString();
//           }
//         });
//       }
//     });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: backgroundColor,
//         // appBar: App(),
//         //appBar: const CustomAppbar(title: 'Product Search Page',),
//         body: SingleChildScrollView(
//           physics: const NeverScrollableScrollPhysics(),
//           child: Column(
//             children: [
//               Container(
//                 color: appbarColor,
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       top: 5, bottom: 5, left: 10, right: 10),
//                   child: Row(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: const CircleAvatar(
//                           backgroundColor: Colors.white,
//                           child: Icon(Icons.arrow_back),
//                         ),
//                       ),
//                       Container(
//                         width: size.width * .77,
//                         margin: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white),
//                         child: TextField(
//                           onChanged: (value) {
//                             setState(() {
//                               _ck = value;
//                               _checkText = true;
//                             });
//                           },
//                           controller: _searchController,
//                           decoration: InputDecoration(
//                             hintStyle: const TextStyle(
//                               color: Colors.black,
//                             ),
//                             hintText: 'Search product here...',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             suffixIcon: _checkText == false
//                                 ? const Icon(Icons.search)
//                                 : InkWell(
//                                     onTap: () {
//                                       setState(() {
//                                         _searchController.clear();
//                                       });
//                                     },
//                                     child: const Icon(Icons.close)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Card(
//                 color: const Color(0xff008080),
//                 elevation: .5,
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                           flex: 7,
//                           child: Text(
//                             "  Product Name",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: size.width * .05,
//                                 fontWeight: FontWeight.bold),
//                           )),
//                       Expanded(
//                           flex: 2,
//                           child: Text(
//                             "Carton",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: size.width * .05),
//                           )),
//                       Expanded(
//                           flex: 2,
//                           child: Text(
//                             "  Pcs",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: size.width * .05),
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//               SingleChildScrollView(
//                 physics: const NeverScrollableScrollPhysics(),
//                 child: SizedBox(
//                     height: size.height * .65,
//                     child: ListView.builder(
//                       physics: const BouncingScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: productList.length,
//                       itemBuilder: (_, index) {
//                         return Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                     flex: 8,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                           top: 5, bottom: 3, left: 6, right: 6),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             mainAxisSize: MainAxisSize.min,
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Expanded(
//                                                 flex: 5,
//                                                 child: Text(
//                                                   productList[index]
//                                                           .productName
//                                                           .toString() ??
//                                                       "",
//                                                   style: TextStyle(
//                                                       fontSize:
//                                                           (size.height * .0093) *
//                                                               (size.width * .009),
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 flex: 2,
//                                                 child: Text(
//                                                   "  (${productList[index].netWeight.toString() ?? ""}mg)",
//                                                   style: TextStyle(
//                                                     fontSize:
//                                                         (size.height * .0083) *
//                                                             (size.width * .0065),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Text(
//                                             "1 Carton = ${productList?[index].cartonToPcs.toString() ?? ""} Pcs,   ${productList?[index].cartonPrice.toString() ?? ""}Tk",
//                                             style: TextStyle(
//                                               fontSize: (size.height * .007) *
//                                                   (size.width * .007),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     )),
//                                 Expanded(
//                                   flex: 4,
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       SizedBox(
//                                         height: 50,
//                                         width: 50,
//                                         child: TextField(
//                                           controller: controllers[
//                                               productList[index].itemId],
//                                           onChanged: (value) {
//                                             if (value != '') {
//                                               var temp = ProductOrder(
//                                                   productName:
//                                                       productList[index]
//                                                           .productName,
//                                                   netWeight: productList[index]
//                                                       .netWeight,
//                                                   cartonToPcs:
//                                                       productList[index]
//                                                           .cartonToPcs,
//                                                   cartonPrice:
//                                                       productList[index]
//                                                           .cartonPrice,
//                                                   itemId:
//                                                       productList[index].itemId,
//                                                   carton: controllers[
//                                                           productList[index]
//                                                               .itemId]!
//                                                       .text,
//                                                   piece: '0');
//
//                                               var tList =
//                                                   temp.itemId.toString();
//                                               widget.finalItemList.removeWhere(
//                                                   (element) =>
//                                                       tList == element.itemId);
//                                               widget.finalItemList.add(temp);
//                                               setState(() {});
//                                             } else if (value == '') {
//                                               var temp = ProductOrder(
//                                                   productName:
//                                                       productList[index]
//                                                           .productName,
//                                                   netWeight: productList[index]
//                                                       .netWeight,
//                                                   cartonToPcs:
//                                                       productList[index]
//                                                           .cartonToPcs,
//                                                   cartonPrice:
//                                                       productList[index]
//                                                           .cartonPrice,
//                                                   itemId:
//                                                       productList[index].itemId,
//                                                   carton: value == ''
//                                                       ? '0'
//                                                       : controllers[
//                                                               productList[index]
//                                                                   .itemId]!
//                                                           .text,
//                                                   piece: '0');
//
//                                               var tList =
//                                                   temp.itemId.toString();
//                                               widget.finalItemList.removeWhere(
//                                                   (element) =>
//                                                       tList == element.itemId);
//                                               setState(() {});
//                                             }
//                                           },
//                                           keyboardType: TextInputType.number,
//                                           inputFormatters: [
//                                             FilteringTextInputFormatter
//                                                 .digitsOnly,
//                                           ],
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                             contentPadding:
//                                                 const EdgeInsets.all(2),
//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const Spacer(),
//                                       SizedBox(
//                                         height: 50,
//                                         width: 50,
//                                         child: TextField(
//                                           controller: controllers[
//                                               "${productList[index].itemId}P"],
//                                           onChanged: (value) {
//                                             setState(() {
//                                               if (value != '') {
//                                                 var temp = ProductOrder(
//                                                     productName:
//                                                         productList[index]
//                                                             .productName,
//                                                     netWeight:
//                                                         productList[index]
//                                                             .netWeight,
//                                                     cartonToPcs:
//                                                         productList[index]
//                                                             .cartonToPcs,
//                                                     cartonPrice:
//                                                         productList[index]
//                                                             .cartonPrice,
//                                                     itemId: productList[index]
//                                                         .itemId,
//                                                     carton: '0',
//                                                     piece: controllers[
//                                                             "${productList[index].itemId}P"]!
//                                                         .text);
//
//                                                 var tList =
//                                                     temp.itemId.toString();
//                                                 widget.finalItemList
//                                                     .removeWhere((element) =>
//                                                         tList ==
//                                                         element.itemId);
//                                                 widget.finalItemList.add(temp);
//                                               } else if (value == '') {
//                                                 var temp = ProductOrder(
//                                                     productName:
//                                                         productList[index]
//                                                             .productName,
//                                                     netWeight:
//                                                         productList[index]
//                                                             .netWeight,
//                                                     cartonToPcs:
//                                                         productList[index]
//                                                             .cartonToPcs,
//                                                     cartonPrice:
//                                                         productList[index]
//                                                             .cartonPrice,
//                                                     itemId: productList[index]
//                                                         .itemId,
//                                                     carton: '0',
//                                                     piece: value == ''
//                                                         ? '0'
//                                                         : controllers[
//                                                                 "${productList[index].itemId}P"]!
//                                                             .text);
//
//                                                 var tList =
//                                                     temp.itemId.toString();
//                                                 widget.finalItemList
//                                                     .removeWhere((element) =>
//                                                         tList ==
//                                                         element.itemId);
//                                               }
//                                             });
//                                           },
//                                           keyboardType: TextInputType.number,
//                                           inputFormatters: [
//                                             FilteringTextInputFormatter
//                                                 .digitsOnly,
//                                           ],
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                             contentPadding:
//                                                 const EdgeInsets.all(2),
//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     )),
//               ),
//               InkWell(
//                 onTap: () {
//                   widget.tempListFunc(widget.finalItemList);
//
//                   print(
//                       "\n\n\n Widget FinalItemList = ${widget.finalItemList.length}");
//                   Navigator.pop(context);
//                   // print(" Temp : ${tempList[0].itemId}");
//
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) => OrderCardPage(
//                   //       draftOrderItem: widget.finalItemList,
//                   //     ),
//                   //   ),
//                   // );
//                 },
//                 child: Row(
//                   children: [
//                     Card(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       color: appbarColor,
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                             top: 15, bottom: 15, right: 11, left: 11),
//                         child: Text(
//                           "Save Item",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: size.width * .062),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
