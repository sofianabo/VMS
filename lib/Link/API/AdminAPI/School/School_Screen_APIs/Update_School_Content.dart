import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/School_Data_Model.dart';

class Update_Content_Screen_API {
  Update_Content_Screen_API(this.context);
  BuildContext context;
  Dio dio = Dio();
  Update_Content_Screen({
    required String name,
    required String count,
  }) async {
    String myURI = "$hostPort$updateSchoolContents";
    try {
      // final controller = Get.find<SchoolContentController>();
      // controller.setIsLoading(true);
      var response = await dio.post(myURI, options: getDioOptions());
      if (response.statusCode == 200) {
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
    } catch (e) {
      if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
