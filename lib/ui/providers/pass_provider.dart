import 'package:flutter/material.dart';

import 'package:pass_gestor/data/models/models.dart';
import 'package:pass_gestor/data/datasources/data_tests.dart';

class PassProvider extends ChangeNotifier {
  List<Group> _groups = [];
  List<Password> _passwords = [];

  late Password? _passwordSelected;
  late Group? _groupSelected;
  late bool pinValidated;

  PassProvider() {
    pinValidated = false;
    _groupSelected = null;

    Future.delayed(const Duration(seconds: 3), (() => loadGroups(groupNameDataSource)));
    Future.delayed(const Duration(seconds: 3), (() => loadPasswords(itemPassDataSource)));
    // Future.delayed(const Duration(seconds: 5), (() => loadPasswords([  Password(listpassId: 1, name: 'name', password: 'password'),])));
  }

  Group? get groupSelected => _groupSelected;
  Password? get passwordSelected => _passwordSelected;
  List<Group> get groups => _groups;
  List<Password> get passwords => _passwords;

  set groupSelected(Group? group) {
    _groupSelected = group;
    notifyListeners();
  }

  set passwordSelected(Password? pass) {
    _passwordSelected = pass;
    notifyListeners();
  }

  setPasswords(Password pass) {
    _passwords.add(pass);
    notifyListeners();
  }

  setGroups(Group group) {
    _groups.add(group);
    notifyListeners();
  }

  loadGroups(List<Group> list) {
    _groups = [..._groups, ...list];
    _groupSelected = _groups[0];
    notifyListeners();
  }

  loadPasswords(List<Password> list) {
    _passwords = [...list];
    notifyListeners();
  }

  addGroup(Group group) {
    //TODO Insertar en BD
  }

  addPassword(Password pass) {
    //TODO Insertar en BD
    setPasswords(pass);
  }
}
