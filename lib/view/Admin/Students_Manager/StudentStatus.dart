import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/StudentAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/view/Admin/Students_Manager/StudentStatusGrid.dart';
import 'package:vms_school/widgets/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin_Students/DropDownStudentsAttendence.dart';
import 'package:vms_school/widgets/Calender.dart';
import '../../../Icons_File/v_m_s__icons_icons.dart';
import '../../../widgets/TextFormSearch.dart';

class StudentStatus extends StatefulWidget {
  const StudentStatus({super.key});

  @override
  State<StudentStatus> createState() => _StudentStatusState();
}

class _StudentStatusState extends State<StudentStatus> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();

    Get.find<StudentAttendencController>().AttendencetDate.value =
        DateTime.now();
    Studentattendenceapi(context).Studentattendence();
    Getallgradeapi.Getallgrade();
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
            child:
                GetBuilder<StudentAttendencController>(builder: (controller) {
              return Wrap(
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 10.0,
                spacing: 10.0,
                children: [
                  DropDownAllSessions(
                      API: "StudentState",
                      title: "session".tr,
                      width: 200,
                      type: "session"),
                  DropDownStudentsAttendens(
                    isLoading: controller.isGradeLoading,
                    type: "grade",
                    title: "Grade".tr,
                    width: 200,
                  ),
                  DropDownStudentsAttendens(
                    isDisabled: controller.gradeIndex == "" ? true : false,
                    isLoading: controller.isClassLoading,
                    type: "class",
                    title: "Class".tr,
                    width: 200,
                  ),
                  DropDownStudentsAttendens(
                    isLoading: controller.isDivisionLoading,
                    isDisabled: controller.classIndex == "" ? true : false,
                    type: "division",
                    title: "Division".tr,
                    width: 200,
                  ),
                  selectStudentsDateAttendence(
                    width: 200,
                  ),
                  GetBuilder<StudentAttendencController>(builder: (controller) {
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
                            color: Colors.white,
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
                                color: Theme.of(context).primaryColor)),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                                color: Theme.of(context).primaryColor)),
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
            child:
                GetBuilder<StudentAttendencController>(builder: (controller) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10.0,
                  children: [
                    DropDownAllSessions(
                        API: "StudentState",
                        title: "session".tr,
                        width: 200,
                        type: "session"),
                    DropDownStudentsAttendens(
                      isLoading: controller.isGradeLoading,
                      type: "grade",
                      title: "Grade".tr,
                      width: 200,
                    ),
                    DropDownStudentsAttendens(
                      isDisabled: controller.gradeIndex == "" ? true : false,
                      isLoading: controller.isClassLoading,
                      type: "class",
                      title: "Class".tr,
                      width: 200,
                    ),
                    DropDownStudentsAttendens(
                      isLoading: controller.isDivisionLoading,
                      isDisabled: controller.classIndex == "" ? true : false,
                      type: "division",
                      title: "Division".tr,
                      width: 200,
                    ),
                    selectStudentsDateAttendence(
                      width: 200,
                    ),
                    GetBuilder<StudentAttendencController>(
                        builder: (controller) {
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
                              color: Colors.white,
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
                                  color: Theme.of(context).primaryColor)),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
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
                                  color: Theme.of(context).primaryColor)),
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
          child: StudentStatusGrid(),
        )),
      ],
    ));
  }
}
