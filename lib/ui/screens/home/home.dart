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


// Actualizar el estado del widget hijo desde el padre (Botón de añadir, muestra el input en rojo si no está cumplimentado)
// https://stackoverflow.com/questions/48481590/how-to-set-update-state-of-statefulwidget-from-other-statefulwidget-in-flutter
class _PassControl extends StatefulWidget {
  const _PassControl({Key? key}) : super(key: key);

  @override
  State<_PassControl> createState() => _PassControlState();
}

class _PassControlState extends State<_PassControl> {
  final GlobalKey<_CustomInputState> _nameChildKey = GlobalKey();
  final GlobalKey<_CustomInputState> _passChildKey = GlobalKey();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

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
                onTap: (() => _addPass()),
                child: const CircleAction(icon: Icons.add, text: 'Añadir'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> _addPass() {
    return showDialog(
      context: context,
      builder: ((context) {
        // return StatefulBuilder(builder: (context, StateSetter setState) {
        return AlertDialog(
          title: const Text('Nueva contraseña'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  CustomInput(
                    key: _nameChildKey,
                    controller: nameCtrl,
                    name: 'Nombre',
                    icon: Icons.alternate_email,
                  ),
                  const SizedBox(height: 20),
                  CustomInput(
                    key: _passChildKey,
                    controller: passCtrl,
                    name: 'Contraseña',
                    icon: Icons.password,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                final passProvider = Provider.of<PassProvider>(context, listen: false);
                if (nameCtrl.text.isEmpty) _nameChildKey.currentState!.validateInput();
                if (passCtrl.text.isEmpty) _passChildKey.currentState!.validateInput();

                //TODO: Comprobar que hay un grupo seleccionado antes de crear, por ejemplo si no hay internet?
                if (nameCtrl.text.isNotEmpty && passCtrl.text.isNotEmpty) {
                  Password newPassword = Password(
                    id:'',
                    listpassId: passProvider.groupSelected!.id!,
                    name: nameCtrl.text,
                    password: passCtrl.text,
                  );

                  passProvider.addPassword(newPassword);
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
        // });
      }),
    );
  }
}

class CustomInput extends StatefulWidget {
  const CustomInput({
    Key? key,
    required this.controller,
    required this.name,
    required this.icon,
    // required this.function,
  }) : super(key: key);

  final TextEditingController controller;
  final String name;
  final IconData icon;
  // final VoidCallback function;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  // Inicializado en true para que no muestre error nada mas abrir el popup
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: (value) {
        setState(() {
          value.isEmpty ? isValid = false : isValid = true;
        });
      },
      decoration: InputDecoration(
        labelText: widget.name,
        labelStyle: TextStyle(
          color: Theme.of(context).textTheme.labelMedium!.color,
        ),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Theme.of(context).highlightColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Theme.of(context).hintColor),
        ),
        errorText: !isValid ? 'Campo obligatorio' : null,
        suffixIcon: Icon(widget.icon, color: Theme.of(context).primaryColor),
      ),
    );
  }

  validateInput() {
    setState(() {
      widget.controller.text.isEmpty ? isValid = false : isValid = true;
    });
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
