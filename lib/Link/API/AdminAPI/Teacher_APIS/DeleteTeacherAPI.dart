import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import '../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Deleteteacherapi {
  Deleteteacherapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Deleteteacher(int id) async {
    String myurl = "${global.hostPort}${global.deleteTeacher}";
    try {
      var response = await dio.post(myurl,
          data: {"id": id},
options: getDioOptions());
      if (response.statusCode == 200) {
        await Getallteachersapi.Getallteachers();
        Get.back();
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
      return response.statusCode;
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
