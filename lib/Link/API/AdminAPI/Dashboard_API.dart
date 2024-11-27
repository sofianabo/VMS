import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Dashboard_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/Dashboard_Model.dart';
import 'package:vms_school/main.dart';

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
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
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
