import 'package:flutter/material.dart';
import 'package:pass_gestor/ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          _PassControl(),
          _PassList(),
        ],
      ),
    );
  }
}

class _PassControl extends StatelessWidget {
  const _PassControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('My home', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CircleAction(icon: Icons.abc, text: 'Nueva lista'),
              CircleAction(icon: Icons.abc, text: 'Add'),
            ],
          ),
        ],
      ),
    );
  }
}

class _PassList extends StatelessWidget {
  const _PassList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _HeaderTitle(),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shadowColor: Colors.cyan,
                    child: ListTile(leading: Text('$index')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  const _HeaderTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15),
      child: Text(
        'Tus contraseñas',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}
