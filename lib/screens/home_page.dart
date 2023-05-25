import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vai_vai_traders/controller/const_data.dart';
import 'package:vai_vai_traders/models/local_database/product_details_model.dart';
import 'package:vai_vai_traders/screens/Info_entry/product_entry_page.dart';
import 'package:vai_vai_traders/screens/Info_entry/store_data_test.dart';
import 'package:vai_vai_traders/screens/Info_entry/test_page.dart';
import 'package:vai_vai_traders/screens/product_out/product_search_page.dart';
import 'package:vai_vai_traders/screens/product_out/order_card_page.dart';
import 'package:vai_vai_traders/screens/products_in/product_in_page.dart';
import 'package:vai_vai_traders/screens/summary/summary_page.dart';
import 'package:vai_vai_traders/sync_data.dart';
import '../widgets/custom_text_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('VAI VAI TRADERS'),
        centerTitle: true,
        backgroundColor: appbarColor,
      ),
      endDrawer: Drawer(
        backgroundColor: backgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: appbarColor),
              child: const Center(
                child: Text(
                  "Vai Vai Traders",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: appbarColor.withOpacity(0.3),
                  child: const Icon(Icons.add)),
              title: const Text("Add Product"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductEntryScreen()));
              },
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              // tileColor: appbarColor.withOpacity(.09),
              leading: CircleAvatar(
                  backgroundColor: appbarColor.withOpacity(0.3),
                  child: const Icon(Icons.add)),
              title: const Text("Sync Data"),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SyncScreen()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            // Product Out
            CustomTextButton(
              callback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderCardPage(
                      finalListC: [],
                      finalListP: [],
                    ),
                  ),
                );
              },
              title: "Product Out",
            ),
            SizedBox(
              height: size.height * .02,
            ),

            // Product In
            CustomTextButton(
              callback: () async {
                await productData();
                await g();
                await gx();
                setState(() {});
              },
              title: "Product In",
            ),
            SizedBox(
              height: size.height * .02,
            ),

            // Product Summary
            CustomTextButton(
              callback: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductSummaryPage()));
              },
              title: "Product Summary",
            ),
            SizedBox(
              height: size.height * .02,
            ),

            // Button
          ],
        ),
      ),
    );
  }

  Future productData() async {
    Box box = Hive.box('productOrder');
    List<ProductOrder> productOutItems = box.toMap().values.toList().cast();
    print("P = ${productOutItems.length}");
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => ProductInPage(
        productOrder: productOutItems,
      ),
    ));
  }

  Future g() async {
    Box box = Hive.box('productDetails');
    List<ProductDetails> a = box.toMap().values.toList().cast();
    print("G = ${a.length}");
  }

  Future gx() async {
    Box box = Hive.box('productOrder');
    List<ProductOrder> a = box.toMap().values.toList().cast();
    print("Gx = ${a.length}");
  }
}
