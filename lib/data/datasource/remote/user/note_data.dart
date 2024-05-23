import 'package:e_learning/core/class/crud.dart';
import 'package:e_learning/link_api.dart';

class NoteData {
  Crud crud;
  NoteData(this.crud);

  addNote(
    String subjectID,
    String lesson,
    String title,
    String description,
  ) async {
    var response = await crud.postData(AppLink.addNote, {
      "subjectID": subjectID,
      "lesson": lesson,
      "title": title,
      "description": description,
    });
    return response.fold((l) => l, (r) => r);
  }

  fetchNote(
    String subjectID,
    String lesson,
  ) async {
    var response = await crud.postData(AppLink.fetchNote, {
      "subjectID": subjectID,
      "lesson": lesson,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteNote(String noteID) async {
    var response = await crud.postData(AppLink.deleteNote, {
      "noteID": noteID,
    });
    return response.fold((l) => l, (r) => r);
  }

  updateNote(
    String noteID,
    String title,
    String description,
  ) async {
    var response = await crud.postData(AppLink.updateNote, {
      "noteID": noteID,
      "title": title,
      "description": description,
    });
    return response.fold((l) => l, (r) => r);
  }
}
