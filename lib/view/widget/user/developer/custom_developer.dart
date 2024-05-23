import 'package:e_learning/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDeveloper extends StatelessWidget {
  const CustomDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: Get.width * .7),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        decoration: const BoxDecoration(
            color: AppColor.skyBlue,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: const Center(
          child: Text("Developers",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Manrope",
                  fontSize: 22,
                  fontWeight: FontWeight.w600)),
        ));
  }
}
