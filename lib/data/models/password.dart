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
}
