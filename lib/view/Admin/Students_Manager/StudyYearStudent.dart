import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/DropDownPenaltyAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/GetStudyYearStudentAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/view/Admin/Students_Manager/StudyYearStudentsGrid.dart';
import 'package:vms_school/widgets/Admin/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin/Admin_Students/DropDownStudyYearStudents.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';

class StudyYearStudents extends StatefulWidget {
  const StudyYearStudents({super.key});

  @override
  State<StudyYearStudents> createState() => _StudyYearStudentsState();
}

class _StudyYearStudentsState extends State<StudyYearStudents> {
  @override
  initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Get.find<StudyYearStudentsController>().initialData();
    Study_Year_Students_API(context).Study_Year_Students();
    Get_All_Benality_API(context).Get_All_Benality();
    super.initState();
  }

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        if (screenWidth > 769)
          GetBuilder<StudyYearStudentsController>(builder: (controller) {
            return Container(
              width: Get.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      DropDownAllSessions(
                        API: "SYStudent",
                        title: "Session".tr,
                        type: "session",
                        width: 200,
                      ),
                      DropDownStudyYearStudents(
                        isLoading: controller.isGradeLoading,
                        type: "grade",
                        title: "Grade".tr,
                        width: 200,
                      ),
                      DropDownStudyYearStudents(
                        isDisabled: controller.gradeIndex == "" ? true : false,
                        isLoading: controller.isClassLoading,
                        type: "class",
                        title: "Class".tr,
                        width: 200,
                      ),
                      DropDownStudyYearStudents(
                        isLoading: controller.isDivisionLoading,
                        isDisabled: controller.classIndex == "" ? true : false,
                        type: "division",
                        title: "Division".tr,
                        width: 200,
                      ),
                      TextFormSearch(
                        click: () {
                          controller.clearFilter();
                        },
                        onchange: (value) {
                          controller.searchByName(value, controller.gradeIndex,
                              controller.classIndex, controller.divisionIndex);
                        },
                        width: 200,
                        radius: 5,
                        controller: search,
                        suffixIcon:
                            search.text != "" ? Icons.clear : Icons.search,
                      ),
                    ],
                  ),
                  Spacer(),
                  if (Get.find<Add_Data_controller>().roll != "observer")
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
                              onPressed: () {},
                              icon: Icon(VMS_Icons.xl,
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
                              onPressed: () {},
                              icon: Icon(VMS_Icons.pdf,
                                  size: 18,
                                  color: Theme.of(context).highlightColor)),
                        ),
                      ],
                    )
                ],
              ),
            );
          }),
        if (screenWidth <= 769)
          Padding(
            padding:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 15),
            child:
                GetBuilder<StudyYearStudentsController>(builder: (controller) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  children: [
                    Row(
                      spacing: 8.0,
                      children: [
                        DropDownAllSessions(
                          API: "SYStudent",
                          title: "Session".tr,
                          type: "session",
                          width: 200,
                        ),
                        DropDownStudyYearStudents(
                          isLoading: controller.isGradeLoading,
                          type: "grade",
                          title: "Grade".tr,
                          width: 200,
                        ),
                        DropDownStudyYearStudents(
                          isDisabled:
                              controller.gradeIndex == "" ? true : false,
                          isLoading: controller.isClassLoading,
                          type: "class",
                          title: "Class".tr,
                          width: 200,
                        ),
                        DropDownStudyYearStudents(
                          isLoading: controller.isDivisionLoading,
                          isDisabled:
                              controller.classIndex == "" ? true : false,
                          type: "division",
                          title: "Division".tr,
                          width: 200,
                        ),
                        TextFormSearch(
                          click: () {
                            controller.clearFilter();
                          },
                          onchange: (value) {
                            controller.searchByName(
                                value,
                                controller.gradeIndex,
                                controller.classIndex,
                                controller.divisionIndex);
                          },
                          width: 200,
                          radius: 5,
                          controller: search,
                          suffixIcon:
                              search.text != "" ? Icons.clear : Icons.search,
                        ),
                        if (Get.find<Add_Data_controller>().roll != "observer")
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
                                    onPressed: () {},
                                    icon: Icon(VMS_Icons.xl,
                                        size: 18,
                                        color:
                                            Theme.of(context).highlightColor)),
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
                                    onPressed: () {},
                                    icon: Icon(VMS_Icons.pdf,
                                        size: 18,
                                        color:
                                            Theme.of(context).highlightColor)),
                              ),
                            ],
                          )
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: StudyYearStudentGrid(),
        )),
      ],
    ));
  }
}
