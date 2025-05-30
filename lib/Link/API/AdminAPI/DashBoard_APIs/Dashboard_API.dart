import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Dashboard_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Dashboard_Model.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/main.dart';

class Dashboard_API {
  final controller = Get.find<Dashboard_Controller>();
  final sessionCont = Get.find<All_Screen_Sessions_Controller>();

  Dashboard_API(this.context);

  BuildContext context;
  Dio dio = Dio();

  initDashboard() async {
    String myurl = "$hostPort$dashboard";
    bool isSuccessful = false;
    int retryCount = 0;
    const int maxRetries = 5;

    while (!isSuccessful && retryCount < maxRetries) {
      try {
        var response = await dio.get(
          myurl,
          options: getDioOptions(),
        );

        if (response.statusCode == 200) {
          DashboardModel dashboardModel =
              DashboardModel.fromJson(response.data);
          controller.AddData(dashboardModel);
          AllSessionModel allSessionModel =
              AllSessionModel.fromJson(response.data['session']);
          sessionCont.setAllSession(allSessionModel);
          isSuccessful = true;
        } else {
          retryCount++;
        }
      } on DioException catch (e) {
        print("DioError occurred: ${e.message}, type: ${e.type}");
        if (e.response?.statusCode == 401) {
          await prefs?.clear();
          Get.offAllNamed('/home');
          return; // توقف عن المحاولة
        } else {
          retryCount++;
        }
      } catch (e) {
        retryCount++;
      }

      if (!isSuccessful && retryCount < maxRetries) {
        await Future.delayed(const Duration(seconds: 2));
      }
    }

    if (!isSuccessful && retryCount >= maxRetries) {
      ErrorMessage(
        "Unable to fetch dashboard data after multiple attempts.",
      );
    }
  }
}
