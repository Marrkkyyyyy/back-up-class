import 'package:e_learning/core/functions/handling_data_controller.dart';
import 'package:e_learning/core/functions/show_message.dart';
import 'package:e_learning/core/services/services.dart';
import 'package:e_learning/data/datasource/remote/user/user_data.dart';
import 'package:e_learning/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';

class DashboardController extends GetxController {
  RxInt currentPage = 0.obs;
  late PageController pageController;
  MyServices myServices = Get.find();
  UserData userRequest = UserData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  GlobalKey<FormState> updateFormstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest addRequest = StatusRequest.none;
  StatusRequest deleteRequest = StatusRequest.none;
  StatusRequest updateRequest = StatusRequest.none;
  late TextEditingController subjectName;
  late TextEditingController subjectNameUpdate;
  late RxList<SubjectModel> subjectList = RxList<SubjectModel>([]);
  String? userID;
  String? profile;
  String? displayName;

  Future<void> refreshData() async {
    fetchSubject();
  }

  validateInput() {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      addSubject();
    }
  }

  validateInputUpdate(String subjectID) {
    var formData = updateFormstate.currentState;
    if (formData!.validate()) {
      updateSubject(subjectID);
    }
  }

  void clearData() {
    subjectName.clear();
    subjectNameUpdate.clear();
    update();
  }

  fetchSubject() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await userRequest.fetchSubject(userID!);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> result = response['subject'];
        List<SubjectModel> subjects =
            result.map((data) => SubjectModel.fromJson(data)).toList();
        subjectList.assignAll(subjects.toList());
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addSubject() async {
    addRequest = StatusRequest.loading;
    update();
    EasyLoading.show(status: "Loading...", dismissOnTap: true);
    var response = await userRequest.addSubject(userID!, subjectName.text);
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

  updateSubject(String subjectID) async {
    updateRequest = StatusRequest.loading;
    update();
    EasyLoading.show(status: "Loading...", dismissOnTap: true);
    var response =
        await userRequest.updateSubject(subjectID, subjectNameUpdate.text);
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

  deleteSubject(String subjectID) async {
    deleteRequest = StatusRequest.loading;
    update();
    EasyLoading.show(status: "Loading...", dismissOnTap: true);
    var response = await userRequest.deleteSubject(subjectID);
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

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  logout() {
    myServices.logout();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    userID = myServices.getUser()?["userID"].toString();
    profile = myServices.getUser()?["profile"].toString();
    displayName = myServices.getUser()?["fullName"].toString();
    subjectName = TextEditingController();
    subjectNameUpdate = TextEditingController();
    fetchSubject();
    super.onInit();
  }

  @override
  void dispose() {
    subjectName.dispose();
    subjectNameUpdate.dispose();
    super.dispose();
  }
}
