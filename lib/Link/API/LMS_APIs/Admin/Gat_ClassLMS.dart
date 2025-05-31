import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Classes_Model.dart';

class Get_Classes_LMS_API {
  Dio dio = Dio();
  Get_Classes_LMS() async {
    final controller = Get.find<ClassMgmtController>();

    try {
      controller.SetIsLoading(true);
      String myurl = "$hostPort$getClassesLms";
      var response = await dio.post(myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        Classes_Model allClassModel = Classes_Model.fromJson(response.data);
        controller.SetClasses(allClassModel);
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
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
