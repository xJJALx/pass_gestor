class Password {
  String? id;
  String listpassId;
  String name;
  String password;
  DateTime? dateCreation;
  DateTime? dateModify;
  bool active;
  String notes;

  Password({
    required this.id,
    required this.listpassId,
    required this.name,
    required this.password,
    this.dateCreation,
    this.dateModify,
    this.active = true,
    this.notes = '',
  });

  // Model: PasswordResponse
  factory Password.fromJson(Map<String, dynamic> json) => Password(
        id: json["id"],
        listpassId: json["listpassId"],
        name: json["name"],
        password: json["password"],
        dateCreation: DateTime.parse(json["dateCreation"]),
        dateModify: json["dateModify"],
        active: json["active"] ?? true,
        notes: json["datenotesModify"] ?? '',
      );

  // Model: PasswordResponse
  Map<String, dynamic> toJson() => {
        "id": id,
        "listpassId": listpassId,
        "name": name,
        "password": password,
        "dateCreation": dateCreation,
        "dateModify": dateModify,
        "active": active,
        "notes": notes,
      };
}
 