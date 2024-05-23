import 'package:e_learning/controller/user/lesson_details_controller.dart';
import 'package:e_learning/core/class/handling_view_request.dart';
import 'package:e_learning/core/class/status_request.dart';
import 'package:e_learning/core/constant/color.dart';
import 'package:e_learning/core/constant/image_asset.dart';
import 'package:e_learning/core/functions/show_message.dart';
import 'package:e_learning/data/model/note_model.dart';
import 'package:e_learning/view/widget/custom_confirmation_dialog.dart';
import 'package:e_learning/view/widget/user/home/add_note_dialog.dart';
import 'package:e_learning/view/widget/user/home/update_note_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LessonDetails extends StatelessWidget {
  const LessonDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LessonDetailsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.skyBlue,
        title: Text(
          "Lesson ${controller.lesson}",
          style: const TextStyle(
              fontFamily: "Manrope", fontWeight: FontWeight.w600),
        ),
      ),
      body: GetBuilder<LessonDetailsController>(builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async {
            controller.refreshData();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * .888),
              child: HandlingViewRequest(
                statusRequest: controller.statusRequest,
                widget: controller.noteList.isEmpty
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                AppImageASset.empty,
                                repeat: false,
                                width: 150,
                              ),
                              const Text(
                                "No Data Found",
                                style: TextStyle(
                                    fontFamily: "Manrope",
                                    fontSize: 18,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Column(
                            children: List.generate(controller.noteList.length,
                                (index) {
                          NoteModel note = controller.noteList[index];
                          return GestureDetector(
                            onLongPress: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  controller.titleUpdate.text =
                                                      note.title!;
                                                  controller.descriptionUpdate
                                                      .text = note.description!;
                                                  return UpdateNoteDialog(
                                                    controller: controller,
                                                    noteID: note.noteID!,
                                                    title: note.title!,
                                                    description:
                                                        note.description!,
                                                  );
                                                }).then((value) {
                                              if (value == "update") {
                                                showSuccessMessage(
                                                    "Successfully Updated");
                                                Navigator.of(context).pop();
                                                controller.clearData();
                                                controller.fetchNote();
                                              }
                                            });
                                          },
                                          title: Row(
                                            children: const [
                                              FaIcon(
                                                FontAwesomeIcons.pencil,
                                                color: Colors.blue,
                                                size: 14,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                "Update",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "Manrope"),
                                              )
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return CustomConfirmationDialog(
                                                      confirmTextColor:
                                                          Colors.red,
                                                      message:
                                                          "Are you sure you want to delete this note?",
                                                      onCancel: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      onConfirm: controller
                                                                  .deleteRequest ==
                                                              StatusRequest
                                                                  .loading
                                                          ? () {}
                                                          : () {
                                                              Navigator.of(
                                                                  context);
                                                              controller
                                                                  .deleteNote(note
                                                                      .noteID!);
                                                            },
                                                      titleText: "Delete Note");
                                                }).then((value) {
                                              if (value == true) {
                                                Navigator.of(context).pop();
                                                controller.noteList.removeWhere(
                                                    (element) =>
                                                        element.noteID ==
                                                        note.noteID);
                                                controller.update();
                                                showSuccessMessage(
                                                    "Successfully Deleted");
                                              }
                                            });
                                          },
                                          title: Row(
                                            children: const [
                                              FaIcon(
                                                FontAwesomeIcons.trash,
                                                color: Colors.red,
                                                size: 14,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                "Delete",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "Manrope"),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: SizedBox(
                              width: Get.width,
                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          note.title!,
                                          style: const TextStyle(
                                              fontFamily: "Manrope",
                                              fontSize: 16,
                                              color: AppColor.darkSkyBlue,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          note.description!,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                              fontFamily: "Manrope",
                                              fontSize: 14,
                                              color: Colors.black54),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          );
                        })),
                      ),
              ),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.skyBlue,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddNoteDialog(
                  controller: controller,
                );
              }).then((value) {
            if (value == true) {
              showSuccessMessage("Successfully Added");
              controller.clearData();
              controller.fetchNote();
            }
          });
        },
        label: const Text("New Note"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
