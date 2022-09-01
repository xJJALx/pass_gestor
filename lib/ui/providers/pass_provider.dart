import 'package:flutter/material.dart';

import 'package:pass_gestor/data/models/models.dart';
import 'package:pass_gestor/data/datasources/dataTests.dart';

class PassProvider extends ChangeNotifier {
  List<Group> _groups = [];
  List<Password> _passwords = [];

  late String _groupSelected;
  late Password _passwordSelected;
  late bool pinValidated;

  PassProvider() {
    pinValidated = false;
    _groupSelected = 'No-List';
    _passwordSelected = Password(listpassId: 0, name: 'pass', password: 'password');

    Future.delayed(const Duration(seconds: 3), (() => loadGroups(groupNameDataSource)));
    Future.delayed(const Duration(seconds: 3), (() => loadPasswords(itemPassDataSource)));
  }

  String get listSelected => _groupSelected;
  Password get passwordSelected => _passwordSelected;
  List<Group> get group => _groups;
  List<Password> get passwords => _passwords;


  loadGroups(List<Group> list) {
    _groups = list;
    notifyListeners();
  }

  loadPasswords(List<Password> list) {
    _passwords = [...list];
    notifyListeners();
  }


}
