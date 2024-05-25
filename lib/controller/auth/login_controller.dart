import 'package:e_learning/core/constant/routes.dart';
import 'package:e_learning/core/functions/handling_data_controller.dart';
import 'package:e_learning/core/functions/show_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/class/status_request.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/auth.dart';

class LoginController extends GetxController {
  late TextEditingController emailAddress, password, npassword, cpassword;
  AuthData authRequest = AuthData(Get.find());
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  Future<void> loginNavigatge(
      Map<String, dynamic> response, String dashboardRoute) async {
    final Map<String, dynamic> userData = response['userData'];
    await myServices.saveUser(userData);
    Get.offAllNamed(dashboardRoute);
  }

  void googleSignin() async {
    await GoogleSignIn().signOut();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    if (googleUser != null) {
      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final userEmail = googleUser.email;
      final fullName = googleUser.displayName;
      final profile = googleUser.photoUrl;
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await authRequest.checkEmail(userEmail, fullName!, profile ?? "null");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          loginNavigatge(response, AppRoute.userDashboard);
        } else {
          showErrorMessage("Goole sign-in failed");
        }
      }
    } else {
      throw showErrorMessage("Google sign-in failed");
    }
  }
}
