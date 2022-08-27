import 'package:flutter/material.dart';

class CircleAction extends StatelessWidget {
  const CircleAction({
    Key? key,
    required this.icon,
    required this.text,
    this.bgColor = Colors.cyan,
    this.iconColor = Colors.pinkAccent,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Color bgColor, iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: bgColor),
            color: bgColor,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: Icon(icon, size: 30, color: iconColor),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
