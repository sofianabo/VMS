import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Employeeecontroller.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStudentModel.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Getallstudentapi {
  BuildContext context;

  Getallstudentapi(this.context);

  static Getallstudent({
    int? sessionID,
  }) async {
    try {
      final Allstudentscontroller c = Get.find<Allstudentscontroller>();
      Dio dio = Dio();
      c.setIsLoading(true);

      String myurl = "${hostPort}${getStudents}";
      var response = await dio.post(myurl,
          data: {
        "sessionId":sessionID
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        c.setIsLoading(false);
        AllStudentModel student = AllStudentModel.fromJson(response.data);
        c.setAllStudents(student);
        Getallgradeapi.Getallgrade();
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
