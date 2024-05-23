import 'package:e_learning/controller/auth/login_controller.dart';
import 'package:e_learning/view/widget/auth/custom_auth_logo.dart';
import 'package:e_learning/view/widget/auth/custom_button_auth.dart';
import 'package:e_learning/view/widget/auth/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/google_logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitle(title: "BACK-UP CLASS"),
            const SizedBox(
              height: 50,
            ),
            const CustomAuthLogo(image: "images/logo.png"),
            const SizedBox(
              height: 80,
            ),
            CustomButtonFormAuth(
                logo: const GoogleLogo(),
                function: () {
                  controller.googleSignin();
                },
                text: "Login with Google")
          ],
        ),
      ),
    );
  }
}
