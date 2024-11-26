import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/AllTeachersController.dart';
import 'package:vms_school/main.dart';
import '../API.dart' as global;

class Addteacherapi {
   Allteachercontroller u = Get.find<Allteachercontroller>();
  Addteacherapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Addteacher(
    String firstName,
    String lastName,
    String email,
    String username,
    String date,
    String phone,
    String gender,
    String contractType,
    String roll,
    String jobTitle,
    String password,
  ) async {
    String myurl = "${global.hostPort}${global.addEmpolyee}";
    try {
      var response = await dio.post(myurl,
          data: {
            "firstName": firstName,
            "lastName": lastName,
            "gender": gender,
            "joinDate": date,
            "contractType": contractType,
            "phone": phone,
            "roll": roll,
            "email": email,
            "userName": username,
            "jobTitle": jobTitle,
            "password": password
          },
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
