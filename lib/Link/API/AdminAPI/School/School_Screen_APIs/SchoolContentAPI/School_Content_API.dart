import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Content_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/SchoolContentModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/School_Data_Model.dart';

class Get_Content_Screen_API {
  Get_Content_Screen_API(this.context);
  BuildContext context;
  Dio dio = Dio();
  Get_Content_Screen() async {
    String myURI = "$hostPort$getSchoolContent";
    try {
      final controller = Get.find<School_Content_Controller>();
      controller.SetisLoading(true);
      var response = await dio.get(myURI, options: getDioOptions());
      if (response.statusCode == 200) {
        controller.SetisLoading(false);
        SchoolContentModel m = SchoolContentModel.fromJson(response.data);
        controller.SetData(m);
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
