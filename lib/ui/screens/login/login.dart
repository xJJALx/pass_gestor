import 'package:flutter/material.dart';
import 'package:pass_gestor/ui/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'package:pass_gestor/ui/screens/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Login', style: TextStyle(fontSize: 30)),
                _Form(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          LoginInput(
            icon: Icons.mail_outline,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          LoginInput(
            icon: Icons.mail_outline,
            placeholder: 'Password',
            keyboardType: TextInputType.emailAddress,
            isPassword: true,
            textController: passCtrl,
          ),
          ButtonOval(
            text: 'Acceder',
            onPressed: authProvider.autenticando
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final loginOk = await authProvider.login(emailCtrl.text.trim(), passCtrl.text.trim());

                    if (!mounted) return; // https://stackoverflow.com/questions/68871880/do-not-use-buildcontexts-across-async-gaps
             
                    if (loginOk) {
                      // socketService.connect();
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      alert(context, 'Login incorrecto', 'Revise sus credenciales');
                    }
                  },
          ),
        ],
      ),
    );
  }
}
