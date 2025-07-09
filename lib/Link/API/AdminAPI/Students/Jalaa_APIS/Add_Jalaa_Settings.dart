import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Page_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';

class Add_Jalaa_Settings_API {
  Add_Jalaa_Settings_API();
  Dio dio = Dio();
  Add_Jalaa_Settings() async {
    final controller = Get.find<Jalaa_Page_Controller>();
    try {
      controller.SetCurrIsLoading(true);
      String myurl = "$hostPort$addJalaaSetting";
      var response = await dio.post(data: {
        "jalaaSettings": {
          "shId": controller.templeteId,
          "mainCurriculum": controller.getPrimaryIds(),
          "downCurriculum": controller.getSecondaryIds(),
          "quizTypes": controller.getSemester(),
          "classId": controller.Classid,
          "Molahdat": {
            "firstSemester": "jhkhkjhkj",
            "secondSemester": null,
            "manager": null
          }
        }
      }, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        Get.back();
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
