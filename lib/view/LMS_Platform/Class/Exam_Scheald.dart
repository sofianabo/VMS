import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/AddQuizAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DeleteQuiz.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownSemsesterAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/EditQuizAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/ExamTableAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_My_Sch_Class.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableDialogController.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/ExamTableModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_Table/DropDownExamTable.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Calender.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Exam_Scheald extends StatefulWidget {
  const Exam_Scheald({super.key});

  @override
  State<Exam_Scheald> createState() => _ExamTableState();
}

class _ExamTableState extends State<Exam_Scheald> {
  final ExamTableController c = Get.find<ExamTableController>();

  @override
  void initState() {
    Exam_API(context).Exam_Table();
    Dropdownsemsesterapi(context).Dropdownsemsester();
    Get.find<ExamTableController>().setSemesterIndex();
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
            Container(
              padding: EdgeInsets.only(bottom: 25.0),
              width: Get.width * 0.87,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      DropDownexamTable(
                        isLoading: controller.issemesterLoading,
                        title: "Semester".tr,
                        width: 220,
                        type: 'season',
                      ),
                      DropDownexamTable(
                        isDisabled: controller.examSeasonIndex == "",
                        isLoading: controller.isTypeLoading,
                        title: "Type".tr,
                        width: 220,
                        type: 'type',
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
                                DataCell(Text(Get.find<LocalizationController>()
                                            .currentLocale
                                            .value
                                            .languageCode ==
                                        'ar'
                                    ? exam.classese?.name ?? ""
                                    : exam.classese?.enName ?? '')),
                                DataCell(Text(exam.type ?? '')),
                                DataCell(Text(Get.find<LocalizationController>()
                                            .currentLocale
                                            .value
                                            .languageCode ==
                                        'ar'
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
