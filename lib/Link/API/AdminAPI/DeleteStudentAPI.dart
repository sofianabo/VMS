import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/GetAllStudentAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/main.dart';

class Deletestudentapi {
  Deletestudentapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Deletestudent(int id) async {
    String myurl = "${hostPort}${deleteStudent}";
    try {
      var response = await dio.get(myurl,
          data: {
            "id":id
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${prefs!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        await Getallstudentapi(context).Getallstudent(null,null,null,null);
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
