class ListPass {
  int? id;
  String uid;
  String name;
  DateTime? dateCreation;
  DateTime? dateModify;
  bool active;

  ListPass({
    required this.id,
    required this.uid,
    required this.name,
    this.dateCreation,
    this.dateModify,
    this.active = true,
  });
}
