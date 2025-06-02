import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AuthController/UserController.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import '../API.dart' as global;

class Virifing_Password_API {
  Dio dio = Dio();
  Virifing_Password(
      {required String username,
      required String code,
      required String password}) async {
    String myurl = "${global.hostPort}${global.verifyPassword}";

    try {
      var response = await dio.post(myurl,
          data: {
            'code': '$code',
            'password': '$password',
            'userName': '$username',
          },
          options: Options(headers: {
            'accept': 'application/json',
          }));

      return response.statusCode;
    } catch (e) {
      if (e.toString().contains("status code of 412")) {
        return 412;
      }
    }
  }
}
