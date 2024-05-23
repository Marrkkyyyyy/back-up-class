import 'package:e_learning/core/functions/handling_data_controller.dart';
import 'package:e_learning/core/functions/show_message.dart';
import 'package:e_learning/data/datasource/remote/user/note_data.dart';
import 'package:e_learning/data/model/note_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';

class LessonDetailsController extends GetxController {
  late TextEditingController title, titleUpdate, description, descriptionUpdate;

  late String lesson;
  late String subjectID;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  GlobalKey<FormState> updateFormstate = GlobalKey<FormState>();
  NoteData noteRequest = NoteData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest addRequest = StatusRequest.none;
  StatusRequest deleteRequest = StatusRequest.none;
  StatusRequest updateRequest = StatusRequest.none;
  late RxList<NoteModel> noteList = RxList<NoteModel>([]);
  Future<void> refreshData() async {
    fetchNote();
  }

  void clearData() {
    title.clear();
    titleUpdate.clear();
    description.clear();
    descriptionUpdate.clear();
    update();
  }

  validateInput() {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      addNote();
    }
  }

  validateInputUpdate(String noteID) {
    var formData = updateFormstate.currentState;
    if (formData!.validate()) {
      updateNote(noteID);
    }
  }

  fetchNote() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await noteRequest.fetchNote(
        subjectID, (int.parse(lesson) - 1).toString());
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> result = response['note'];
        List<NoteModel> notes =
            result.map((data) => NoteModel.fromJson(data)).toList();
        noteList.assignAll(notes.toList());
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addNote() async {
    addRequest = StatusRequest.loading;
    update();
    EasyLoading.show(status: "Loading...", dismissOnTap: true);
    var response = await noteRequest.addNote(subjectID,
        (int.parse(lesson) - 1).toString(), title.text, description.text);
    addRequest = handlingData(response);
    if (StatusRequest.success == addRequest) {
      EasyLoading.dismiss();
      if (response['status'] == "success") {
        Get.back(result: true);
      } else {
        showErrorMessage(response['message']);
      }
    } else if (addRequest == StatusRequest.offlinefailure) {
      addRequest = StatusRequest.none;
      showErrorMessage("No internet connection");
    } else if (StatusRequest.serverfailure == addRequest) {
      addRequest = StatusRequest.none;
      showErrorMessage(
          "Server failure. Please check your internet connection and try again");
    } else {
      EasyLoading.dismiss();
    }
    update();
  }

  updateNote(String noteID) async {
    updateRequest = StatusRequest.loading;
    update();
    EasyLoading.show(status: "Loading...", dismissOnTap: true);
    var response = await noteRequest.updateNote(
        noteID, titleUpdate.text, descriptionUpdate.text);
    updateRequest = handlingData(response);
    if (StatusRequest.success == updateRequest) {
      EasyLoading.dismiss();
      if (response['status'] == "success") {
        Get.back(result: "update");
      } else {
        showErrorMessage(response['message']);
      }
    } else if (updateRequest == StatusRequest.offlinefailure) {
      updateRequest = StatusRequest.none;
      showErrorMessage("No internet connection");
    } else if (StatusRequest.serverfailure == updateRequest) {
      updateRequest = StatusRequest.none;
      showErrorMessage(
          "Server failure. Please check your internet connection and try again");
    } else {
      EasyLoading.dismiss();
    }
    update();
  }

  deleteNote(String noteID) async {
    deleteRequest = StatusRequest.loading;
    update();
    EasyLoading.show(status: "Loading...", dismissOnTap: true);
    var response = await noteRequest.deleteNote(noteID);
    deleteRequest = handlingData(response);
    if (StatusRequest.success == deleteRequest) {
      EasyLoading.dismiss();
      if (response['status'] == "success") {
        Get.back(result: true);
      } else {
        showErrorMessage(response['message']);
      }
    } else if (deleteRequest == StatusRequest.offlinefailure) {
      deleteRequest = StatusRequest.none;
      showErrorMessage(response['message']);
    } else if (StatusRequest.serverfailure == deleteRequest) {
      deleteRequest = StatusRequest.none;
      showErrorMessage(
          "Server failure. Please check your internet connection and try again");
    } else {
      EasyLoading.dismiss();
    }
    update();
  }

  @override
  void onInit() {
    lesson = Get.arguments?['lesson'];
    subjectID = Get.arguments?['subjectID'];
    title = TextEditingController();
    titleUpdate = TextEditingController();
    description = TextEditingController();
    descriptionUpdate = TextEditingController();
    fetchNote();
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    titleUpdate.dispose();
    description.dispose();
    descriptionUpdate.dispose();
    super.dispose();
  }
}
