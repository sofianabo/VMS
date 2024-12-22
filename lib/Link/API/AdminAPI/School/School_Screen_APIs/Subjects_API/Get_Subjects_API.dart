import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Subject_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Subject_Model.dart';

class Get_Subject_Screen_API {
  BuildContext context;
  Get_Subject_Screen_API(this.context);
  Dio dio = Dio();

  Get_Subject_Screen() async {
    final controller = Get.find<Subject_Controller>();
    controller.setIsLoading(true);
    try {
      String myurl = "${hostPort}${getSubject}";
      var response = await dio.get(myurl,
          options: getDioOptions());
      if (response.statusCode == 200) {
        Subject_Model subjects = Subject_Model.fromJson(response.data);
        controller.setData(subjects);
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