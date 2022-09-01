import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pass_gestor/ui/providers/pass_provider.dart';
import 'package:pass_gestor/ui/routes/routes.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PassProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pass Gestor',
      initialRoute: 'home',
      routes: appRoutes,
    );
  }
}
