// ignore_for_file: must_be_immutable, file_names

import 'package:dio/dio.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/AddQuizAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DeleteQuiz.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownSemsesterAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/EditQuizAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/ExamTableAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSemesterModel.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/Admin/Admin_Table/DropDownExamTable.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import 'package:vms_school/widgets/Responsive.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Examtableforchild extends StatefulWidget {
  const Examtableforchild({super.key});

  @override
  State<Examtableforchild> createState() => _ExamtableforchildState();
}

class _ExamtableforchildState extends State<Examtableforchild> {
  final ExamTableController c = Get.find<ExamTableController>();

  @override
  void initState() {
    Examtableapi(context).Examtable();
 
    Get.find<ExamTableController>().initialData();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamTableController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.only(top: 38.0, right: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        
            GetBuilder<ExamTableController>(builder: (controller) {
              if (controller.isLoading) {
                return Expanded(
                  child: Container(
                    width: Get.width >= 768 ? Get.width - 120 : Get.width - 70,
                    child: LoadingAnimationWidget.inkDrop(
                      color: Theme.of(context).primaryColor,
                      size: 60,
                    ),
                  ),
                );
              }
              if (controller.filteredquiz!.isEmpty) {
                return Expanded(
                  child: Container(
                    width: Get.width >= 768 ? Get.width - 120 : Get.width - 70,
                    child: Center(
                      child: Text("No Data in Exam Table".tr,
                          style: Get.theme.textTheme.titleLarge!.copyWith(
                              fontSize: 16, fontWeight: FontWeight.normal)),
                    ),
                  ),
                );
              }
              return Expanded(
                child: Container(
                  width: Get.width >= 768 ? Get.width - 120 : Get.width - 70,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            headingRowColor: WidgetStatePropertyAll(
                                Theme.of(context).indicatorColor),
                            border: TableBorder.all(
                              color: Theme.of(context).primaryColor,
                              width: 1.0,
                            ),
                            columns: [
                              DataColumn(
                                label: Text("Class".tr,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                              ),
                              DataColumn(label: Text('Type'.tr)),
                              DataColumn(label: Text('Curriculum Name'.tr)),
                              DataColumn(label: Text('Date'.tr)),
                              DataColumn(label: Text('Period'.tr)),
                              DataColumn(label: Text('Max Mark'.tr)),
                              DataColumn(
                                label: Text('Passing Mark'.tr),
                              ),
                             
                            ],
                            rows: controller.filteredquiz!.map((exam) {
                              return DataRow(cells: [
                                DataCell(Text(
                                    prefs!.getString(languageKey) == 'ar'
                                        ? exam.classese?.name ?? ""
                                        : exam.classese?.enName ?? '')),
                                DataCell(Text(exam.type ?? '')),
                                DataCell(Text(
                                    prefs!.getString(languageKey) == 'ar'
                                        ? exam.curriculumName ?? ''
                                        : exam.curriculumEnName ?? '')),
                                DataCell(Text(exam.startDate ?? '')),
                                DataCell(Text(exam.period ?? '')),
                                DataCell(Text(exam.maxMark?.toString() ?? '')),
                                DataCell(
                                    Text(exam.passingMark?.toString() ?? '')),
                                
                              ]);
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}
