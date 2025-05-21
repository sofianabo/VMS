import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Subjects_API/Get_Subjects_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetTeacherAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeacherAtendenceController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Link/Model/AdminModel/TeacherModels/AllTeacherAttendenceModel.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/TeacherStatusGrid.dart';
import 'package:vms_school/widgets/Admin/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin/Admin_Teachers/DropDownTeacherStatus.dart';
import 'package:vms_school/widgets/Calender.dart';
import '../../../Icons_File/v_m_s__icons_icons.dart';
import '../../../widgets/TextFormSearch.dart';

class TeacherStatus extends StatefulWidget {
  const TeacherStatus({super.key});

  @override
  State<TeacherStatus> createState() => _TeacherStatusState();
}

class _TeacherStatusState extends State<TeacherStatus> {
  TextEditingController serch = TextEditingController();

  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Getteacherattendenceapi().Getteacherattendence();
    Getallclassapi.getAllClasses();
    Get_Subject_Screen_API(context).Get_Subject_Screen();
    Get.find<Allteacheratendencecontroller>().setdefualtDropdown();
    Get.find<Allteacheratendencecontroller>().AttendencetDate.value =
        DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = Get.width;
    return Expanded(
        child: Column(
      children: [
        if (w > 769)
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            child: GetBuilder<Allteacheratendencecontroller>(
                builder: (controller) {
              return Wrap(
                alignment: WrapAlignment.spaceBetween,
                runAlignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 10.0,
                spacing: 10.0,
                children: [
                  DropDownAllSessions(
                    title: "Session".tr,
                    width: 220,
                    type: "session",
                    API: "Teachersts",
                  ),
                  DropDownTeacherStatus(
                    isLoading: controller.isClassLoading,
                    width: 220,
                    title: "Class".tr,
                    type: 'Class',
                  ),
                  DropDownTeacherStatus(
                    isLoading: controller.isSubjectLoading,
                    width: 220,
                    title: "Subject".tr,
                    type: 'Subject',
                  ),
                  DropDownTeacherStatus(
                    isLoading: false,
                    width: 220,
                    title: "Type".tr,
                    type: 'Type',
                  ),
                  selectTeacherDateAttendence(
                    width: 220,
                  ),
                  TextFormSearch(
                    click: () {
                      controller.clearFilter();
                    },
                    onchange: (value) {
                      controller.searchRequestByName(
                          value,
                          controller.classIndex,
                          controller.SubjectIndex,
                          controller.TypeIndex);
                    },
                    width: 220,
                    radius: 5,
                    controller: serch,
                    suffixIcon: serch.text != "" ? Icons.clear : Icons.search,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10.0,
                    children: [
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
                            style: const ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              exportDataToPdf<Teacherattendance>(
                                items: controller.filteredTeacher!,
                                headers: [
                                  "Full Name".tr,
                                  "State".tr,
                                ],
                                fieldMappings: {
                                  "Full Name".tr: (reg) => reg.fullName ?? "",
                                  "State".tr: (reg) => reg.status!.tr ?? "",
                                },
                                fileName: "Teacher Attendance".tr +
                                    '${DateTime.now().toIso8601String()}',
                              );
                            },
                            icon: Icon(VMS_Icons.pdf,
                                size: 18,
                                color: Theme.of(context).highlightColor)),
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
                            style: const ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              exportDataToExcel<Teacherattendance>(
                                items: controller.filteredTeacher!,
                                headers: [
                                  "Full Name".tr,
                                  "State".tr,
                                ],
                                fieldMappings: {
                                  "Full Name".tr: (reg) => reg.fullName ?? "",
                                  "State".tr: (reg) => reg.status!.tr ?? "",
                                },
                                fileName: "Teacher Attendance".tr +
                                    '${DateTime.now().toIso8601String()}',
                              );
                            },
                            icon: Icon(VMS_Icons.xl,
                                size: 18,
                                color: Theme.of(context).highlightColor)),
                      ),
                    ],
                  )
                ],
              );
            }),
          ),
        if (w <= 769)
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            child: GetBuilder<Allteacheratendencecontroller>(
                builder: (controller) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10.0,
                  children: [
                    DropDownAllSessions(
                      title: "Session".tr,
                      width: 220,
                      type: "session",
                      API: "Teachersts",
                    ),
                    DropDownTeacherStatus(
                      isLoading: controller.isClassLoading,
                      width: 220,
                      title: "Class".tr,
                      type: 'Class',
                    ),
                    DropDownTeacherStatus(
                      isLoading: controller.isSubjectLoading,
                      width: 220,
                      title: "Subject".tr,
                      type: 'Subject',
                    ),
                    DropDownTeacherStatus(
                      isLoading: false,
                      width: 220,
                      title: "Type".tr,
                      type: 'Type',
                    ),
                    selectTeacherDateAttendence(
                      width: 220,
                    ),
                    TextFormSearch(
                      click: () {
                        controller.clearFilter();
                      },
                      onchange: (value) {
                        controller.searchRequestByName(
                            value,
                            controller.classIndex,
                            controller.SubjectIndex,
                            controller.TypeIndex);
                      },
                      width: 220,
                      radius: 5,
                      controller: serch,
                      suffixIcon: serch.text != "" ? Icons.clear : Icons.search,
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
                          style: const ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {
                            exportDataToPdf<Teacherattendance>(
                              items: controller.filteredTeacher!,
                              headers: [
                                "Full Name".tr,
                                "State".tr,
                              ],
                              fieldMappings: {
                                "Full Name".tr: (reg) => reg.fullName ?? "",
                                "State".tr: (reg) => reg.status!.tr ?? "",
                              },
                              fileName: "Teacher Attendance".tr +
                                  '${DateTime.now().toIso8601String()}',
                            );
                          },
                          icon: Icon(VMS_Icons.pdf,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
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
                          style: const ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {
                            exportDataToExcel<Teacherattendance>(
                              items: controller.filteredTeacher!,
                              headers: [
                                "Full Name".tr,
                                "State".tr,
                              ],
                              fieldMappings: {
                                "Full Name".tr: (reg) => reg.fullName ?? "",
                                "State".tr: (reg) => reg.status!.tr ?? "",
                              },
                              fileName: "Teacher Attendance".tr +
                                  '${DateTime.now().toIso8601String()}',
                            );
                          },
                          icon: Icon(VMS_Icons.xl,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
                    )
                  ],
                ),
              );
            }),
          ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: TeacherStatusGrid(),
        )),
      ],
    ));
  }
}
