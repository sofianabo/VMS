import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Quiz_Qustions_Model.dart';

class Add_Quiz_Questions_API {
  Dio dio = Dio();
  Add_Quiz_Questions(List<AllQuestions>? allQuestions) async {
    String myURI = "$hostPort$addQuizQuestion";
    try {
      Quiz_Qustions_Model model =
          Quiz_Qustions_Model(allQuestions: allQuestions);
      Map<String, dynamic> jsonData = model.toJson();
      jsonData.addAll({
        'quizId': Get.find<Quiz_Questions_Controller>().quiz_Id,
      });
      var response =
          await dio.post(myURI, data: jsonData, options: getDioOptions());

      if (response.statusCode == 200) {
        Quiz_Qustions_Model model = Quiz_Qustions_Model.fromJson(response.data);
        Get.find<Quiz_Questions_Controller>().SetData(model);
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
