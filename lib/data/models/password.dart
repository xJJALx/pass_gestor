class Password {
  int listpassId;
  String name;
  String password;
  DateTime? dateCreation;
  DateTime? dateModify;
  bool active;
  String notes;

  Password({
    required this.listpassId,
    required this.name,
    required this.password,
    this.dateCreation,
    this.dateModify,
    this.active = true,
    this.notes = '',
  });
}
