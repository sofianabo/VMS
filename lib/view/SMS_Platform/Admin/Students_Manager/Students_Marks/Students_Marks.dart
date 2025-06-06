import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/add_Students_Marks_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Students_Marks_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Students_Marks/Add_Marks_For_All.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Students_Marks/Students_Marks_Grid.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_Students/DropdownStudentsMark.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';

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
        if (w > 769)
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            child: GetBuilder<Students_Marks_Controller>(builder: (controller) {
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
                      DropdownStudentsMark(
                        isLoading: controller.isClassLoading,
                        title: "Class".tr,
                        width: 200,
                        type: "Class",
                      ),
                      DropdownStudentsMark(
                          isLoading: controller.isDivisionLoading,
                          isDisabled:
                              controller.ClassIndex == "" ? true : false,
                          title: "Division".tr,
                          width: 200,
                          type: "Division"),
                      DropdownStudentsMark(
                        isLoading: false,
                        isDisabled:
                            controller.DivisionIndex == "" ? true : false,
                        title: "Semester".tr,
                        width: 200,
                        type: "Semester",
                      ),
                      DropdownStudentsMark(
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
                        suffixIcon:
                            search.text.isNotEmpty ? Icons.close : Icons.search,
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
                                    backgroundColor: WidgetStatePropertyAll(
                                        validate
                                            ? Get.theme.disabledColor
                                            : Theme.of(context).cardColor),
                                    shape: const WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
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
                                    backgroundColor: WidgetStatePropertyAll(
                                        validate
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
                                    AddStudentsMarksApi().saveAllStudents(
                                      curriculumId: controller
                                          .CurriculumModel!
                                          .curriculum![
                                              controller.Curriculumlist.indexOf(
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
                                        : Theme.of(context).textTheme.titleMedium!.color!))),
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
                                exportQuizResultToPdf(
                                    fileName: "Students Marks".tr +
                                        "_${controller.ClassIndex}_${controller.DivisionIndex}_${controller.CurriculumIndex}_${controller.SemesterIndex.tr}",
                                    Curr: "Students Marks in".tr +
                                        "  ( ${controller.CurriculumIndex} )",
                                    students:
                                        controller.studentsMarksModel!.student!,
                                    quizTypes: controller
                                        .studentsMarksModel!.quizType!);
                              },
                              icon: Icon(VMS_Icons.pdf,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color!)),
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
                                exportStudentMarksToExcel(
                                    fileName: "Students Marks".tr +
                                        "_${controller.ClassIndex}_${controller.DivisionIndex}_${controller.CurriculumIndex}_${controller.SemesterIndex.tr}",
                                    students:
                                        controller.studentsMarksModel!.student!,
                                    quizTypes: controller
                                        .studentsMarksModel!.quizType!);
                              },
                              icon: Icon(VMS_Icons.xl,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color!)),
                        ),
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
            child: GetBuilder<Students_Marks_Controller>(builder: (controller) {
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
                        DropdownStudentsMark(
                          isLoading: controller.isClassLoading,
                          title: "Class".tr,
                          width: 200,
                          type: "Class",
                        ),
                        DropdownStudentsMark(
                            isLoading: controller.isDivisionLoading,
                            isDisabled:
                                controller.ClassIndex == "" ? true : false,
                            title: "Division".tr,
                            width: 200,
                            type: "Division"),
                        DropdownStudentsMark(
                          isLoading: false,
                          isDisabled:
                              controller.DivisionIndex == "" ? true : false,
                          title: "Semester".tr,
                          width: 200,
                          type: "Semester",
                        ),
                        DropdownStudentsMark(
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
                                    backgroundColor: WidgetStatePropertyAll(
                                        validate
                                            ? Get.theme.disabledColor
                                            : Theme.of(context).cardColor),
                                    shape: const WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
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
                                    backgroundColor: WidgetStatePropertyAll(
                                        validate
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
                                    AddStudentsMarksApi().saveAllStudents(
                                      curriculumId: controller
                                          .CurriculumModel!
                                          .curriculum![
                                              controller.Curriculumlist.indexOf(
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
                                        : Theme.of(context).textTheme.titleMedium!.color!))),
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
                                exportQuizResultToPdf(
                                    fileName: "Students Marks".tr +
                                        "_${controller.ClassIndex}_${controller.DivisionIndex}_${controller.CurriculumIndex}_${controller.SemesterIndex.tr}",
                                    Curr: "Students Marks in".tr +
                                        "  ( ${controller.CurriculumIndex} )",
                                    students:
                                        controller.studentsMarksModel!.student!,
                                    quizTypes: controller
                                        .studentsMarksModel!.quizType!);
                              },
                              icon: Icon(VMS_Icons.pdf,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color!)),
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
                                exportStudentMarksToExcel(
                                    fileName: "Students Marks".tr +
                                        "_${controller.ClassIndex}_${controller.DivisionIndex}_${controller.CurriculumIndex}_${controller.SemesterIndex.tr}",
                                    students:
                                        controller.studentsMarksModel!.student!,
                                    quizTypes: controller
                                        .studentsMarksModel!.quizType!);
                              },
                              icon: Icon(VMS_Icons.xl,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color!)),
                        ),
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
          child: Students_Marks_Gen(),
        )),
      ],
    ));
  }
}
