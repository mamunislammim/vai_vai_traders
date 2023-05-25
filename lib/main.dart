import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vai_vai_traders/controller/open_all_box.dart';
import 'package:vai_vai_traders/models/local_database/product_details_model.dart';
import 'package:vai_vai_traders/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  await OpenAllBox().allBox();
  // Hive.registerAdapter(ProductDetailsAdapter());
  // await Hive.openBox("getProduct");
  // Hive.registerAdapter(ProductOrderAdapter());
  // await Hive.openBox("orderProduct");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: 'Vai_Vai_traders',
      home: const SplashScreen(),
    );
  }
}
