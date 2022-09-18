import 'package:flutter/material.dart';
 
class Popup extends StatelessWidget {
  const Popup({Key? key, this.text = ''}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.only(top: 210, left: 10, right: 10),
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 370,
              width: double.infinity,
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}