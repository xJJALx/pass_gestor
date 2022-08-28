import 'package:flutter/material.dart';

class PassCard extends StatefulWidget {
  const PassCard({Key? key}) : super(key: key);

  @override
  State<PassCard> createState() => _PassCardState();
}

class _PassCardState extends State<PassCard> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.cyan,
      child: ListTile(
        leading: CircleAvatar(child: Text('A')),
        trailing: GestureDetector(
          onTap: () => setState(() => _isObscure = !_isObscure),
          child: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
        ),
        title: Text('abc@gmail.com'),
        subtitle: _isObscure ? const Text('*******') : Text('password'),
      ),
    );
  }
}
