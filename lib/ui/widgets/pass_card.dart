import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pass_gestor/data/models/models.dart';
import 'package:pass_gestor/ui/providers/pass_provider.dart';

class PassCard extends StatefulWidget {
  const PassCard(this.password, {Key? key}) : super(key: key);
  final Password password;

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
      child: GestureDetector(
        onTap: (() {
          Provider.of<PassProvider>(context, listen: false).passwordSelected = widget.password;
          Navigator.pushNamed(context, 'pass-details');
        }),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).hintColor,
            child: Text(
              widget.password.name[0].toUpperCase(),
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
          title: Text(
            widget.password.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: _isObscure 
            ? Text('*******', style: Theme.of(context).textTheme.titleSmall) 
            : Text(widget.password.password, style: Theme.of(context).textTheme.titleSmall),
        ),
      ),
    );
  }
}
