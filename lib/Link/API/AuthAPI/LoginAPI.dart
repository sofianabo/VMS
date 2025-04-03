import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AuthController/UserController.dart';
import 'package:vms_school/Link/Model/AuthModel/UserModel.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Admin/AdminHome.dart';
import '../API.dart' as global;

class LoginAPI {
  final UserController u = Get.find<UserController>();
  LoginAPI(this.context);
  BuildContext context;
  Dio dio = Dio();
  login(String username, String password) async {
    String myurl = "${global.hostPort}${global.LOGIN}";
    try {
      u.SetIsloading(true);
      var response = await dio.post(myurl,
          data: {
            "userName": username,
            "password": password,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(response.data);
        u.GetuserInfo(user);
        prefs!.setBool("isLogin", true);
        prefs!.setString("role", user.roll!);
        prefs!.setBool("hasData", user.hasData!);
        prefs!.setBool("isVerified", user.verified!);
        prefs!.setString("email", user.email!);
        prefs!.setString("imageId", user.imageId.toString());
        prefs!.setString("fullname", user.fullName.toString());
        Get.offAllNamed('/admin');
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
    } finally {
      u.SetIsloading(false);
    }
  }
}
