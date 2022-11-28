
import 'package:flutter/material.dart';
import 'package:pass_gestor/ui/screens/home/home.dart';
import 'package:pass_gestor/ui/screens/login/login.dart';
import 'package:provider/provider.dart';

import 'package:pass_gestor/ui/providers/providers.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) => const Center(child: Text('Espere...')),
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final autenticado = await authProvider.isLoggedIn();
             

    if (autenticado) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginScreen(),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      );
    }
  }
}
