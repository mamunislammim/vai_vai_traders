import 'package:flutter/material.dart';
import 'package:vai_vai_traders/screens/product_out/product_search_page.dart';
import 'package:vai_vai_traders/screens/products_in/product_in_page.dart';
import 'package:vai_vai_traders/screens/summary_page.dart';

import '../widgets/card_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VAI VAI TRADERS'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white.withOpacity(.8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ProductSearchPage()));
                      },
                      child: const CardButton(
                        title: 'Product Out',
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProductOutPage()));
                        },
                        child: const CardButton(title: 'Product In')),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductSummaryPage()));
                  },
                  child: const CardButton(title: 'Summary')),
            ),
          ],
        ),
      ),
    );
  }
}
