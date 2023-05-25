

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../controller/const_data.dart';
import '../../models/product_entry_model.dart';


class StoreTtest extends StatefulWidget {
  const StoreTtest({Key? key}) : super(key: key);

  @override
  State<StoreTtest> createState() => _StoreTtestState();
}

class _StoreTtestState extends State<StoreTtest> {
  DateTime d = DateTime.now();
  final jsonReference = FirebaseDatabase.instance.ref('delyvary_product').child('');



  void _storeComplexJsonData() {
    final person = Person(
      name: 'John',
      age: 30,
      address: {
        'street': '123 Main St',
        'city': 'New York',
        'state': 'NY',
        'zip': '10001'
      },
    );
    final jsonMap = person.toJson();
    jsonReference.set(jsonMap);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: backgroundColor,
      body: ElevatedButton(
        onPressed: (){
          _storeComplexJsonData();
        },
        child: Center(child: Text("OKKKK")),
      ),

    );
  }
}
