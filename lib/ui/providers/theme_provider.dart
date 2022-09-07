import 'package:flutter/material.dart';
import 'package:pass_gestor/ui/themes/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = AppTheme.purple;

  ThemeData get getTheme => _theme;

  set setTheme(String value) {
    if (value == 'purple') {
      _theme = AppTheme.purple;
    }
    notifyListeners();
  }
  
}
