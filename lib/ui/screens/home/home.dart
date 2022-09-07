import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pass_gestor/data/models/models.dart';
import 'package:pass_gestor/ui/providers/pass_provider.dart';
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
    final passProvider = Provider.of<PassProvider>(context);

    return Container(
      height: 200,
      padding: const EdgeInsets.all(35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              passProvider.groupSelected == null
                  ? Text('No hay listas', style: Theme.of(context).textTheme.titleLarge)
                  : _DropdownGroups(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (() {}),
                child: const CircleAction(
                  icon: Icons.library_books_rounded,
                  text: 'Nueva lista'
                ),
              ),
              GestureDetector(
                onTap: (() {
                  passProvider.addPasswords(Password(listpassId: 99, name: 'name', password: 'password'));
                }),
                child: const CircleAction(
                  icon: Icons.add,
                  text: 'Añadir'
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DropdownGroups extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final passProvider = Provider.of<PassProvider>(context);

    return DropdownButton<Group>(
      value: passProvider.groupSelected,
      icon: const Icon(Icons.arrow_drop_down),
      style: Theme.of(context).textTheme.titleLarge,
      focusColor: Colors.transparent,
      underline: Container(height: 1, color: Colors.transparent),
      onChanged: (Group? value) => passProvider.groupSelected = value!,
      items: passProvider.groups.map<DropdownMenuItem<Group>>((Group value) {
        return DropdownMenuItem<Group>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}

class _PassList extends StatelessWidget {
  const _PassList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passProvider = Provider.of<PassProvider>(context);

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
                itemCount: passProvider.passwords.length,
                itemBuilder: (_, __) {
                  return const PassCard();
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
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Text(
        'Tus contraseñas',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
