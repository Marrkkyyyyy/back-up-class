import 'package:e_learning/controller/user/dashboard_controller.dart';
import 'package:e_learning/core/constant/color.dart';
import 'package:e_learning/core/functions/show_message.dart';
import 'package:e_learning/view/screen/user/developer.dart';
import 'package:e_learning/view/screen/user/home.dart';
import 'package:e_learning/view/screen/user/intro.dart';
import 'package:e_learning/view/screen/user/profile.dart';
import 'package:e_learning/view/widget/user/home/add_subject_dialog.dart';
import 'package:e_learning/view/widget/user/home/custom_bottom_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Back-up Class"),
          backgroundColor: AppColor.skyBlue,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  controller.logout();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        floatingActionButton: Obx(() {
          return controller.currentPage.value == 1
              ? FloatingActionButton.extended(
                  backgroundColor: AppColor.skyBlue,
                  label: const Text("Add Subject"),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddSubjectDialog(
                            controller: controller,
                          );
                        }).then((value) {
                      if (value == true) {
                        showSuccessMessage("Successfully Added");
                        controller.clearData();
                        controller.fetchSubject();
                      }
                    });
                  },
                  icon: const Icon(Icons.add),
                )
              : Container();
        }),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomFloatingActionButton(
                  icon: FontAwesomeIcons.book,
                  function: () {
                    controller.goToTab(1);
                  }),
              CustomFloatingActionButton(
                  icon: FontAwesomeIcons.user,
                  function: () {
                    controller.goToTab(2);
                  }),
              CustomFloatingActionButton(
                  icon: FontAwesomeIcons.paperclip,
                  function: () {
                    controller.goToTab(3);
                  }),
            ],
          ),
        ),
        body: GetBuilder<DashboardController>(builder: (controller) {
          return PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const IntroPage(),
              HomePage(controller: controller),
              ProfilePage(controller: controller),
              const DeveloperPage()
            ],
          );
        }));
  }
}
