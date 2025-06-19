import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/ExamTableAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuizController/AllQuizController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Qustions_Bank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/LMS_Model/AllQuizLmsModel.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Delete_Quiz_Lms_Api {
  BuildContext context;
  Delete_Quiz_Lms_Api(this.context);
  Allquizcontroller controller = Get.find<Allquizcontroller>();

  Dio dio = Dio();
  DeleteQuizLms({required QuizLms quiz}) async {
    String myURI = "$hostPort$deletetQuizLms";
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.delete(
        data: {
          "id": quiz.id,
          'classId': Get.find<Selected_Class_Controller>().classid,
          'currId': Get.find<Qustions_Bank_Controller>().id
        },
        myURI,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        controller.Delete_Quiz(quiz);
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
    return true;
  }
}
