import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AuthController/UserController.dart';
import 'package:getx/Link/Model/AuthModel/UserModel.dart';
import 'package:getx/main.dart';
import '../../../view/website/Home.dart';
import '../API.dart' as global;

class Logoutapi {
  final UserController u = Get.find<UserController>();
  Logoutapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Logout() async {
    String myurl = "${global.hostPort}${global.logout}";
    try {
      var response = await dio.get(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${tokenPref!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        await tokenPref!.clear();
        
        Get.to(
          () => Directionality(textDirection: TextDirection.rtl, child: Home()),
        );
      } else {
        return throw Exception("Failed");
      }
      return response.statusCode;
    } catch (e) {
      print('logout field');
    }
  }
}
