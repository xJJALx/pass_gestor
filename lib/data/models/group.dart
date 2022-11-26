class Group {
  String? id;
  String uid;
  String name;
  DateTime? dateCreation;
  DateTime? dateModify;
  bool active;

  Group({
    required this.id,
    required this.uid,
    required this.name,
    this.dateCreation,
    this.dateModify,
    this.active = true,
  });


  // Model: GroupResponse
  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        uid: json["uid"],
        name: json["name"],
        dateCreation: DateTime.parse(json["dateCreation"]),
        dateModify: json["dateModify"],
        active: json["active"] ?? true,
      );

  // Model: GroupResponse
  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "name": name,
        "dateCreation": dateCreation,
        "dateModify": dateModify,
        "active": active,
      };
}

 