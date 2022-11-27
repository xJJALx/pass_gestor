import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pass_gestor/ui/global/environment.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool _autenticando = false;


  bool get autenticando => _autenticando;

  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    autenticando = true;

    final data = {"email": email, "password": password};

    final uri = Uri.parse('${Environment.apiUrl}/login');

    final resp = await http.post(uri, body: jsonEncode(data), headers: {'Content-type': 'application/json'});

    autenticando = false;

    if (resp.statusCode == 200) {
      // final loginResponse = loginResponseFromJson(resp.body);
      // usuario = loginResponse.usuario;

      // await _guardarToken(loginResponse.token);

      return true;
    } else {
      return false;
    }
  }


}
