import 'package:flutter/material.dart';

class PassDetailsScreen extends StatelessWidget {
  const PassDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 167, 249),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const CardLarge(title: 'Contraseña', text: 'ACV******'),
            const SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
              child: Column(
                children: [
                  Row(
                    children: const [
                      CardSmall(title: 'NOMBRE', text: 'jj@gmail.com'),
                      CardSmall(title: 'LISTA', text: 'Emails'),
                    ],
                  ),
                  Row(
                    children: const [
                      CardSmall(title: 'FECHA CREACIÓN', text: '13/03/1993'),
                      CardSmall(title: 'FECHA MODIFICACIÓN', text: '13/03/1993'),
                    ],
                  )
                ],
              ),
            ),
            const CardBig(text: 'Notas',)
          ],
        ),
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
            color: Color.fromARGB(255, 255, 207, 253),
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
            color: Color.fromARGB(255, 255, 192, 252).withOpacity(0.85),
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
          color: Color.fromARGB(255, 255, 192, 252).withOpacity(0.85),
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

