

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vai_vai_traders/screens/home_page.dart';


void main(){
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight,
  // ]);
  //
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vai_Vai_traders',
      home: HomePage(),
    );
  }
}