import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Employeeecontroller.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Model/AdminModel/EmployeeModels/IncreaseEmpolyeeAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/TeacherModels/IncreaseTeacherAttendenceModel.dart';

class Increaseemployeattendenceapi {
  BuildContext context;
  Increaseemployeattendenceapi(this.context);

  static Increaseemployeattendence({required String DateTime}) async {
    Dio dio = Dio();

    final EmployeeController AttendenceController =
        Get.find<EmployeeController>();
    AttendenceController.setIsload(true);

    try {
      String myurl = "$hostPort$employeeIncreaseAttendance";
      var response = await dio
          .post(data: {"date": DateTime}, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        IncreaseEmpolyeeAttendenceModel empolyee =
            IncreaseEmpolyeeAttendenceModel.fromJson(response.data);
        AttendenceController.setData(empolyee);
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
