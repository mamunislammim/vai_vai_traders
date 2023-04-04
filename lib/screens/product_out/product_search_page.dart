import 'package:flutter/material.dart';
import 'package:vai_vai_traders/controller/const_data.dart';
import 'package:vai_vai_traders/screens/product_out/product_view_page.dart';
import '../../widgets/custom_TextFieldWidget.dart';
import '../../widgets/custom_appbar.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({Key? key}) : super(key: key);

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _checkText = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbarColor,
        // appBar: App(),
        //appBar: const CustomAppbar(title: 'Product Search Page',),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
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
                            _checkText = true;
                          });
                        },
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          hintText: 'Search here...',
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
              Card(
                elevation: .5,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 7,
                          child: Text(
                            "Product Name",
                            style: TextStyle(
                                fontSize: size.width * .05,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            "Carton",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * .05),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            "  Pcs",
                            style: TextStyle(
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
                  height: size.height * .78,
                  // color: Colors.red,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 50,
                      itemBuilder: (_, index) {
                        return Card(
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
                                          "Funcrack Biscuits ghg gf ydth",
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
                              Expanded(
                                  flex: 2, child: CustomTextFieldWidget(size: size)),
                              Expanded(
                                  flex: 2, child: CustomTextFieldWidget(size: size)),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductViewPage()));
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
        ),
      ),
    );
  }
}
