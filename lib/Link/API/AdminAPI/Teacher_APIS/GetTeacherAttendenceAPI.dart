import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownSessionsAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/EmployeeAttendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllEmployeeAttendeceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStudentAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';
import '../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Getteacherattendenceapi {
  // final Employeeattendencecontroller c =
  //     Get.find<Employeeattendencecontroller>();
  BuildContext context;

  Getteacherattendenceapi(this.context);

  Dio dio = Dio();

  Getteacherattendence() async {
    try {
      // c.setIsLoading(true);
      // AllSessionModel s = await Getsessionapi(context).Getsession();
      // c.setAllSession(s);

      String myurl = "${global.hostPort}${global.getTeacherAttendance}";
      var response = await dio.get(myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        // AllEmployeeAttendeceModel emp =
        //     AllEmployeeAttendeceModel.fromJson(response.data);
        // c.setAllEmployee(emp);
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
