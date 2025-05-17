import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/GuardianController/MyChildren_Controller.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/My_Students_Controller.dart';
import 'package:vms_school/Link/Model/Guardian_Model/MyChildren.dart';
import 'package:vms_school/Link/Model/Teacher_Model/My_Students_Model.dart';

class Get_My_Students_API {
  Dio dio = Dio();
  Get_My_Students() async {
    String myURI = "$hostPort$getStudentByTeacher";
    try {
      var controller = Get.find<My_Students_Controller>();
      var response = await dio.post(myURI, options: getDioOptions());
      controller.setIsloading(true);
      if (response.statusCode == 200) {
        My_Students_Model my_students_model =
            My_Students_Model.fromJson(response.data);
        controller.setAllStudents(my_students_model);
        controller.setIsloading(false);
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
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
