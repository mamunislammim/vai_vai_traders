import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';


class ProductSummaryPage extends StatefulWidget {
  const ProductSummaryPage({Key? key}) : super(key: key);

  @override
  State<ProductSummaryPage> createState() => _ProductSummaryPageState();
}

class _ProductSummaryPageState extends State<ProductSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(title: 'Product Summary Page',),
    );
  }
}
