import 'package:e_learning/core/constant/routes.dart';
import 'package:e_learning/core/services/services.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  MyServices myServices = Get.find();
  String? userID;

  @override
  void onInit() {
    super.onInit();
    initializeUser();
  }

  Future<void> initializeUser() async {
    await checkUser();
    if (userID != null && userID!.isNotEmpty) {
      Get.offAllNamed(AppRoute.userDashboard);
    }
  }

  Future<void> checkUser() async {
    Map<String, dynamic>? userData = myServices.getUser();
    if (userData != null) {
      userID = userData["userID"].toString();
    }
  }
}
