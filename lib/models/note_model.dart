class NoteModel {
  int id;
  String title;
  String description;
  String creationDate;
  bool pinned;
  String color;

  NoteModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.creationDate,
      required this.pinned,
      required this.color});

  Map<String, dynamic> toMap() {
    return ({
      "id": id,
      "title": title,
      "description": description,
      "creationDate": creationDate.toString(),
      "pinned": pinned,
      "color": color
    });
  }
}

class NotesModel {
  late String title;
  late String description;
  late DateTime creationDate;
  late bool pinned;

  NotesModel(
      {required this.title,
      required this.description,
      required this.creationDate,
      required this.pinned});
}
