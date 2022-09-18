import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pass_gestor/ui/providers/pass_provider.dart';
import 'package:pass_gestor/ui/widgets/widgets.dart';


class PassDetailsScreen extends StatefulWidget {
  PassDetailsScreen({Key? key}) : super(key: key);

  final List<Widget> widgets = [];

  @override
  State<PassDetailsScreen> createState() => _PassDetailsScreenState();
}

class _PassDetailsScreenState extends State<PassDetailsScreen> {
  bool _isEdit = false;
  @override
  Widget build(BuildContext context) {
    final password = Provider.of<PassProvider>(context).passwordSelected;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                CardLarge(title: 'Contraseña', text: password!.password),
                const SizedBox(height: 50),
                const _Info(),
                CardBig(text: password.notes),
              ],
            ),
          ),
          if (_isEdit)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),
          ...widget.widgets,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,
        onPressed: () {
          _isEdit = !_isEdit;
          _isEdit 
            ? widget.widgets.add(const Popup()) 
            : widget.widgets.removeLast();
          setState(() {});
        },
        child: Icon(
          Icons.edit,
          color: Theme.of(context).cardColor.withOpacity(0.75),
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final password = Provider.of<PassProvider>(context).passwordSelected;
    final group = Provider.of<PassProvider>(context).groupSelected;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      child: Column(
        children: [
          Row(
            children: [
              CardSmall(title: 'NOMBRE', text: password!.name),
              CardSmall(title: 'LISTA', text: group!.name),
            ],
          ),
          Row(
            children: [
              CardSmall(title: 'FECHA CREACIÓN', text: password.dateCreation.toString()),
              CardSmall(title: 'FECHA MODIFICACIÓN', text: password.dateModify.toString()),
            ],
          )
        ],
      ),
    );
  }
}

class CardLarge extends StatelessWidget {
  const CardLarge({Key? key, this.title = '', this.text = ''}) : super(key: key);

  final String title, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
          Card(
            margin: const EdgeInsets.all(12),
            elevation: 0,
            color: Theme.of(context).cardColor.withOpacity(0.8),
            child: SizedBox(
              height: 75,
              width: double.infinity,
              child: Center(
                child: Text(text, style: const TextStyle(fontSize: 28)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardBig extends StatelessWidget {
  const CardBig({Key? key, this.text = ''}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(12),
            elevation: 0,
            color: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 150,
              width: double.infinity,
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}

class CardSmall extends StatelessWidget {
  const CardSmall({Key? key, this.title = '', this.text = ''}) : super(key: key);

  final String title, text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: size.width * 0.02),
          elevation: 0,
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(12),
            height: 80,
            width: size.width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Center(
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 22),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

