

import 'package:flutter/material.dart';

import '../controller/const_data.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key,required this.callback,required this.title}) : super(key: key);

  final VoidCallback callback;
  final String title;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: callback,
      child: Container(
        height: MediaQuery.of(context).size.height * .12,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color:  buttonColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(.3),width: 5)
        ),
        child:   Center(
          child: Text(
            title,
            style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
        ),
      ),
    );
  }
}
