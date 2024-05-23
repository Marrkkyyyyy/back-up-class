import 'package:e_learning/controller/user/dashboard_controller.dart';
import 'package:e_learning/core/class/status_request.dart';
import 'package:e_learning/core/constant/color.dart';
import 'package:flutter/material.dart';

class AddSubjectDialog extends StatelessWidget {
  const AddSubjectDialog({super.key, required this.controller});
  final DashboardController controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Dialog(
        child: Form(
          key: controller.formstate,
          child: Container(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 12),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "New Subject",
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
                    controller: controller.subjectName,
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
                        onTap: controller.addRequest == StatusRequest.loading
                            ? () {}
                            : () {
                                controller.validateInput();
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.darkBlue,
                              borderRadius: BorderRadius.circular(4)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 30),
                          child: const Center(
                            child: Text(
                              "Add",
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
