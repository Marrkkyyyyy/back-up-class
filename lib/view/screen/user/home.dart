import 'package:e_learning/controller/user/dashboard_controller.dart';
import 'package:e_learning/core/class/handling_view_request.dart';
import 'package:e_learning/core/class/status_request.dart';
import 'package:e_learning/core/constant/color.dart';
import 'package:e_learning/core/constant/image_asset.dart';
import 'package:e_learning/core/constant/routes.dart';
import 'package:e_learning/core/functions/show_message.dart';
import 'package:e_learning/data/model/subject_model.dart';
import 'package:e_learning/view/widget/custom_confirmation_dialog.dart';
import 'package:e_learning/view/widget/user/home/update_subject_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.controller});
  final DashboardController controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          controller.refreshData();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * .888),
            child: Column(
              children: [
                controller.statusRequest == StatusRequest.success
                    ? const SizedBox()
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * .30,
                      ),
                HandlingViewRequest(
                  statusRequest: controller.statusRequest,
                  widget: controller.subjectList.isEmpty
                      ? Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .27,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  AppImageASset.empty,
                                  repeat: false,
                                  width: 150,
                                ),
                                const Text(
                                  "No Data Found",
                                  style: TextStyle(
                                      fontFamily: "Manrope",
                                      fontSize: 18,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(controller.subjectList.length,
                              (index) {
                            SubjectModel subject =
                                controller.subjectList[index];
                            return GestureDetector(
                              onLongPress: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    controller.subjectNameUpdate
                                                            .text =
                                                        subject.subjectName!;
                                                    return UpdateSubjectDialog(
                                                        subjectName: subject
                                                            .subjectName!,
                                                        subjectID:
                                                            subject.subjectID!,
                                                        controller: controller);
                                                  }).then((value) {
                                                if (value == "update") {
                                                  showSuccessMessage(
                                                      "Successfully Updated");
                                                  Navigator.of(context).pop();
                                                  controller.clearData();
                                                  controller.fetchSubject();
                                                }
                                              });
                                            },
                                            title: Row(
                                              children: const [
                                                FaIcon(
                                                  FontAwesomeIcons.pencil,
                                                  color: Colors.blue,
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  "Update",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: "Manrope"),
                                                )
                                              ],
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return CustomConfirmationDialog(
                                                        confirmTextColor:
                                                            Colors.red,
                                                        message:
                                                            "Are you sure you want to delete this subject?",
                                                        onCancel: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        onConfirm: controller
                                                                    .deleteRequest ==
                                                                StatusRequest
                                                                    .loading
                                                            ? () {}
                                                            : () {
                                                                Navigator.of(
                                                                    context);
                                                                controller
                                                                    .deleteSubject(
                                                                        subject
                                                                            .subjectID!);
                                                              },
                                                        titleText:
                                                            "Delete Subject");
                                                  }).then((value) {
                                                if (value == true) {
                                                  Navigator.of(context).pop();
                                                  controller.subjectList
                                                      .removeWhere((element) =>
                                                          element.subjectID ==
                                                          subject.subjectID);
                                                  controller.update();
                                                  showSuccessMessage(
                                                      "Successfully Deleted");
                                                }
                                              });
                                            },
                                            title: Row(
                                              children: const [
                                                FaIcon(
                                                  FontAwesomeIcons.trash,
                                                  color: Colors.red,
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: "Manrope"),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    });
                              },
                              onTap: () {
                                Get.toNamed(AppRoute.subjectLessons,
                                    arguments: {
                                      "subjectName": subject.subjectName,
                                      "subjectID": subject.subjectID,
                                    });
                              },
                              child: Card(
                                elevation: 2,
                                child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    width: Get.width,
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 16),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: Get.width * .7,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      subject.subjectName!,
                                                      style: const TextStyle(
                                                          fontFamily: "Manrope",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                              right: 0,
                                              top: 0,
                                              bottom: 0,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 16,
                                              ),
                                            ),
                                            const Positioned(
                                              left: 0,
                                              top: 0,
                                              bottom: 0,
                                              child: Center(
                                                child: FaIcon(
                                                  FontAwesomeIcons.book,
                                                  color: AppColor.skyBlue,
                                                  size: 24,
                                                ),
                                              ),
                                            )
                                          ],
                                        ))),
                              ),
                            );
                          })),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
