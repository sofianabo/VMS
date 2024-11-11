import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/HomeScreenController.dart';
import 'package:getx/Link/Model/HomeModel.dart';
import 'package:getx/Link/Model/UserModel.dart';
import 'API.dart' as global;

class Homescreenapi {
  final Homescreencontroller u = Get.find<Homescreencontroller>();
  Homescreenapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  homescreen() async {
    String myurl = "${global.hostPort}${global.Home}";
    try {
      var response = await dio.get(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer'
          }));
      HomeModel home = HomeModel.fromJson(response.data);
      u.getHomeInfo(home);
      return response.statusCode;
    } catch (e) {
      print('Login field');
    }
  }
}
