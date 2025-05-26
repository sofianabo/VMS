import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/oneEmployeeAttendenceController.dart';
import 'package:vms_school/Translate/local_controller.dart'
    show LocalizationController;

class My_Attandens extends StatefulWidget {
  const My_Attandens({super.key});

  @override
  State<My_Attandens> createState() => _AttState();
}

class _AttState extends State<My_Attandens> {
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
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
            Padding(
              padding: const EdgeInsets.only(
                  top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
              child: Text(
                "My Attendance".tr,
                style: TextStyle(fontSize: 18),
              ),
            ),
            GetBuilder<Oneemployeeattendencecontroller>(
              builder: (oneControl) {
                if (oneControl.isLoading) {
                  return Expanded(
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Directionality(
                      textDirection: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: SizedBox(
                        width: Get.width,
                        child: SingleChildScrollView(
                          child: DataTable(
                            border: TableBorder.all(
                              color: Theme.of(context).primaryColor,
                              width: 1.0,
                            ),
                            columns: [
                              DataColumn(
                                label: Text(
                                  'Date'.tr,
                                  style: Get.theme.textTheme.bodyMedium,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Status'.tr,
                                  style: Get.theme.textTheme.bodyMedium,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Cause'.tr,
                                  style: Get.theme.textTheme.bodyMedium,
                                ),
                              ),
                            ],
                            rows: [
                              for (var studentAttendance
                                  in oneControl.employeeAtt ?? [])
                                DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        studentAttendance.date ?? 'N/A',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                    //status
                                    DataCell(
                                      Text(
                                        studentAttendance.status
                                                .toString()
                                                .tr ??
                                            'N/A',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        studentAttendance.cause ?? 'N/A',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      );
    });
  }
}
