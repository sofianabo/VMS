import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Divisions_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LMS_Divisions_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Division_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/Division_LMS_Model.dart';

class Get_LMS_Division_API {
  BuildContext context;
  Get_LMS_Division_API(this.context);
  Dio dio = Dio();
  Get_LMS_Division() async {
    final controller = Get.find<LMS_Divisions_Controller>();
    controller.SetIsloading(true);
    try {
      String myurl = "$hostPort$getLmsDivision";
      var response = await dio.post(myurl,
          data: {'classId': Get.find<Selected_Class_Controller>().classid},
          options: getDioOptions());
      if (response.statusCode == 200) {
        Division_LMS_Model LMSDivisionModel =
            Division_LMS_Model.fromJson(response.data);
        controller.setDivisions(LMSDivisionModel);
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
