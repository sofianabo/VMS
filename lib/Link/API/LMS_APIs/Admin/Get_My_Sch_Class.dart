import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/ExamTableModel.dart';

class Exam_API {
  final ExamTableController c = Get.find<ExamTableController>();
  BuildContext context;

  Exam_API(this.context);

  Dio dio = Dio();

  Exam_Table() async {
    try {
      c.setIsLoading(true);

      String myurl = "$hostPort$getQuizForClass";
      var response = await dio.post(myurl,
          data: {
            'classId': Get.find<Selected_Class_Controller>().classid,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        ExamTableModel examModel = ExamTableModel.fromJson(response.data);
        c.setAllQuiz(examModel);
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
