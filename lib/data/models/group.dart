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
}
