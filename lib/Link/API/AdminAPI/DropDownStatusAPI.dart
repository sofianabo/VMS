import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/DropDownSessionController.dart.dart';
import 'package:vms_school/Link/Controller/AdminController/DropDownStatusController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStatusModel.dart';
import 'package:vms_school/main.dart';
import '../API.dart';

class Dropdownstatusapi {
  Dropdownstatuscontroller c = Get.find<Dropdownstatuscontroller>();
  BuildContext context;
  Dropdownstatusapi(this.context);
  Dio dio = Dio();

  Dropdownstatus() async {
    try {
      String myurl = "${hostPort}${getAllStatusRequest}";
      var response = await dio.get(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${prefs!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        AllStatusModel status = AllStatusModel.fromJson(response.data);
        c.setStatus(status);
        return status;
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
