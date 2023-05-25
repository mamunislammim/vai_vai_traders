import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vai_vai_traders/controller/api_call.dart';
import 'package:vai_vai_traders/models/local_database/product_details_model.dart';
import 'package:vai_vai_traders/models/product_entry_model.dart';
import 'package:vai_vai_traders/screens/home_page.dart';
import 'package:vai_vai_traders/widgets/custom_text_button.dart';

class SyncScreen extends StatefulWidget {
  const SyncScreen({Key? key}) : super(key: key);

  @override
  State<SyncScreen> createState() => _SyncScreenState();
}

class _SyncScreenState extends State<SyncScreen> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: isLoading == false ? CustomTextButton(
            callback: () async {
              setState(() {
                isLoading = true;
              });
              print("\n\nStart Sync Data in hive\n\n");
              await AllApiCall().getProduct();
              print("\n\nSync Done\n\n");
              Future.delayed(const Duration(seconds: 2)).then((value) =>
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomePage())));
            },
            title: "Sync Product",
          ) : const CircularProgressIndicator()
        ),
      ),
    );
  }
}
