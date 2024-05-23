import 'package:e_learning/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomDeveloperProfile extends StatelessWidget {
  const CustomDeveloperProfile({super.key, required this.image});
final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColor.skyBlue,
              width: 5,
            ),
          ),
          child: ClipOval(child: Image.asset(image)));
  }
}