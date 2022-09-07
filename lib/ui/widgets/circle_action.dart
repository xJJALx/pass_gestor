import 'package:flutter/material.dart';
import 'package:pass_gestor/ui/themes/app_theme.dart';

class CircleAction extends StatelessWidget {
  const CircleAction({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).highlightColor),
            color: Theme.of(context).hintColor,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: Icon(
            icon,
            size: 30,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        Text(text, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
