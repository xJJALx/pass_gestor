import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:pass_gestor/ui/global/environment.dart';
import 'package:pass_gestor/data/models/models.dart';
import 'package:pass_gestor/data/datasources/data_tests.dart';

class PassProvider extends ChangeNotifier {
  final apiUrl = Environment.apiUrl;
  List<Group> _groups = [];
  List<Password> _passwords = [];

  late Password? _passwordSelected;
  late Group? _groupSelected;
  late bool pinValidated;

  PassProvider() {
    pinValidated = false;
    _groupSelected = null;

    Future.delayed(const Duration(seconds: 3), (() => loadGroups(groupNameDataSource)));
    getPasswords();
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

  Future getPasswords() async {
    List<Password> passwords = [];

    final uri = Uri.parse('$apiUrl/passwords');
    final resp = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    final data = jsonDecode(resp.body);
    final passwordsJson = data['passwords'];

    if (resp.statusCode == 200) {
      for (var i = 0; i < passwordsJson.length; i++) {
        final pass = Password.fromJson(passwordsJson[i]);
        passwords.add(pass);
      }
      loadPasswords(passwords);
    }
  }

  loadGroups(List<Group> list) {
    _groups = [..._groups, ...list];
    _groupSelected = _groups[0];
    notifyListeners();
  }

 loadPasswords(List<Password> list) {
    _passwords = [...list];
    notifyListeners();
    // list.map((city) => debugPrint(city.active.toString())).toList();
  }

  addGroup(Group group) {
    //TODO Insertar en BD
  }

  // Modificamos los datos para evitar conflictos con el API(fechas)
  Future<bool> addPassword(Password pass) async {
    bool isAdded = false;
    final data = {
      "listpassId": pass.listpassId,
      "name": pass.name,
      "password": pass.password,
      "dateCreation" : pass.dateCreation!.toIso8601String(),
      "dateModify" : null,
      "active" : pass.active,
      "notes" : pass.notes
    };

    final uri = Uri.parse('$apiUrl/passwords/addPass');
    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (resp.statusCode == 200) {
      final passwordResponse = passwordResponseFromJson(resp.body);

      isAdded = true;
      pass.id = passwordResponse.password.id;
      setPasswords(pass);
    }

    return isAdded;
  }
}
