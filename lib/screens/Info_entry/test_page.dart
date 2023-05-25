

import 'package:flutter/material.dart';

class TestPAge extends StatefulWidget {
  const TestPAge({Key? key}) : super(key: key);

  @override
  State<TestPAge> createState() => _TestPAgeState();
}

class _TestPAgeState extends State<TestPAge> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(

            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              enabled: true,
              //errorText: "sd",
              labelText: 'Comment',
            ),
          ),
          TextField(
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){}, child: Text("ADD"))
        ],
      ),
    );
  }
}
