import 'package:flutter/material.dart';
import 'package:pass_gestor/ui/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => const HomeScreen(),
  'pass-details': (_) => const PassDetailsScreen(),
};
