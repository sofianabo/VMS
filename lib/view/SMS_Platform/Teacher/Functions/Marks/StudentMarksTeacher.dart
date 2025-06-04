import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Teacher_API/AddStudentMarks_TeacherAPI.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/StudentMarks_TeacherController.dart';
import 'package:vms_school/view/SMS_Platform/Teacher/Functions/Marks/AddMarksForAll_Teacher.dart';
import 'package:vms_school/view/SMS_Platform/Teacher/Functions/Marks/StudentMarksTeacherGrid.dart';
import 'package:vms_school/view/Both_Platform/widgets/Teacher/DropDownTeacherMarks.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Studentmarksteacher extends StatefulWidget {
  const Studentmarksteacher({super.key});

  @override
  State<Studentmarksteacher> createState() => _StudentmarksteacherState();
}

class _StudentmarksteacherState extends State<Studentmarksteacher> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    Get.find<StudentmarksTeachercontroller>().setclassindex();
    Get.find<StudentmarksTeachercontroller>().resetinClass();
    Get.find<StudentmarksTeachercontroller>().resetindivision();
    Get.find<StudentmarksTeachercontroller>().resetinSemester();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return VMSAlertDialog(
      action: [],
      apptitle: "Marks".tr,
      subtitle: "",
      contents: Column(
        children: [
          if (w > 769)
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: GetBuilder<StudentmarksTeachercontroller>(
                  builder: (controller) {
                bool validate = controller.CurriculumIndex.isEmpty ||
                    controller.studentsMarksModel?.quizType == null ||
                    controller.studentsMarksModel!.quizType!.isEmpty;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.start,
                      children: [
                        Dropdownteachermarks(
                          isLoading: controller.isClassLoading,
                          title: "Class".tr,
                          width: 200,
                          type: "Class",
                        ),
                        Dropdownteachermarks(
                            isLoading: controller.isDivisionLoading,
                            isDisabled:
                                controller.ClassIndex == "" ? true : false,
                            title: "Division".tr,
                            width: 200,
                            type: "Division"),
                        Dropdownteachermarks(
                          isLoading: false,
                          isDisabled:
                              controller.DivisionIndex == "" ? true : false,
                          title: "Semester".tr,
                          width: 200,
                          type: "Semester",
                        ),
                        Dropdownteachermarks(
                            isDisabled: controller.DivisionIndex == "",
                            isLoading: controller.isCurriculumLoading,
                            title: "Curriculum".tr,
                            width: 200,
                            type: "Curriculum"),
                        TextFormSearch(
                          click: () {
                            controller.clearFilter();
                          },
                          onchange: (value) {
                            controller.searchByName(value);
                          },
                          width: 200,
                          radius: 5,
                          controller: search,
                          suffixIcon: search.text.isNotEmpty
                              ? Icons.close
                              : Icons.search,
                        ),
                      ],
                    ),
                    if (controller.filterdstudent?.isNotEmpty ?? false)
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
                                        shape: const WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))))),
                                    onPressed: () {
                                      if (!validate) {
                                        showAddMarkForAllDialog_Teacher();
                                      }
                                    },
                                    icon: Icon(Icons.add_road_outlined,
                                        size: 18,
                                        color: validate
                                            ? Colors.white
                                            : Theme.of(context).textTheme.titleMedium!.color!))),
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
                                        shape: const WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
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
                                        AddstudentmarksTeacherapi()
                                            .saveAllStudents(
                                          curriculumId: controller
                                              .CurriculumModel!
                                              .curriculum![
                                                  controller.Curriculumlist
                                                      .indexOf(controller
                                                          .CurriculumIndex)]
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
                                            : Theme.of(context).textTheme.titleMedium!.color!))),
                          ],
                        ),
                      )
                  ],
                );
              }),
            ),
          if (w <= 769)
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: GetBuilder<StudentmarksTeachercontroller>(
                  builder: (controller) {
                bool validate = controller.CurriculumIndex.isEmpty ||
                    controller.studentsMarksModel?.quizType == null ||
                    controller.studentsMarksModel!.quizType!.isEmpty;
                return Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 8.0,
                        children: [
                          Dropdownteachermarks(
                            isLoading: controller.isClassLoading,
                            title: "Class".tr,
                            width: 200,
                            type: "Class",
                          ),
                          Dropdownteachermarks(
                              isLoading: controller.isDivisionLoading,
                              isDisabled:
                                  controller.ClassIndex == "" ? true : false,
                              title: "Division".tr,
                              width: 200,
                              type: "Division"),
                          Dropdownteachermarks(
                            isLoading: false,
                            isDisabled:
                                controller.DivisionIndex == "" ? true : false,
                            title: "Semester".tr,
                            width: 200,
                            type: "Semester",
                          ),
                          Dropdownteachermarks(
                              isDisabled: controller.DivisionIndex == "",
                              isLoading: controller.isCurriculumLoading,
                              title: "Curriculum".tr,
                              width: 200,
                              type: "Curriculum"),
                          TextFormSearch(
                            click: () {
                              controller.clearFilter();
                            },
                            onchange: (value) {
                              controller.searchByName(value);
                            },
                            width: 200,
                            radius: 5,
                            controller: search,
                            suffixIcon: search.text.isNotEmpty
                                ? Icons.close
                                : Icons.search,
                          ),
                        ],
                      ),
                    ),
                    if (controller.filterdstudent?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          spacing: 5.0,
                          children: [
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
                                        shape: const WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))))),
                                    onPressed: () {
                                      if (!validate) {
                                        showAddMarkForAllDialog_Teacher();
                                      }
                                    },
                                    icon: Icon(Icons.add_road_outlined,
                                        size: 18,
                                        color: validate
                                            ? Colors.white
                                            : Theme.of(context).textTheme.titleMedium!.color!))),
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
                                        shape: const WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
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
                                        AddstudentmarksTeacherapi()
                                            .saveAllStudents(
                                          curriculumId: controller
                                              .CurriculumModel!
                                              .curriculum![
                                                  controller.Curriculumlist
                                                      .indexOf(controller
                                                          .CurriculumIndex)]
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
                                            : Theme.of(context).textTheme.titleMedium!.color!))),
                          ],
                        ),
                      )
                  ],
                );
              }),
            ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Studentmarksteachergrid(),
          )),
        ],
      ),
    );
  }
}
