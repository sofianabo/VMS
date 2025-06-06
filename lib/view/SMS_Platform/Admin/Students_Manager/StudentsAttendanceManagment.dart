import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/AddStudentAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/IncreaseAttendanceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/StudentsAttendanceManagmentGrid.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_Students/DropDownStudentsAttendencemgmt.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Calender.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class StudentsAttendanceManagment extends StatefulWidget {
  const StudentsAttendanceManagment({super.key});

  @override
  State<StudentsAttendanceManagment> createState() =>
      _StudentsAttendanceManagmentState();
}

class _StudentsAttendanceManagmentState
    extends State<StudentsAttendanceManagment> {
  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Get.find<Student_attendence_controller>().AttendencetDate.value =
        DateTime.now();
    Get.find<Student_attendence_controller>().allHolidayChecked.value = false;
    Getallgradeapi.Getallgrade();
    IncreaseAttendanceAPI(context).GetIncreaseAttendance(
        DateTime: Get.find<Student_attendence_controller>()
            .AttendencetDate
            .value
            .toString());
    super.initState();
  }

  TextEditingController cuse = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        if (w > 769)
          GetBuilder<Student_attendence_controller>(builder: (controller) {
            return Container(
              width: w,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runAlignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 8.0,
                spacing: 8.0,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 8.0,
                    spacing: 8.0,
                    children: [
                      DropDownStudentsAttendencemgmt(
                        isLoading: controller.isGradeLoading,
                        type: "grade",
                        title: "Grade".tr,
                        width: 250,
                      ),
                      DropDownStudentsAttendencemgmt(
                        isDisabled: controller.gradeIndex == "" ? true : false,
                        isLoading: controller.isClassLoading,
                        type: "class",
                        title: "Class".tr,
                        width: 250,
                      ),
                      DropDownStudentsAttendencemgmt(
                        isLoading: controller.isDivisionLoading,
                        isDisabled: controller.classIndex == "" ? true : false,
                        type: "division",
                        title: "Division".tr,
                        width: 250,
                      ),
                      SetStudentsDateAttendence(
                        enable: !controller.isLoading,
                        allowedDates: controller.noAttendanceDatas ??
                            ["${DateTime.now()}"],
                        width: 250,
                      ),
                      SizedBox(
                          width: 250.0,
                          child: Obx(() => Row(
                                children: [
                                  Checkbox(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    value: controller.allHolidayChecked.value,
                                    onChanged: (value) {
                                      if (controller.isUploaded == true ||
                                          controller.isLoading == true) {
                                      } else {
                                        if (value == true) {
                                          Get.dialog(Directionality(
                                            textDirection:
                                                Get.find<LocalizationController>()
                                                            .currentLocale
                                                            .value
                                                            .languageCode ==
                                                        'ar'
                                                    ? TextDirection.rtl
                                                    : TextDirection.ltr,
                                            child: VMSAlertDialog(
                                                action: [
                                                  ButtonDialog(
                                                      text: "Done".tr,
                                                      onPressed: () {
                                                        controller
                                                            .setAllAsHoliday(
                                                                value!,
                                                                cuse.text);
                                                        Get.back();
                                                      },
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      width: 65)
                                                ],
                                                contents: SizedBox(
                                                  width: 500,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Textfildwithupper(
                                                          width: 250,
                                                          controller: cuse,
                                                          Uptext: "Cause".tr,
                                                          hinttext: "Cause".tr)
                                                    ],
                                                  ),
                                                ),
                                                apptitle:
                                                    "Enter The Reason For Absence"
                                                        .tr,
                                                subtitle:
                                                    "The reason for the absence of the all students"
                                                        .tr),
                                          ));
                                        } else {
                                          controller.setAllAsHoliday(
                                              value!, null);
                                        }
                                      }
                                    },
                                  ),
                                  Text("Set All As a Holiday".tr),
                                ],
                              ))),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 1)
                        ]),
                    child: IconButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).cardColor),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () async {
                          if (controller.isLoading == false) {
                            if (controller.isUploaded == false) {
                              await Addstudentattendenceapi
                                  .Addstudentattendence(
                                      DateTime: controller.AttendencetDate.value
                                          .toString(),
                                      students: controller.students);
                            }
                          }
                        },
                        icon: Icon(Icons.file_upload_outlined,
                            size: 22,
                            color: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .color!)),
                  ),
                ],
              ),
            );
          }),
        if (w <= 769)
          GetBuilder<Student_attendence_controller>(builder: (controller) {
            return Container(
              width: w,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropDownStudentsAttendencemgmt(
                      isLoading: controller.isGradeLoading,
                      type: "grade",
                      title: "Grade".tr,
                      width: 250,
                    ),
                    DropDownStudentsAttendencemgmt(
                      isDisabled: controller.gradeIndex == "" ? true : false,
                      isLoading: controller.isClassLoading,
                      type: "class",
                      title: "Class".tr,
                      width: 250,
                    ),
                    DropDownStudentsAttendencemgmt(
                      isLoading: controller.isDivisionLoading,
                      isDisabled: controller.classIndex == "" ? true : false,
                      type: "division",
                      title: "Division".tr,
                      width: 250,
                    ),
                    SetStudentsDateAttendence(
                      enable: !controller.isLoading,
                      allowedDates:
                          controller.noAttendanceDatas ?? ["${DateTime.now()}"],
                      width: 250,
                    ),
                    SizedBox(
                        width: 250.0,
                        child: Obx(() => Row(
                              children: [
                                Checkbox(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  value: controller.allHolidayChecked.value,
                                  onChanged: (value) {
                                    if (controller.isUploaded == true ||
                                        controller.isLoading == true) {
                                    } else {
                                      if (value == true) {
                                        Get.dialog(Directionality(
                                          textDirection:
                                              Get.find<LocalizationController>()
                                                          .currentLocale
                                                          .value
                                                          .languageCode ==
                                                      'ar'
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
                                          child: VMSAlertDialog(
                                              action: [
                                                ButtonDialog(
                                                    text: "Done".tr,
                                                    onPressed: () {
                                                      controller
                                                          .setAllAsHoliday(
                                                              value!,
                                                              cuse.text);
                                                      Get.back();
                                                    },
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    width: 65)
                                              ],
                                              contents: SizedBox(
                                                width: 500,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Textfildwithupper(
                                                        width: 250,
                                                        controller: cuse,
                                                        Uptext: "Cause".tr,
                                                        hinttext: "Cause".tr)
                                                  ],
                                                ),
                                              ),
                                              apptitle:
                                                  "Enter The Reason For Absence"
                                                      .tr,
                                              subtitle:
                                                  "The reason for the absence of the all students"
                                                      .tr),
                                        ));
                                      } else {
                                        controller.setAllAsHoliday(
                                            value!, null);
                                      }
                                    }
                                  },
                                ),
                                Text("Set All As a Holiday".tr),
                              ],
                            ))),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).cardColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () async {
                            if (controller.isLoading == false) {
                              if (controller.isUploaded == false) {
                                await Addstudentattendenceapi
                                    .Addstudentattendence(
                                        DateTime: controller
                                            .AttendencetDate.value
                                            .toString(),
                                        students: controller.students);
                              }
                            }
                          },
                          icon: Icon(Icons.file_upload_outlined,
                              size: 22,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .color!)),
                    ),
                  ],
                ),
              ),
            );
          }),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: StudentsAttendanceManagmentGrid(),
        )),
      ],
    ));
  }
}
