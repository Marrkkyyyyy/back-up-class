class NoteModel {
  String? noteID;
  String? subjectID;
  String? lesson;
  String? title;
  String? description;

  NoteModel(
      {this.noteID, this.subjectID, this.lesson, this.title, this.description});

  NoteModel.fromJson(Map<String, dynamic> json) {
    noteID = json['noteID'].toString();
    subjectID = json['subjectID'].toString();
    lesson = json['lesson'].toString();
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['noteID'] = noteID;
    data['subjectID'] = subjectID;
    data['lesson'] = lesson;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
