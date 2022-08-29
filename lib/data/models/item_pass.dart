class ItemPass {
  int listpassId;
  String name;
  String password;
  DateTime? dateCreation;
  DateTime? dateModify;
  bool active;
  String notes;

  ItemPass({
    required this.listpassId,
    required this.name,
    required this.password,
    this.dateCreation,
    this.dateModify,
    this.active = true,
    this.notes = '',
  });
}
