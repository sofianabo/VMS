import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/SchoolTimeTableAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/AddLessonAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownExamCuriculmAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllTeacherModel.dart';
import 'package:vms_school/Link/Model/AdminModel/SchoolTimeModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/widgets/Admin_Table/DropDownSchoolTime.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class SchoolTimeTable extends StatefulWidget {
  const SchoolTimeTable({super.key});

  @override
  State<SchoolTimeTable> createState() => _SchoolTimeTableState();
}

class _SchoolTimeTableState extends State<SchoolTimeTable> {
  TextEditingController period = TextEditingController();
  Map<String, int> days = {
    "Sunday": 0,
    "Monday": 1,
    "Tuesday": 2,
    "Wednesday": 3,
    "Thursday": 4
  };
  Map<int, String> lessions = {
    1: 'First\n Lesson',
    2: 'second\n Lesson',
    3: 'Third\n Lesson',
    4: 'Forth\n Lesson',
    5: 'Fifth\n Lesson',
    6: 'Sixth\n Lesson',
    7: 'Seventh\n Lesson',
  };
  List<Map<String, String>> tableData = [
    {
      'Day': 'Sunday',
      'First\n Lesson': 'No Lesson',
      'second\n Lesson': 'No Lesson ',
      'Third\n Lesson': 'No Lesson  ',
      'Forth\n Lesson': 'No Lesson   ',
      'Fifth\n Lesson': 'No Lesson    ',
      'Sixth\n Lesson': 'No Lesson     ',
      'Seventh\n Lesson': 'No Lesson    ',
    },
    {
      'Day': 'Monday',
      'First\n Lesson': 'No Lesson',
      'second\n Lesson': 'No Lesson ',
      'Third\n Lesson': 'No Lesson  ',
      'Forth\n Lesson': 'No Lesson   ',
      'Fifth\n Lesson': 'No Lesson    ',
      'Sixth\n Lesson': 'No Lesson     ',
      'Seventh\n Lesson': 'No Lesson    ',
    },
    {
      'Day': 'Tuesday',
      'First\n Lesson': 'No Lesson',
      'second\n Lesson': 'No Lesson ',
      'Third\n Lesson': 'No Lesson  ',
      'Forth\n Lesson': 'No Lesson   ',
      'Fifth\n Lesson': 'No Lesson    ',
      'Sixth\n Lesson': 'No Lesson     ',
      'Seventh\n Lesson': 'No Lesson    ',
    },
    {
      'Day': 'Wednesday',
      'First\n Lesson': 'No Lesson',
      'second\n Lesson': 'No Lesson ',
      'Third\n Lesson': 'No Lesson  ',
      'Forth\n Lesson': 'No Lesson   ',
      'Fifth\n Lesson': 'No Lesson    ',
      'Sixth\n Lesson': 'No Lesson     ',
      'Seventh\n Lesson': 'No Lesson    ',
    },
    {
      'Day': 'Thursday',
      'First\n Lesson': 'No Lesson',
      'second\n Lesson': 'No Lesson ',
      'Third\n Lesson': 'No Lesson  ',
      'Forth\n Lesson': 'No Lesson   ',
      'Fifth\n Lesson': 'No Lesson    ',
      'Sixth\n Lesson': 'No Lesson     ',
      'Seventh\n Lesson': 'No Lesson    ',
    },
  ];
  SchoolTimeModel? m;
  void getSchoolTable() async {
    SchoolTimeModel model =
        await Schooltimetableapi(context).Schooltimetable(null);
    m = model;
    for (int i = 0; i < model.studyShare!.length; i++) {
      tableData[days[model.studyShare![i].day]!]
              [lessions[model.studyShare![i].lessonId]!] =
          model.studyShare![i].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    getSchoolTable();

    return GetBuilder<AdminSchoolTimeController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(top: 38.0, right: 25.0, left: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width * 0.9,
              child: Row(
                children: [
                  DropDownSchoolTime(
                    type: "class",
                    title: "Class",
                    width: Get.width / 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: DropDownSchoolTime(
                      type: "division",
                      title: "Division",
                      width: Get.width / 4,
                    ),
                  ),
                  const Spacer(),
                  Row(
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
                            icon: Icon(VMS_Icons.xl,
                                size: 18, color: Get.theme.primaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                        child: Container(
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
                                  size: 18, color: Get.theme.primaryColor)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            controller.isLoading
                ? HoverScaleCard(
                    child: Container(
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, 2),
                            blurRadius: 1)
                      ]),
                      child: DataTable(
                        headingRowColor:
                            const WidgetStatePropertyAll(Colors.white),
                        border: TableBorder.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        columns: const [
                          DataColumn(
                            label: Text(
                              "",
                            ),
                          ),
                          DataColumn(label: Text('')),
                          DataColumn(label: Text('')),
                          DataColumn(label: Text('')),
                          DataColumn(label: Text('')),
                          DataColumn(label: Text('')),
                          DataColumn(
                            label: Text(''),
                          ),
                          DataColumn(
                            label: Text(''),
                          ),
                        ],
                        rows: List.generate(
                          5, // عدد الصفوف في واجهة الانتظار
                          (index) => const DataRow(
                            cells: [
                              DataCell(Text('')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                    .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(
                        angle: 1,
                        color: Colors.white,
                        duration: const Duration(milliseconds: 600),
                        delay: const Duration(milliseconds: 200))
                : Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: Get.width * 0.9,
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Table(
                              border: TableBorder.all(
                                  color: Get.theme.primaryColor),
                              children: [
                                TableRow(
                                  children: [
                                    Container(
                                      height: 50,
                                      alignment: Alignment.center,
                                      color: const Color(0xffD4DFE5),
                                      child: Center(
                                        child: Text(
                                          'Day',
                                          style: Get.theme.textTheme.titleLarge!
                                              .copyWith(
                                            color: Get.theme.primaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ...tableData[0]
                                        .keys
                                        .where((key) => key != 'Day')
                                        .map((key) => Container(
                                              height: 50,
                                              alignment: Alignment.center,
                                              color: const Color(0xffD4DFE5),
                                              child: Center(
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  key,
                                                  style: Get.theme.textTheme
                                                      .titleLarge!
                                                      .copyWith(
                                                    fontSize: 14,
                                                    color:
                                                        Get.theme.primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            )),
                                  ],
                                ),
                                for (var row in tableData)
                                  TableRow(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 70,
                                        color: const Color(0xffD4DFE5),
                                        child: Center(
                                          child: Text(row['Day'] ?? '',
                                              style: Get
                                                  .theme.textTheme.titleLarge!
                                                  .copyWith(
                                                fontSize: 14,
                                                color: Get.theme.primaryColor,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                      ),
                                      ...row.entries
                                          .where((entry) => entry.key != 'Day')
                                          .map((entry) => GestureDetector(
                                                onTap: () async {
                                                  if (m!.studyShare!.isEmpty) {
                                                  } else {
                                                    CancelToken cancelToken =
                                                        CancelToken();
                                                    Loading_Dialog(
                                                        cancelToken:
                                                            cancelToken);
                                                    AllClassModel model =
                                                        await Getallclassapi
                                                            .getAllClasses();
                                                    controller
                                                        .setAllClassesDialog(
                                                            model);
                                                    AllTeacherModel teacher =
                                                        await Getallteachersapi
                                                            .Getallteachers();
                                                    controller
                                                        .setAllTeacherDialog(
                                                            teacher);

                                                    Get.back();

                                                    Get.dialog(VMSAlertDialog(
                                                        action: [
                                                          ButtonDialog(
                                                              text: "Add",
                                                              onPressed:
                                                                  () async {
                                                                // افترض أن لديك row وهو Map
                                                                final entryIndex = row
                                                                    .entries
                                                                    .toList() // تحويل الكائنات إلى قائمة
                                                                    .indexWhere((e) =>
                                                                        e.value ==
                                                                        entry
                                                                            .value); // البحث عن الفهرس
                                                                print(
                                                                    entryIndex);

                                                                await Addlessonapi(
                                                                        context)
                                                                    .Addlesson(
                                                                        controller
                                                                            .subjectDialogList
                                                                            .indexOf(controller
                                                                                .selectedSubjectDialog),
                                                                        controller
                                                                            .divisionDialogList
                                                                            .indexOf(controller
                                                                                .selectedDivisionDialog),
                                                                        period
                                                                            .text,
                                                                        controller
                                                                            .teacherDialogList
                                                                            .indexOf(controller
                                                                                .selectedTeacherDialog),
                                                                        //edit
                                                                        entryIndex,
                                                                        row['Day']
                                                                            .toString());
                                                                //edit entry
                                                              },
                                                              color: Get.theme
                                                                  .primaryColor,
                                                              width: 120),
                                                          ButtonDialog(
                                                              text: "Edit",
                                                              onPressed: () {},
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      2,
                                                                      124,
                                                                      49),
                                                              width: 120),
                                                          ButtonDialog(
                                                              text: "Delete",
                                                              onPressed: () {},
                                                              color: Color(
                                                                  0xffB03D3D),
                                                              width: 120),
                                                        ],
                                                        contents: Container(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            15.0),
                                                                child: Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              15.0),
                                                                      child: DropDownSchoolTime(
                                                                          title:
                                                                              "Class",
                                                                          width:
                                                                              220,
                                                                          type:
                                                                              "classDialog"),
                                                                    ),
                                                                    DropDownSchoolTime(
                                                                        title:
                                                                            "Division",
                                                                        width:
                                                                            220,
                                                                        type:
                                                                            "divisionDialog"),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            15.0),
                                                                child: Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              15.0),
                                                                      child: DropDownSchoolTime(
                                                                          title:
                                                                              "Curriculm",
                                                                          width:
                                                                              220,
                                                                          type:
                                                                              "subjectDialog"),
                                                                    ),
                                                                    DropDownSchoolTime(
                                                                        title:
                                                                            "Teacher",
                                                                        width:
                                                                            220,
                                                                        type:
                                                                            "teacherDialog"),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            15.0),
                                                                child: Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            right:
                                                                                15.0),
                                                                        child: Textfildwithupper(
                                                                            Uptext:
                                                                                "Period",
                                                                            width:
                                                                                220,
                                                                            controller:
                                                                                period,
                                                                            hinttext:
                                                                                "00:00:00")),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        apptitle:
                                                            "Operation of Lessons",
                                                        subtitle:
                                                            "Add/Edit/Delete"));
                                                  }
                                                },
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    height: 70,
                                                    child: m!
                                                            .studyShare!.isEmpty
                                                        ? Text("")
                                                        : entry.value.contains(
                                                                "No Lesson")!
                                                            ? Icon(
                                                                Icons
                                                                    .add_circle_outline,
                                                                color: Get.theme
                                                                    .primaryColor,
                                                              )
                                                            : Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                entry.value,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              )),
                                              )),
                                    ],
                                  ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
                  ),
          ],
        ),
      );
    });
  }
}
