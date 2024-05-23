import 'package:e_learning/controller/user/dashboard_controller.dart';
import 'package:e_learning/core/class/status_request.dart';
import 'package:e_learning/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateSubjectDialog extends StatelessWidget {
  const UpdateSubjectDialog(
      {super.key,
      required this.controller,
      required this.subjectID,
      required this.subjectName});
  final DashboardController controller;
  final String subjectID;
  final String subjectName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Dialog(
        child: Form(
          key: controller.updateFormstate,
          child: Container(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 12),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Update Subject",
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: "Manrope",
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: controller.subjectNameUpdate,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter required field";
                      } else {
                        return null;
                      }
                    },
                    autofocus: true,
                    decoration: const InputDecoration(
                        isDense: true,
                        labelText: "Subject",
                        hintText: "Enter subject",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 196, 196, 196),
                              borderRadius: BorderRadius.circular(4)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          child: const Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontFamily: "Manrope",
                                  fontSize: 16,
                                  color: Colors.black45),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: controller.updateRequest == StatusRequest.loading
                            ? () {}
                            : () {
                                if (controller.subjectNameUpdate.text ==
                                    subjectName) {
                                  Get.back();
                                } else {
                                  controller.validateInputUpdate(subjectID);
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                }
                              },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.darkBlue,
                              borderRadius: BorderRadius.circular(4)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 30),
                          child: const Center(
                            child: Text(
                              "Update",
                              style: TextStyle(
                                  fontFamily: "Manrope",
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
