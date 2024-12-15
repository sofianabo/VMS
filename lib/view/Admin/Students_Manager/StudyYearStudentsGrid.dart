import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Students_APIs/StudentPunishAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/widgets/Admin_Students/DropDownStudyYearStudents.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/DropDown.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFieldDialog.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class StudyYearStudentGrid extends StatelessWidget {
  TextEditingController reason = TextEditingController();

  StudyYearStudentGrid({super.key});

  List<Map<String, dynamic>> l = [
    {
      "name": "Laith Haitham Azzam",
      "result": "Successful",
      "level": "Twelveth scientific grade"
    },
    {
      "name": "Laith Haitham Azzam",
      "result": "Passing",
      "level": "Twelveth scientific grade"
    },
    {
      "name": "Laith Haitham Azzam",
      "result": "No Result",
      "level": "Twelveth scientific grade"
    },
    {
      "name": "Laith Haitham Azzam",
      "result": "Successful",
      "level": "Twelveth scientific grade"
    },
  ];

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
        itemCount: controller.stud.length,
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
                          child: Text("${controller.stud[index].fullName}",
                              style: Get.theme.textTheme.bodyMedium!.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Image.asset("../../images/Rectangle66.png",
                            height: 100, width: 100)
                      ],
                    ),
                    Text("${controller.stud[index].status}",
                        style: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            color: controller.stud[index].status == "sucssful"
                                ? Color(0xff2F9742)
                                : controller.stud[index].status == "Passing"
                                    ? Color(0xff972F2F)
                                    : Color(0xff134B70))),
                    Text("Grade Level: ${controller.stud[index].classes}",
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
                                                  controller.stud[index].id!);
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
                                        DropDownStudyYearStudents(
                                          title: "Penalty",
                                          type: "penalty",
                                          width: w / 3.6,
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
                                              TextFieldDialog(
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
                                              Text("Start Date",
                                                  style: Get.theme.textTheme
                                                      .bodyMedium!),
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
