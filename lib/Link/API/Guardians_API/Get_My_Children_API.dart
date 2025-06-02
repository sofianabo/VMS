import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/SessionAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/Link/Controller/GuardianController/MyChildren_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSessionModel.dart';
import 'package:vms_school/Link/Model/Guardian_Model/MyChildren.dart';

class Get_My_Children_API {
  Dio dio = Dio();

  Get_My_Children({int? id}) async {
    String myURI = "$hostPort$getMyChildren";
    try {
      var controller = Get.find<MyChildren_Controller>();
      var response = await dio
          .post(myURI, options: getDioOptions(), data: {"sessionId": id});
      controller.setIsloading(true);
      if (response.statusCode == 200) {
        MyChildren myChildren = MyChildren.fromJson(response.data);
        controller.setMyChildren(myChildren);
        controller.setIsloading(false);
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
