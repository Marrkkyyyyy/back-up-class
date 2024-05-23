import 'package:e_learning/view/screen/auth/login.dart';
import 'package:e_learning/view/screen/user/dashboard.dart';
import 'package:e_learning/view/screen/user/lesson_details.dart';
import 'package:e_learning/view/screen/user/subject_lessons.dart';
import 'package:get/get.dart';

import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const LoginPage()),

  // ********************** Authentication
  GetPage(
      name: AppRoute.loginPage,
      page: () => const LoginPage(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200)),

  // ********************** User

  GetPage(
      name: AppRoute.userDashboard,
      page: () => const UserDashboard(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200)),

  GetPage(
      name: AppRoute.subjectLessons,
      page: () => const SubjectLessons(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200)),

  GetPage(
      name: AppRoute.lessonDetails,
      page: () => const LessonDetails(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200)),
];
