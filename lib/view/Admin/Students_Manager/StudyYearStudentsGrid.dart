import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students_APIs/StudentPunishAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownPenaltyController.dart';
import 'package:vms_school/widgets/Admin_Students/DropDownStudyYearStudents.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/DropDown.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFieldDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class StudyYearStudentGrid extends StatefulWidget {

  StudyYearStudentGrid({super.key});

  @override
  State<StudyYearStudentGrid> createState() => _StudyYearStudentGridState();
}

class _StudyYearStudentGridState extends State<StudyYearStudentGrid> {
  TextEditingController reason = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return GetBuilder<StudyYearStudentsController>(builder: (controller) {
      return  controller.isLoading == true ?
      GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.2),
        itemCount: 8,
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 1)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [



                        Expanded(
                          child:   SchemaWidget(width: 50, height: 15),
                        ),
                        SchemaWidget(width: 100, height: 100 , radius: 100,),
                      ],
                    ),
                    SchemaWidget(width: 50, height: 15),
                    SchemaWidget(width: 50, height: 15),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SchemaWidget(width: 25, height: 25,radius: 3,),
                          SchemaWidget(width: 25, height: 25,radius: 3,),
                        ],
                      ),
                    )
                  ],
                )),
          ) .animate(onPlay: (controller) => controller.repeat())
              .shimmer(
              duration: Duration(seconds: 2),
              color: Get.theme.primaryColor.withOpacity(0.1));
        },
      )
          : GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.2),
        itemCount: controller.filteredStudents!.length,
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 1)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text("${controller.filteredStudents![index].fullName}",
                              style: Get.theme.textTheme.bodyMedium!.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        FutureBuilder(
                          future: precacheImage(NetworkImage("$getimage${controller.filteredStudents![index].fileId}"), context),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              return  CircleAvatar(
                                maxRadius: 60,
                                backgroundColor: const Color(0xffC4C4C4),
                                backgroundImage:
                                controller.filteredStudents![index].fileId != null
                                    ? NetworkImage("$getimage${controller.filteredStudents![index].fileId}") :
                                null,

                                child: controller.filteredStudents![index].fileId == null
                                    ? const Icon(
                                  Icons.image_outlined,
                                  color: Colors.white,
                                  size: 35,
                                )
                                    : null,
                              );
                            } else {
                              return CircleAvatar(
                                maxRadius: 60,
                                backgroundColor: const Color(0xffC4C4C4),
                                child: LoadingAnimationWidget.inkDrop(
                                  color: Theme.of(context).primaryColor,
                                  size: 30,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    Text("${controller.filteredStudents![index].state}",
                        style: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            color: controller.filteredStudents![index].state == "Passing"
                                ? Color(0xff2F9742)
                                : controller.filteredStudents![index].state == "Failed"
                                    ? Color(0xff972F2F)
                                    : Color(0xff134B70))),
                    Text("Grade Level: ${controller.filteredStudents![index].grade!.enName}",
                        style: Get.theme.textTheme.bodyMedium),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Colors.transparent),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    side: BorderSide(
                                        color: Get.theme.primaryColor),
                                  ))),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    VMS_Icons.vcard,
                                    size: 14,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5.0),
                                    child: Text("First Season"),
                                  ),
                                ],
                              )),
                          TextButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Colors.transparent),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    side: BorderSide(
                                        color: Get.theme.primaryColor),
                                  ))),
                              onPressed: () {
                                Get.dialog(VMSAlertDialog(
                                    action: [
                                      ButtonDialog(
                                        width: 90,
                                        onPressed: () async {
                                          await Studentpunishapi(context)
                                              .Studentpunish(
                                                  1,
                                                  reason.text,
                                                  controller.startdate.value
                                                      .toString(),
                                                  controller.enddate.value
                                                      .toString(),
                                                  controller.filteredStudents![index].id!);
                                        },
                                        color: Get.theme.primaryColor,
                                        text: "Send",
                                      )
                                    ],
                                    contents: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 350,
                                        ),
                                        GetBuilder<Dropdownpenaltycontroller>(
                                          builder: (PController) {
                                            return DropDownStudyYearStudents(
                                              isLoading: PController.Isloading,
                                              title: "Penalty",
                                              type: "penalty",
                                              width: w / 3.6,
                                            );
                                          }
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("The Reason",
                                                  style: Get
                                                      .theme
                                                      .primaryTextTheme
                                                      .labelSmall),
                                              Textfildwithupper(
                                                Uptext: "The Reason",
                                                  isRequired: true,
                                                  width: w / 3.6,
                                                  controller: reason,
                                                  hinttext: "The Reason"),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, bottom: 15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 5.0),
                                                child: RichText(
                                                  text: TextSpan(
                                                      text: "Start Date",
                                                    style: Get.theme.textTheme.bodyMedium!
                                                        .copyWith(fontSize: 14,fontWeight: FontWeight.normal),
                                                      children: [
                                                        TextSpan(
                                                          text: " *",
                                                          style: TextStyle(color: Colors.red, fontSize: 16),
                                                        ),
                                                      ]
                                                  ),
                                                ),
                                              ),
                                              penaltyStartDate(width: w / 3.6)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, bottom: 15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("End Date",
                                                  style: Get.theme.textTheme
                                                      .bodyMedium!),
                                              PenaltyEndDate(width: w / 3.6)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    apptitle: "Punishing Student",
                                    subtitle: ""));
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.person_remove_outlined, size: 14),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5.0),
                                    child: Text("Punishing"),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                )),
          );
        },
      );
    });
  }
}
