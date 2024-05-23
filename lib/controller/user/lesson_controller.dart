import 'package:get/get.dart';

class LessonController extends GetxController {
  late String subjectName;
  late String subjectID;

  @override
  void onInit() {
    subjectName = Get.arguments?['subjectName'];
    subjectID = Get.arguments?['subjectID'];
    super.onInit();
  }
}
