import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Subject_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeacherAtendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Subject_LMS_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Subject_Model.dart';

class Get_Subject_LMS_API {
  Dio dio = Dio();

  Get_Subject_LMS() async {
    final controller = Get.find<Subject_LMS_Controller>();
    controller.setIsLoading(true);
    try {
      String myurl = "$hostPort$LmsSubject";
      var response = await dio.post(data: {
        "classId": Get.find<Selected_Class_Controller>().classid,
      }, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        Subject_Model subjects = Subject_Model.fromJson(response.data);
        controller.setData(subjects);
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
