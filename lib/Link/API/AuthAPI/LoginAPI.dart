import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      var response = await dio.post(myurl,
          data: {
            "userName": username,
            "password": password,
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer'
          }));
      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(response.data);
        u.GetuserInfo(user);
        prefs!.setBool("isLogin", true);
        Get.to(
          () => AdminHome(),
        );
      } else {
        return throw Exception("Failed");
      }
      return response.statusCode;
    } catch (e) {
      print('Login field');
    }
  }
}
