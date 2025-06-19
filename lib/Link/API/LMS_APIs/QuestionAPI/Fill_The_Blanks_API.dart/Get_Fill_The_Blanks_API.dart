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
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Choose_The_Correct_Answer_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Fill_The_Blank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Fill_The_Blank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Qustions_Bank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/TrueOrFalseController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Division_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/Division_LMS_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/Files_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/LinksLMSModel.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Choose_The_Correct_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Fill_The_Blank_Model.dart';

class Get_Fill_The_Blanks_API {
  Dio dio = Dio();
  Get_Fill_The_Blanks() async {
    final controller = Get.find<Fill_The_Blank_Controller>();
    final Quiz_controller = Get.find<Quiz_Fill_The_Blank_Controller>();
    controller.SetIsLoading(true);
    Quiz_controller.SetIsLoading(true);
    try {
      String myurl = "$hostPort$getQuestion";

      var response = await dio.post(myurl,
          data: {
            'classId': Get.find<Selected_Class_Controller>().classid,
            'currId': Get.find<Qustions_Bank_Controller>().id,
            "type": "Blank"
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        controller.filterName = "";
        Quiz_controller.filterName = "";
        Fill_The_Blank_Model chooes_the_correct_model =
            Fill_The_Blank_Model.fromJson(response.data);
        controller.Set_Question(chooes_the_correct_model);
        Quiz_controller.Set_Question(chooes_the_correct_model);
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
