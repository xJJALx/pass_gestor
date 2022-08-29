import 'package:flutter/material.dart';
import 'package:pass_gestor/ui/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pass Gestor',
      initialRoute: 'pass-details',
      routes: appRoutes,
    );
  }
}