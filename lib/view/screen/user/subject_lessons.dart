import 'package:e_learning/controller/user/lesson_controller.dart';
import 'package:e_learning/core/constant/color.dart';
import 'package:e_learning/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectLessons extends StatelessWidget {
  const SubjectLessons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LessonController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.skyBlue,
        title: Text(
          controller.subjectName,
          style: const TextStyle(
              fontFamily: "Manrope", fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
            children: List.generate(5, (index) {
          int num = index + 1;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.lessonDetails, arguments: {
                  "lesson": num.toString(),
                  "subjectID": controller.subjectID
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Card(
                  color: num % 2 == 0 ? Colors.white : AppColor.lightSky,
                  elevation: 2,
                  child: SizedBox(
                      width: Get.width,
                      child: Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "LESSON",
                            style: TextStyle(
                                fontFamily: "Manrope",
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "$num",
                            style: const TextStyle(
                                fontFamily: "Manrope",
                                fontSize: 24,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ))),
                ),
              ),
            ),
          );
        })),
      ),
    );
  }
}
