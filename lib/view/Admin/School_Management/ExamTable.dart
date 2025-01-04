// ignore_for_file: must_be_immutable, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/AddQuizAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DeleteQuiz.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownSemsesterAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/ExamTableAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSemesterModel.dart';
import 'package:vms_school/widgets/Admin_Table/DropDownExamTable.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class ExamTable extends StatefulWidget {
  ExamTable({super.key});

  @override
  State<ExamTable> createState() => _ExamTableState();
}

class _ExamTableState extends State<ExamTable> {
  final ExamTableController c = Get.find<ExamTableController>();

  @override
  void initState() {
    Examtableapi(context).Examtable();

    super.initState();
  }

  List<String> tableData = [
    'Class',
    'Type',
    'Curriculum Name',
    'Date',
    'Period',
    'Max Mark',
    'Passing Mark'
  ];

  TextEditingController period = TextEditingController();
  TextEditingController max = TextEditingController();
  TextEditingController min = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamTableController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(top: 38.0, right: 25.0, left: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Get.width * 0.9,
              child: Row(
                children: [
                  DropDownexamTable(
                    title: "Semester",
                    width: Get.width / 6.5,
                    type: 'season',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: DropDownexamTable(
                      title: "Type",
                      width: Get.width / 6.5,
                      type: 'type',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: DropDownexamTable(
                      type: 'class',
                      title: "Class",
                      width: Get.width / 6.5,
                    ),
                  ),
                  Spacer(),
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
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () async {
                              CancelToken cancelToken = CancelToken();
                              Loading_Dialog(cancelToken: cancelToken);
                              AllSemesterModel semester =
                                  await Dropdownsemsesterapi(context)
                                      .Dropdownsemsester();
                              controller.setAllSemesterDialog(semester);

                              Get.back();

                              Get.dialog(VMSAlertDialog(
                                  action: [
                                    ButtonDialog(
                                        text: "Add Exam",
                                        onPressed: () async {
                                          await Addquizapi(context).Addquiz(
                                              controller.curiculmDialogList
                                                  .indexOf(controller
                                                      .selectedCuriculmDialog),
                                              controller.typeDialogList.indexOf(
                                                  controller
                                                      .selectedTypeDialog),
                                              controller.dateindex.toString(),
                                              period.text,
                                              controller.classDialogList
                                                  .indexOf(controller
                                                      .selectedClassDailog),
                                              max.text,
                                              min.text);
                                          Get.back();
                                        },
                                        color: Get.theme.primaryColor,
                                        width: 120)
                                  ],
                                  contents: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0),
                                              child: DropDownexamTable(
                                                  title: "Class",
                                                  width: 220,
                                                  type: "classDialog"),
                                            ),
                                            DropDownexamTable(
                                                title: "Curiculm ",
                                                width: 220,
                                                type: "curiculmDialog"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 15.0,
                                              ),
                                              child: DropDownexamTable(
                                                  title: "season ",
                                                  width: 220,
                                                  type: "semesterDialog"),
                                            ),
                                            DropDownexamTable(
                                                title: "Type ",
                                                width: 220,
                                                type: "typeDialog"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0),
                                              child: Textfildwithupper(
                                                  Uptext: "Max Mark",
                                                  width: 220,
                                                  controller: max,
                                                  hinttext: "Max Mark"),
                                            ),
                                            Textfildwithupper(
                                                Uptext: "Min Mark",
                                                width: 220,
                                                controller: min,
                                                hinttext: "Min Mark")
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15.0),
                                                child: Textfildwithupper(
                                                    Uptext: "Period",
                                                    width: 220,
                                                    controller: period,
                                                    hinttext: "00:00:00")),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5.0),
                                                  child: RichText(
                                                      text: TextSpan(
                                                          text: "Date")),
                                                ),
                                                examDate(
                                                  width: 220,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  apptitle: "Add Exam",
                                  subtitle: "none"));
                            },
                            icon: Icon(Icons.add,
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
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {},
                              icon: Icon(VMS_Icons.xl,
                                  size: 18, color: Get.theme.primaryColor)),
                        ),
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
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {},
                            icon: Icon(VMS_Icons.pdf,
                                size: 18, color: Get.theme.primaryColor)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: Get.width * 0.9,
                  margin: const EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(child:
                      GetBuilder<ExamTableController>(builder: (controller) {
                    return DataTable(
                      headingRowColor: WidgetStatePropertyAll(
                          Get.theme.colorScheme.secondary),
                      border: TableBorder.all(
                        color: Get.theme.primaryColor,
                        width: 1.0,
                      ),
                      columns: [
                        DataColumn(
                          label: Text("Class",
                              textAlign: TextAlign.center,
                              style: Get.theme.textTheme.titleLarge),
                        ),
                        DataColumn(label: Text('Type')),
                        DataColumn(label: Text('Curriculum Name')),
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Period')),
                        DataColumn(label: Text('Max Mark')),
                        DataColumn(
                          label: Text('Passing Mark'),
                        ),
                        DataColumn(
                          label: Text('Operations'),
                        ),
                      ],
                      rows: controller.quizList.map((exam) {
                        return DataRow(cells: [
                          DataCell(Text(exam.classes?.enName ?? '')),
                          DataCell(Text(exam.type?.enName ?? '')),
                          DataCell(Text(exam.curriculumName ?? '')),
                          DataCell(Text(exam.startDate ?? '')),
                          DataCell(Text(exam.period ?? '')),
                          DataCell(Text(exam.maxMark?.toString() ?? '')),
                          DataCell(Text(exam.passingMark?.toString() ?? '')),
                          DataCell(Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: Icon(VMS_Icons.bin),
                                iconSize: 16,
                                color: Colors.red,
                                onPressed: () async {
                                  await DeletequizAPI(context).Deletequiz(
                                      controller
                                          .quizList[
                                              controller.quizList.indexOf(exam)]
                                          .id
                                          .toString());
                                },
                              ),
                              IconButton(
                                icon: Icon(VMS_Icons.edit),
                                iconSize: 16,
                                color: Colors.green,
                                onPressed: () {},
                              ),
                            ],
                          )),
                        ]);
                      }).toList(),
                    );
                  })),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
