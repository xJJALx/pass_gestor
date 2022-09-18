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
                  text: 'Nueva lista',
                ),
              ),
              GestureDetector(
                onTap: (() => _addPass(context)),
                child: const CircleAction(icon: Icons.add, text: 'Añadir'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> _addPass(BuildContext context) {
    TextEditingController nameCtrl = TextEditingController();
    TextEditingController passCtrl = TextEditingController();
    Password newPassword = Password(listpassId: 0, name: 'name', password: 'password');

    return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('Nueva contraseña'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextField(
                    controller: nameCtrl,
                    decoration: _customInput(
                      context,
                      'Nombre',
                      Icons.alternate_email_outlined,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passCtrl,
                    decoration: _customInput(
                      context,
                      'Contraseña',
                      Icons.password_outlined,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                newPassword.name = nameCtrl.text;
                newPassword.password = passCtrl.text;
                if(nameCtrl.text.isNotEmpty && passCtrl.text.isNotEmpty){
                Provider.of<PassProvider>(context, listen: false).addPasswords(newPassword);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).hintColor,
                onPrimary: Colors.white,
                shape: const StadiumBorder(),
              ),
              child: const Text('Añadir'),
            )
          ],
        );
      }),
    );
  }

  InputDecoration _customInput(BuildContext context, String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: Theme.of(context).textTheme.labelMedium!.color, //<-- SEE HERE
      ),
      border: const OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Theme.of(context).highlightColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Theme.of(context).hintColor),
      ),
      // errorText: 'Error message',
      suffixIcon: Icon(icon, color: Theme.of(context).primaryColor),
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
    final passwords = Provider.of<PassProvider>(context).passwords;

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
                itemCount: passwords.length,
                itemBuilder: (_, i) {
                  return PassCard(passwords[i]);
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
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        'Tus contraseñas',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
