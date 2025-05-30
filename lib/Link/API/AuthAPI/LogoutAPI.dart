import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AuthController/UserController.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import '../API.dart' as global;

class Logoutapi {
  final UserController u = Get.find<UserController>();
  Logoutapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Logout({required String Type}) async {
    String myurl;
    if (Type == "all") {
      myurl = "${global.hostPort}${global.logout}/1";
    } else {
      myurl = "${global.hostPort}${global.logout}/0";
    }
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.get(myurl,
          cancelToken: cancelToken,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${prefs!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        prefs!.clear();
        Get.offAllNamed("/home");
      } else {
        return throw Exception("Failed");
      }
      return response.statusCode;
    } catch (e) {}
  }
}
