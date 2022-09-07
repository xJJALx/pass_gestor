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
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),      
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).hintColor,
          child: Text(
            'A',
            style: TextStyle(color: Theme.of(context).iconTheme.color),
          ),
        ),
        trailing: GestureDetector(
          onTap: () => setState(() => _isObscure = !_isObscure),
          child: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: Text('abc@gmail.com',style: Theme.of(context).textTheme.titleMedium) ,
        subtitle: _isObscure 
          ? Text('*******', style: Theme.of(context).textTheme.titleSmall) 
          : Text('password', style: Theme.of(context).textTheme.titleSmall),
      ),
    );
  }
}
