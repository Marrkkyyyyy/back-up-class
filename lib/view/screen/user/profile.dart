import 'package:e_learning/controller/user/dashboard_controller.dart';
import 'package:e_learning/view/widget/user/profile/custom_profile_name.dart';
import 'package:e_learning/view/widget/user/profile/custom_profile_picture.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.controller});
  final DashboardController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomProfilePicture(
              profile: controller.profile!, name: controller.displayName!),
          const SizedBox(height: 25),
          CustomProfileName(name: controller.displayName!)
        ],
      ),
    );
  }
}
