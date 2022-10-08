import 'dart:convert';
import 'package:pass_gestor/data/models/models.dart';


PasswordResponse passwordResponseFromJson(String str) => PasswordResponse.fromJson(json.decode(str));

String passwordResponseToJson(PasswordResponse data) => json.encode(data.toJson());

class PasswordResponse {
    PasswordResponse({
        required this.ok,
        required this.password,
    });

    bool ok;
    Password password;

    factory PasswordResponse.fromJson(Map<String, dynamic> json) => PasswordResponse(
        ok: json["ok"],
        password: Password.fromJson(json["password"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "password": password.toJson(),
    };
}
