import 'package:e_learning/core/constant/routes.dart';
import 'package:e_learning/core/services/services.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  MyServices myServices = Get.find();
  String? userID;
  Future checkUser() async {
    userID = myServices.getUser()?["userID"].toString();
  }

  @override
  void onInit() {
    checkUser().whenComplete(() {
      if (userID!.isNotEmpty) {
        Get.offAllNamed(AppRoute.userDashboard);
      }
    });

    super.onInit();
  }
}
