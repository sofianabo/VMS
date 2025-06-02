import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AuthController/UserController.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import '../API.dart' as global;

class Forget_Password_API {
  Dio dio = Dio();
  Forget_Password({required String username}) async {
    String myurl = "${global.hostPort}${global.forgetPassword}";

    var response = await dio.post(myurl,
        data: {'userName': '$username'},
        options: Options(headers: {
          'accept': 'application/json',
        }));
    return response;
  }
}
