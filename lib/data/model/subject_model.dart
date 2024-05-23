class SubjectModel {
  String? subjectID;
  String? userID;
  String? subjectName;

  SubjectModel({this.subjectID, this.userID, this.subjectName});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    subjectID = json['subjectID'].toString();
    userID = json['userID'].toString();
    subjectName = json['subjectName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subjectID'] = subjectID;
    data['userID'] = userID;
    data['subjectName'] = subjectName;
    return data;
  }
}
