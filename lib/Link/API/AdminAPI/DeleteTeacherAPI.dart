import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/AdminAPI/GetAllTeachersAPI.dart';
import 'package:getx/Link/API/Error_API.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Deleteteacherapi {
  Deleteteacherapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Deleteteacher(int id) async {
    String myurl = "${global.hostPort}${global.deleteTeacher}";
    try {
      var response = await dio.post(myurl,
          data: {"id": id},
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${prefs!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        await Getallteachersapi(context).Getallteachers(null);
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
