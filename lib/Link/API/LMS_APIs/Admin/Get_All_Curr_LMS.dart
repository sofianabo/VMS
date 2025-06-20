import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Students_Marks_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/HomeworkController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuizController/AllQuizController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Qustions_Bank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';

class Get_LMS_Curriculm_API {
  Dio dio = Dio();
  Get_LMS_Curriculm() async {
    final controller = Get.find<Curriculumn_LMS_Controller>();
    final Q_controller = Get.find<Qustions_Bank_Controller>();
    final Quiz_controller = Get.find<Allquizcontroller>();
    try {
      controller.SetIsLoading(true);
      Q_controller.SetIsLoading(true);
      Quiz_controller.SetIsLoading(true);
      String myurl = "$hostPort$getLMSCurriculum";
      var response = await dio.post(data: {
        "classId": Get.find<Selected_Class_Controller>().classid,
      }, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        Curriculum_Model curriculumModel =
            Curriculum_Model.fromJson(response.data);
        controller.SetCurriculum(curriculumModel);
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
