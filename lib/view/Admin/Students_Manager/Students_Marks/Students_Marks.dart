import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Quiz_Type/Get_Quiz_Type.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Guardian_APIS/AddGuardianAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Guardian_APIS/GetAllGuardiansAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Quiz_Marks.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/add_Students_Marks_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Students_Marks_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/allGaurdianController.dart';
import 'package:vms_school/view/Admin/Students_Manager/AllGuardianGrid.dart';
import 'package:vms_school/view/Admin/Students_Manager/Students_Marks/Add_Marks_For_All.dart';
import 'package:vms_school/view/Admin/Students_Manager/Students_Marks/Students_Marks_Grid.dart';
import 'package:vms_school/widgets/Admin_Employee/Export_Data.dart';
import 'package:vms_school/widgets/Admin_Students/DropdownStudentsMark.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Students_Marks extends StatefulWidget {
  const Students_Marks({super.key});

  @override
  State<Students_Marks> createState() => _AllGuardiansState();
}

class _AllGuardiansState extends State<Students_Marks> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    Getallclassapi.getAllClasses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<Students_Marks_Controller>(builder: (controller) {
                bool validate = controller.CurriculumIndex.isEmpty ||
                    controller.studentsMarksModel?.quizType == null ||
                    controller.studentsMarksModel!.quizType!.isEmpty;
                return Column(
                  children: [
                    Row(
                      spacing: 8.0,
                      children: [
                        DropdownStudentsMark(
                          isLoading: controller.isClassLoading,
                          title: "Class".tr,
                          width: w / 6.5,
                          type: "Class",
                        ),
                        DropdownStudentsMark(
                            isLoading: controller.isDivisionLoading,
                            isDisabled:
                                controller.ClassIndex == "" ? true : false,
                            title: "Division".tr,
                            width: w / 6.5,
                            type: "Division"),
                        DropdownStudentsMark(
                          isLoading: false,
                          isDisabled:
                              controller.DivisionIndex == "" ? true : false,
                          title: "Semester".tr,
                          width: w / 6.5,
                          type: "Semester",
                        ),
                        DropdownStudentsMark(
                            isDisabled: controller.DivisionIndex == "",
                            isLoading: controller.isCurriculumLoading,
                            title: "Curriculum".tr,
                            width: w / 6.5,
                            type: "Curriculum"),
                        TextFormSearch(
                          click: () {
                            controller.clearFilter();
                          },
                          onchange: (value) {
                            controller.searchByName(value);
                          },
                          width: w / 6.5,
                          radius: 5,
                          controller: search,
                          suffixIcon: search.text.isNotEmpty
                              ? Icons.close
                              : Icons.search,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        spacing: 5.0,
                        children: [
                          const Spacer(),
                          Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: validate
                                      ? Get.theme.disabledColor
                                      : Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 2),
                                        blurRadius: 1)
                                  ]),
                              child: IconButton(
                                  splashColor: validate
                                      ? Get.theme.disabledColor
                                      : Theme.of(context).cardColor,
                                  style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(validate
                                          ? Get.theme.disabledColor
                                          : Theme.of(context).cardColor),
                                      shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                                  onPressed: () {
                                    if (!validate) {
                                      showAddMarkForAllDialog();
                                    }
                                  },
                                  icon: Icon(Icons.add_road_outlined,
                                      size: 18,
                                      color: validate
                                          ? Colors.white
                                          : Theme.of(context).highlightColor))),
                          Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: validate
                                      ? Get.theme.disabledColor
                                      : Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 2),
                                        blurRadius: 1)
                                  ]),
                              child: IconButton(
                                  splashColor: validate
                                      ? Get.theme.disabledColor
                                      : Theme.of(context).cardColor,
                                  style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(validate
                                          ? Get.theme.disabledColor
                                          : Theme.of(context).cardColor),
                                      shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                                  onPressed: () {
                                    if (!validate) {
                                      for (var student in controller
                                          .studentsMarksModel!.student!) {
                                        if (student.mark == null ||
                                            student.mark!
                                                .any((m) => m.mark == null)) {
                                          break;
                                        }
                                      }
                                      AddStudentsMarksApi().saveAllStudents(
                                        curriculumId: controller
                                            .CurriculumModel!
                                            .curriculum![controller
                                                    .Curriculumlist
                                                .indexOf(
                                                    controller.CurriculumIndex)]
                                            .id!,
                                        students: controller
                                            .studentsMarksModel!.student!,
                                      );
                                    }
                                  },
                                  icon: Icon(Icons.save_outlined,
                                      size: 18,
                                      color: validate
                                          ? Colors.white
                                          : Theme.of(context).highlightColor))),
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
                        ],
                      ),
                    )
                  ],
                );
              }),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Students_Marks_Gen(),
        )),
      ],
    ));
  }
}
