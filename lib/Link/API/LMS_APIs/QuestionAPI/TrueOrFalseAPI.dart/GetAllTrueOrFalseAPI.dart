import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Divisions_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Files_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LMS_Divisions_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LinksLMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_True_Or_Flase_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Qustions_Bank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/TrueOrFalseController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Division_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/Division_LMS_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/Files_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/LinksLMSModel.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/TrueOrFalseModel.dart';

class Getalltrueorfalseapi {
  Dio dio = Dio();
  Getalltrueorfalse() async {
    final controller = Get.find<Trueorfalsecontroller>();
    final Quiz_controller = Get.find<Quiz_True_Or_False_Controller>();
    controller.SetIsLoading(true);
    Quiz_controller.SetIsLoading(true);
    try {
      String myurl = "$hostPort$getQuestion";

      var response = await dio.post(myurl,
          data: {
            'classId': Get.find<Selected_Class_Controller>().classid,
            'currId': Get.find<Qustions_Bank_Controller>().id,
            'type': 'TrueFalse',
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        TrueOrFalseModel lms_links_model =
            TrueOrFalseModel.fromJson(response.data);
        controller.SetQuestion(lms_links_model);
        Quiz_controller.SetQuestion(lms_links_model);
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
