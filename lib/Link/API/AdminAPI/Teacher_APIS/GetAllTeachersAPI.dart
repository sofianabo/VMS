import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Employeeecontroller.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/TeacherModels/AllTeacherModel.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';

class Getallteachersapi {
  BuildContext context;
  Getallteachersapi(this.context);

  static Getallteachers({sessionID}) async {
    Dio dio = Dio();

    final Allteachercontroller controller = Get.find<Allteachercontroller>();
    controller.setIsLoading(true);

    try {
      Get.find<AdminSchoolTimeController>().SetisLoadingTeacher(true);
      String myurl = "$hostPort$getTeachers";
      var response = await dio.post(
          data: {'sessionId': sessionID}, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        AllTeacherModel teacher = AllTeacherModel.fromJson(response.data);
        controller.setAllTeacher(teacher);
        Get.find<AdminSchoolTimeController>().setAllTeacherDialog(teacher);
        Get.find<AdminSchoolTimeController>().SetisLoadingTeacher(false);
        return teacher;
      } else {
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
