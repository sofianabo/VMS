import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/EmployeeAttendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/EmployeeModels/AllEmployeeAttendeceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/AllStudentAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';
import '../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Getemployeeattendenceapi {
  final Employeeattendencecontroller c =
      Get.find<Employeeattendencecontroller>();


  Dio dio = Dio();

  Getemployeeattendence({date}) async {
    try {
      c.setIsLoading(true);
      String myurl = "${global.hostPort}${global.employeeAttendence}";
      var response =
          await dio.post(data: {'date': date}, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        AllEmployeeAttendeceModel emp =
            AllEmployeeAttendeceModel.fromJson(response.data);
        c.setAllEmployee(emp);
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
