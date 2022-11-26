import 'dart:convert';
import 'package:pass_gestor/data/models/models.dart';


GroupResponse groupResponseFromJson(String str) => GroupResponse.fromJson(json.decode(str));

String groupResponseToJson(GroupResponse data) => json.encode(data.toJson());

class GroupResponse {
    GroupResponse({
        required this.ok,
        required this.group,
    });

    bool ok;
    Group group;

    factory GroupResponse.fromJson(Map<String, dynamic> json) => GroupResponse(
        ok: json["ok"],
        group: Group.fromJson(json["group"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "group": group.toJson(),
    };
}
