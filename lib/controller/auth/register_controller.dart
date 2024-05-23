import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/auth.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  AuthData authRequest = AuthData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
}
