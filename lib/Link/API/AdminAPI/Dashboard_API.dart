import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/API.dart';
import 'package:getx/Link/Controller/AdminController/Dashboard_Controller.dart';
import 'package:getx/Link/Model/AdminModel/Dashboard_Model.dart';
import 'package:getx/main.dart';

class Dashboard_API {
  final controller = Get.find<Dashboard_Controller>();

  Dashboard_API(this.context);

  BuildContext context;
  Dio dio = Dio();

  initDashboard() async {
    String myurl = "${hostPort}${dashboard}";
    try {
      var response = await dio.get(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${prefs!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        print(response.data);
        DashboardModel dashboardModel = DashboardModel.fromJson(response.data);
        controller.AddData(dashboardModel);
      } else {
        return throw Exception("Failed");
      }
      return response.statusCode;
    } catch (e) {
      print('$e');
    }
  }
}
