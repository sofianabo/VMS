import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/UserController.dart';
import 'package:getx/Link/Model/UserModel.dart';
import '../API.dart' as global;

class LoginAPI {
  final UserController u = Get.put(UserController());
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
      } else {
        return throw Exception("Failed");
      }
      return response.statusCode;
    } catch (e) {
      print('Login field');
    }
  }
}
