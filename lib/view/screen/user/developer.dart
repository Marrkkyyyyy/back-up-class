import 'package:e_learning/view/widget/user/developer/custom_developer.dart';
import 'package:e_learning/view/widget/user/developer/custom_developer_course.dart';
import 'package:e_learning/view/widget/user/developer/custom_developer_name.dart';
import 'package:e_learning/view/widget/user/developer/custom_developer_profile.dart';
import 'package:flutter/material.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const CustomDeveloper(),
          const SizedBox(height: 25),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CustomDeveloperProfile(image: "images/male.png"),
              SizedBox(
                height: 10,
              ),
              CustomDeveloperName(name: "Cedric Dale Iligan"),
              CustomDeveloperCourse(),
              SizedBox(
                height: 20,
              ),
              CustomDeveloperProfile(image: "images/female.png"),
              SizedBox(
                height: 10,
              ),
              CustomDeveloperName(name: "Shane Star Armentia"),
              CustomDeveloperCourse()
            ],
          )
        ]);
  }
}
