import 'package:flutter/material.dart';
import 'package:pass_gestor/ui/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'auth': (_) => const AuthGate(),
  'login': (_) => const LoginScreen(),
  'home': (_) => const HomeScreen(),
  'pass-details': (_) => PassDetailsScreen(),
};
