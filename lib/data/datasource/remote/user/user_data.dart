import 'package:e_learning/core/class/crud.dart';
import 'package:e_learning/link_api.dart';

class UserData {
  Crud crud;
  UserData(this.crud);

  addSubject(String userID, String subjectName) async {
    var response = await crud.postData(AppLink.addSubject, {
      "userID": userID,
      "subjectName": subjectName,
    });
    return response.fold((l) => l, (r) => r);
  }

  fetchSubject(String userID) async {
    var response = await crud.postData(AppLink.fetchSubject, {
      "userID": userID,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteSubject(String subjectID) async {
    var response = await crud.postData(AppLink.deleteSubject, {
      "subjectID": subjectID,
    });
    return response.fold((l) => l, (r) => r);
  }

  updateSubject(String subjectID, String subjectName) async {
    var response = await crud.postData(AppLink.updateSubject, {
      "subjectID": subjectID,
      "subjectName": subjectName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
