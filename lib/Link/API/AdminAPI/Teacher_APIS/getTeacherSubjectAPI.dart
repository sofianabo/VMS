import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/TeacherSubjectsController.dart';
import 'package:vms_school/Link/Model/AdminModel/TeacherModels/TeacherSubjectModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import '../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Getteachersubjectapi {
  BuildContext context;
  final Teachersubjectscontroller c = Get.find<Teachersubjectscontroller>();
  Getteachersubjectapi(this.context);
  Dio dio = Dio();

  Getteachersubject(int id, int index) async {
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      String myurl = "${global.hostPort}${global.getSCDTeacherById}";
      var response = await dio.post(myurl,
          cancelToken: cancelToken,
          data: {"teacherId": id},
          options: getDioOptions());
      if (response.statusCode == 200) {
        TeacherSubjectModel st = TeacherSubjectModel.fromJson(response.data);
        c.setTeacherSubject(st);
        Get.back();
        Get.dialog(GetBuilder<Allteachercontroller>(
          builder: (oneControl) {
            return VMSAlertDialog(
              action: [const Text("")],
              contents: SizedBox(
                width: 600,
                height: Get.height,
                child: Column(
                  children: [
                    SizedBox(
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
                            // هنا نقوم بملئ الصفوف ببيانات الطالب
                            for (var emp in st.teacherSubject ?? [])
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
                    ),
                  ],
                ),
              ),
              apptitle: "sub".tr +
                  " ${oneControl.filteredTeacher![index].fullName} " +
                  "Subjects".tr,
              subtitle: "none",
            );
          },
        ));
      } else {
        Get.back();
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
