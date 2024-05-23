class UserModel {
  String? userID;
  String? email;
  String? fullName;
  String? profile;

  UserModel({this.userID, this.email, this.fullName, this.profile});

  UserModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'].toString();
    email = json['email'];
    fullName = json['fullName'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['email'] = email;
    data['fullName'] = fullName;
    data['profile'] = profile;
    return data;
  }
}
