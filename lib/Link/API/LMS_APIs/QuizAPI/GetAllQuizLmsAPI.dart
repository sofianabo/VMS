import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuizController/AllQuizController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/LMS_Model/AllQuizLmsModel.dart';

class Getallquizlmsapi {
  Dio dio = Dio();
  Getallquizlms() async {
    final controller = Get.find<Allquizcontroller>();
    controller.SetIsLoading(true);
    try {
      Get.find<Allquizcontroller>().setisCurriculmLoading(true);
      Get.find<Allquizcontroller>().setisCurriculmDialogLoading(true);
      String myurl = "$hostPort$getQuizLms";

      var response = await dio.post(myurl,
          data: {
            'classId': Get.find<Selected_Class_Controller>().classid,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        controller.filterName = "";
        controller.currindex = "";
        AllQuizLmsModel QuizModel = AllQuizLmsModel.fromJson(response.data);
        controller.SetQuizLms(QuizModel);
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
