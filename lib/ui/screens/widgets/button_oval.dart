import 'package:flutter/material.dart';

class ButtonOval extends StatelessWidget {
  const ButtonOval({
    Key? key,
    required this.text,
    required this.onPressed,
    this.bgColor = Colors.blue,
  }) : super(key: key);

  final String text;
  final Function()? onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(32)),
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}
