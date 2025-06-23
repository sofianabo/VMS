import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/MatchingQuestionController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Matching_Question_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Qustions_Bank_Controller.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/MatchingQuestionModel.dart';

class Get_Matching_Question_Api {
  Dio dio = Dio();

  Future<void> getMatchingQuestions() async {
    final controller = Get.find<Matching_Question_Controller>();
    final Quizcontroller = Get.find<Quiz_Matching_Question_Controller>();
    controller.SetIsLoading(true);
    Quizcontroller.SetIsLoading(true);

    try {
      String myurl = "$hostPort$getQuestion";

      var response = await dio.post(myurl,
          data: {
            'classId': Get.find<Selected_Class_Controller>().classid,
            'currId': Get.find<Qustions_Bank_Controller>().id,
            "type": "Matching" // تغيير النوع إلى Matching
          },
          options: getDioOptions());

      if (response.statusCode == 200) {
        Quizcontroller.filterName = "";
        controller.filterName = "";
        MatchingQuestionModel matchingQuestions =
            MatchingQuestionModel.fromJson(response.data);
        controller.setQuestion(matchingQuestions);
        Quizcontroller.setQuestion(matchingQuestions);
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
      } else {
        ErrorHandler.handleException(
            e is Exception ? e : Exception(e.toString()));
      }
    } finally {
      controller.SetIsLoading(false);
    }
  }
}
