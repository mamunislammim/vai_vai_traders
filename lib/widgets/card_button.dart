
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding:
        const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
        child: Text(
          title.toString(),
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
