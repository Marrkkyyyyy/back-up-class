import 'package:e_learning/view/widget/auth/custom_auth_logo.dart';
import 'package:e_learning/view/widget/auth/custom_title.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CustomTitle(title: "BACK-UP CLASS"),
          SizedBox(
            height: 50,
          ),
          CustomAuthLogo(image: "images/logo.png"),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
