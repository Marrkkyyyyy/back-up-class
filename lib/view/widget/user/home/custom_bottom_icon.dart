import 'package:e_learning/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final Function function;
  const CustomFloatingActionButton(
      {super.key, required this.icon, required this.function});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(
        icon,
        color: AppColor.skyBlue,
        size: 18,
      ),
      onPressed: () {
        function();
      },
    );
  }
}
