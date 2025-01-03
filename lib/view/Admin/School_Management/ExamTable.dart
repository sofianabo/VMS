// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/ExamTableAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/ExamTableController.dart';
import 'package:vms_school/widgets/Admin_Table/DropDownExamTable.dart';

class ExamTable extends StatefulWidget {
  ExamTable({super.key});

  @override
  State<ExamTable> createState() => _ExamTableState();
}

class _ExamTableState extends State<ExamTable> {
  @override
  @override
  void initState() {
    Examtableapi(context).Examtable();
    super.initState();
  }

  List<String> tableData = [
    'Class',
    'Exam Name',
    'Curriculum Name',
    'Date',
    'Period',
    'Max Mark',
    'Passing Mark'
  ];

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: DropDownexamTable(
                    title: "Division",
                    width: Get.width / 5.5,
                    type: 'division',
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
                          onPressed: () {},
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
                    headingRowColor:
                        WidgetStatePropertyAll(Get.theme.colorScheme.secondary),
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
                      DataColumn(label: Text('Exam Name')),
                      DataColumn(label: Text('Curriculum Name')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Period')),
                      DataColumn(label: Text('Max Mark')),
                      DataColumn(label: Text('Passing Mark')),
                    ],
                    rows: controller.quizList.map((exam) {
                      return DataRow(cells: [
                        DataCell(Text(exam.classes?.enName ?? '')),
                        DataCell(Text(exam.name ?? '')),
                        DataCell(Text(exam.curriculumEnName ?? '')),
                        DataCell(Text(exam.startDate ?? '')),
                        DataCell(Text(exam.period ?? '')),
                        DataCell(Text(exam.maxMark?.toString() ?? '')),
                        DataCell(Text(exam.passingMark?.toString() ?? '')),
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
  }
}
