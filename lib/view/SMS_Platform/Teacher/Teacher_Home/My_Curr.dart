import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Teacher_API/Get_My_Curr.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/TeacherSubjectsController.dart';
import 'package:vms_school/Translate/local_controller.dart';

class My_Curr extends StatefulWidget {
  My_Curr({required this.id, super.key});
  int id;
  @override
  State<My_Curr> createState() => _ProfileState();
}

class _ProfileState extends State<My_Curr> {
  @override
  void initState() {
    Get_My_Curr(context).Getteachersubject(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        textDirection: Get.find<LocalizationController>()
                    .currentLocale
                    .value
                    .languageCode ==
                'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
                child: Text(
                  "My_Curr".tr,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Expanded(
            child: GetBuilder<Teachersubjectscontroller>(builder: (control) {
              if (control.isLoading == true) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return SizedBox(
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: DataTable(
                      border: TableBorder.all(
                        color: Get.theme.primaryColor,
                        width: 1.0,
                      ),
                      columns: [
                        DataColumn(
                          label: Text(
                            'Subject'.tr,
                            style: Get.theme.textTheme.bodyMedium,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Class'.tr,
                            style: Get.theme.textTheme.bodyMedium,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Division'.tr,
                            style: Get.theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                      rows: [
                        for (var emp in control.teacherSub ?? [])
                          DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  Get.find<LocalizationController>()
                                              .currentLocale
                                              .value
                                              .languageCode ==
                                          'ar'
                                      ? emp.subjects.name
                                      : emp.subjects.enName ?? 'N/A',
                                  style: Get.theme.textTheme.bodyMedium,
                                ),
                              ),
                              //status
                              DataCell(
                                Text(
                                  Get.find<LocalizationController>()
                                              .currentLocale
                                              .value
                                              .languageCode ==
                                          'ar'
                                      ? emp.classes.name
                                      : emp.classes.enName ?? 'N/A',
                                  style: Get.theme.textTheme.bodyMedium,
                                ),
                              ),
                              DataCell(
                                Text(
                                  Get.find<LocalizationController>()
                                              .currentLocale
                                              .value
                                              .languageCode ==
                                          'ar'
                                      ? emp.division.name
                                      : emp.division.enName ?? 'N/A',
                                  style: Get.theme.textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
