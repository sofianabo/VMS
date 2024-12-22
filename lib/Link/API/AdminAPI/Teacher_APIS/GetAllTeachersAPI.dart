import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Employeeecontroller.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllTeacherModel.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Getallteachersapi {
  BuildContext context;
  Getallteachersapi(this.context);

  static Getallteachers({sessionID}) async {
      Dio dio = Dio();

   final Allteachercontroller controller = Get.find<Allteachercontroller>();
    final EmployeeController AttendenceController =
        Get.find<EmployeeController>();
    controller.setIsLoading(true);
    AttendenceController.setIsload(true);
 
    try {
      String myurl = "${hostPort}${getTeachers}";
      var response = await dio.get(
        data: {
          'sessionId':sessionID
        },
          myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        AllTeacherModel teacher = AllTeacherModel.fromJson(response.data);
        controller.setAllTeacher(teacher);
       AttendenceController.setTeacherData(teacher);
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioError) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
