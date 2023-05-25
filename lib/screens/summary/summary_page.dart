import 'package:flutter/material.dart';
import 'package:vai_vai_traders/controller/const_data.dart';
import 'package:vai_vai_traders/screens/summary/summary_report.dart';
import '../../widgets/custom_appbar.dart';

class ProductSummaryPage extends StatefulWidget {
  const ProductSummaryPage({Key? key}) : super(key: key);

  @override
  State<ProductSummaryPage> createState() => _ProductSummaryPageState();
}

class _ProductSummaryPageState extends State<ProductSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
       appBar: AppBar(
         title: const Text("Product Summary"),
         backgroundColor: appbarColor,
       ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side:  BorderSide(color: Colors.green.withOpacity(.5), width: 5)),
                iconColor: Colors.white,
                collapsedIconColor: Colors.white,
                textColor: Colors.white,
                collapsedTextColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side:   BorderSide(color: Colors.green.withOpacity(.5), width: 5)),
                maintainState: true,
                collapsedBackgroundColor: Colors.blue.withOpacity(.5),
                backgroundColor: appbarColor.withOpacity(.5),
                childrenPadding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 15, right: 15),
                title: const Text(
                  "06-04-2023",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                leading: const Icon(Icons.summarize_outlined),
                subtitle: const Text(
                  "Dimla - Suthibari Road",
                  style: TextStyle(fontSize: 15,color: Colors.white),
                ),
                children: [
                  const Divider(
                    color: Colors.green,
                    thickness: 3,
                  ),
                  const Text("Total Sell : 25000",style: TextStyle(color: Colors.white,),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SummaryReport()));
                        },
                        child: Card(
                            color: buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Details",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
