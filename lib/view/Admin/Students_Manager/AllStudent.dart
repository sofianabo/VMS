import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/GetAllStudentAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Functions/Add_Students_Dialog_Functions.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/view/Admin/Students_Manager/AllStudentGrid.dart';
import 'package:vms_school/widgets/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin_Students/DropDownAllStudents.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';

class AllStudent extends StatefulWidget {
  AllStudent({super.key});

  @override
  State<AllStudent> createState() => _AllStudentState();
}

class _AllStudentState extends State<AllStudent> {
  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Get.find<Allstudentscontroller>().initialData();
    Getallstudentapi.Getallstudent();
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
          GetBuilder<Allstudentscontroller>(builder: (controller) {
            return Container(
              width: Get.width,
              margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                children: [
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      DropDownAllSessions(
                        title: "Session".tr,
                        type: "session",
                        width: 200,
                        API: "AllStudents",
                      ),
                      DropDownAllStudents(
                        isLoading: controller.isGradeLoading,
                        type: "grade",
                        title: "Grade".tr,
                        width: 200,
                      ),
                      DropDownAllStudents(
                        isDisabled: controller.gradeIndex == "" ? true : false,
                        isLoading: controller.isClassLoading,
                        type: "class",
                        title: "Class".tr,
                        width: 200,
                      ),
                      DropDownAllStudents(
                        isLoading: controller.isDivisionLoading,
                        isDisabled: controller.classIndex == "" ? true : false,
                        type: "division",
                        title: "Division".tr,
                        width: 200,
                      ),
                      GetBuilder<Allstudentscontroller>(builder: (controller) {
                        return TextFormSearch(
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
                          suffixIcon: search.text.isNotEmpty
                              ? Icons.close
                              : Icons.search,
                        );
                      }),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8.0,
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
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              if (controller.isLoading == false) {
                                Get.find<Add_Students_Controller>()
                                    .resetError();
                                Add_Students_Dialog_Functions();
                              }
                            },
                            icon: Icon(Icons.add,
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
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              //   exportStudintToExcel(controller.filteredStudents);
                            },
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
                            style: ButtonStyle(
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
            child: GetBuilder<Allstudentscontroller>(builder: (controller) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  children: [
                    DropDownAllSessions(
                      title: "Session".tr,
                      type: "session",
                      width: 200,
                      API: "AllStudents",
                    ),
                    DropDownAllStudents(
                      isLoading: controller.isGradeLoading,
                      type: "grade",
                      title: "Grade".tr,
                      width: 200,
                    ),
                    DropDownAllStudents(
                      isDisabled: controller.gradeIndex == "" ? true : false,
                      isLoading: controller.isClassLoading,
                      type: "class",
                      title: "Class".tr,
                      width: 200,
                    ),
                    DropDownAllStudents(
                      isLoading: controller.isDivisionLoading,
                      isDisabled: controller.classIndex == "" ? true : false,
                      type: "division",
                      title: "Division".tr,
                      width: 200,
                    ),
                    GetBuilder<Allstudentscontroller>(builder: (controller) {
                      return TextFormSearch(
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
                            search.text.isNotEmpty ? Icons.close : Icons.search,
                      );
                    }),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8.0,
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
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                if (controller.isLoading == false) {
                                  Get.find<Add_Students_Controller>()
                                      .resetError();
                                  Add_Students_Dialog_Functions();
                                }
                              },
                              icon: Icon(Icons.add,
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
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                //   exportStudintToExcel(controller.filteredStudents);
                              },
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
                              style: ButtonStyle(
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
          ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: AllStudentGrid(),
        )),
      ],
    ));
  }
}
