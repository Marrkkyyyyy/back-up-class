import 'package:e_learning/core/class/crud.dart';
import 'package:e_learning/core/functions/global_controller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(GlobalController());
  }
}
