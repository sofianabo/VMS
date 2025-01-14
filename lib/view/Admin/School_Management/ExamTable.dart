// ignore_for_file: must_be_immutable, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/AddQuizAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DeleteQuiz.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownSemsesterAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/EditQuizAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/ExamTableAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSemesterModel.dart';
import 'package:vms_school/widgets/Admin_Table/DropDownExamTable.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class ExamTable extends StatefulWidget {
  const ExamTable({super.key});

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
  TextEditingController maxDialog = TextEditingController();
  TextEditingController minDialog = TextEditingController();
  TextEditingController periodDialog = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamTableController>(builder: (controller) {
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
                                      const Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15.0),
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
                                      const Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
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
                                                      text: const TextSpan(
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
                              style: const ButtonStyle(
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
                            style: const ButtonStyle(
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
                : Column(
                    children: [
                      Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 20),
                        child: SingleChildScrollView(child:
                            GetBuilder<ExamTableController>(
                                builder: (controller) {
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
                              const DataColumn(label: Text('Type')),
                              const DataColumn(label: Text('Curriculum Name')),
                              const DataColumn(label: Text('Date')),
                              const DataColumn(label: Text('Period')),
                              const DataColumn(label: Text('Max Mark')),
                              const DataColumn(
                                label: Text('Passing Mark'),
                              ),
                              const DataColumn(
                                label: Text('Operations'),
                              ),
                            ],
                            rows: controller.filteredquiz!.map((exam) {
                              return DataRow(cells: [
                                DataCell(Text(exam.classes?.enName ?? '')),
                                DataCell(Text(exam.type?.enName ?? '')),
                                DataCell(Text(exam.curriculumName ?? '')),
                                DataCell(Text(exam.startDate ?? '')),
                                DataCell(Text(exam.period ?? '')),
                                DataCell(Text(exam.maxMark?.toString() ?? '')),
                                DataCell(
                                    Text(exam.passingMark?.toString() ?? '')),
                                DataCell(Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      style: ButtonStyle(
                                          maximumSize: WidgetStateProperty.all(
                                              const Size(35, 35)),
                                          minimumSize: WidgetStateProperty.all(
                                              const Size(35, 35)),
                                          iconSize: WidgetStateProperty.all(14),
                                          shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  const Color(0xffB03D3D))),
                                      icon: const Icon(VMS_Icons.bin),
                                      iconSize: 16,
                                      color: Colors.white,
                                      onPressed: () async {
                                        await DeletequizAPI(context).Deletequiz(
                                            controller
                                                .filteredquiz![controller.filteredquiz!
                                                    .indexOf(exam)]
                                                .id
                                                .toString());
                                      },
                                    ),
                                    IconButton(
                                      style: ButtonStyle(
                                          maximumSize: WidgetStateProperty.all(
                                              const Size(35, 35)),
                                          minimumSize: WidgetStateProperty.all(
                                              const Size(35, 35)),
                                          iconSize: WidgetStateProperty.all(14),
                                          shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  const Color.fromARGB(
                                                      255, 2, 124, 49))),
                                      icon: const Icon(VMS_Icons.edit),
                                      iconSize: 16,
                                      color: Colors.white,
                                      onPressed: () async {
                                        CancelToken cancelToken = CancelToken();
                                        Loading_Dialog(
                                            cancelToken: cancelToken);
                                        maxDialog.text = controller
                                            .filteredquiz![controller.filteredquiz!
                                                .indexOf(exam)]
                                            .maxMark
                                            .toString();
                                        minDialog.text = controller
                                            .filteredquiz![controller.filteredquiz!
                                                .indexOf(exam)]
                                            .passingMark
                                            .toString();
                                        periodDialog.text = controller
                                            .filteredquiz![controller.filteredquiz!
                                                .indexOf(exam)]
                                            .period
                                            .toString();
                                        AllSemesterModel semester =
                                            await Dropdownsemsesterapi(context)
                                                .Dropdownsemsester();
                                        controller
                                            .setAllSemesterDialog(semester);

                                        Get.back();
                                        Get.dialog(VMSAlertDialog(
                                            action: [
                                              ButtonDialog(
                                                  text: "Edit Exam",
                                                  onPressed: () async {
                                                    await Editquizapi(
                                                            context)
                                                        .Editquiz(
                                                            controller
                                                                .filteredquiz![controller
                                                                    .filteredquiz!
                                                                    .indexOf(
                                                                        exam)]
                                                                .id
                                                                .toString(),
                                                            controller.dateindex
                                                                .toString(),
                                                            periodDialog.text,
                                                            maxDialog.text,
                                                            minDialog.text);
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
                                                      const EdgeInsets.only(
                                                          top: 15.0),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 15.0),
                                                        child:
                                                            Textfildwithupper(
                                                                Uptext:
                                                                    "Max Mark",
                                                                width: 220,
                                                                controller:
                                                                    maxDialog,
                                                                hinttext:
                                                                    "Max Mark"),
                                                      ),
                                                      Textfildwithupper(
                                                          Uptext: "Min Mark",
                                                          width: 220,
                                                          controller: minDialog,
                                                          hinttext: "Min Mark")
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15.0),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 15.0),
                                                          child: Textfildwithupper(
                                                              Uptext: "Period",
                                                              width: 220,
                                                              controller:
                                                                  periodDialog,
                                                              hinttext:
                                                                  "00:00:00")),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        5.0),
                                                            child: RichText(
                                                                text: const TextSpan(
                                                                    text:
                                                                        "Date")),
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
                                            apptitle: "Edit Exam",
                                            subtitle: "none"));
                                      },
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
