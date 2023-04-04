import 'package:flutter/material.dart';
import 'package:vai_vai_traders/controller/const_data.dart';
import 'package:vai_vai_traders/screens/home_page.dart';

import '../../widgets/custom_TextFieldWidget.dart';
import '../../widgets/custom_appbar.dart';


class ProductViewPage extends StatefulWidget {
  const ProductViewPage({Key? key}) : super(key: key);

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return   Scaffold(
      backgroundColor: Colors.cyan,
      appBar: const CustomAppbar(title: 'Product View Page',),
      body:    Column(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: size.height * .78,
              // color: Colors.red,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 50,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Funcrack Biscuits Ghee Makha ",
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold,fontSize: size.width * .05),
                                    ),
                                    Text(
                                      "36 Pcs = 1 carton  | 288 TK",
                                      style:
                                      TextStyle(fontSize: size.width * .04),
                                    ),
                                  ],
                                ),
                              )),
                          const Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Text("Carton = 10"),
                                  Text("Pcs =  50")
                                ],
                              ))
                          ],
                      ),
                    );
                  }),
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=> HomePage()));
          }, child: Text("OK"))
        ],
      ),
    );
  }
}
