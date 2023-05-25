import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../sync_data.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future navigateScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('dataPut').toString() == 'true') {
      print("True");
      Future.delayed(const Duration(seconds: 1)).then((value) => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage())));
    } else {
      print("Fasle....");
      Future.delayed(const Duration(seconds: 1)).then((value) => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SyncScreen())));
    }
  }

  @override
  void initState() {
    navigateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
