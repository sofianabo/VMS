import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart' show getDioOptions;
import 'package:vms_school/Link/API/Error_API.dart' show ErrorHandler;
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Page_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Jalaa_Models/Class_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Jalaa_Models/QuizTypeForSemesterJalaa.dart';

class Get_All_Quiz_For_Jalaa {
  Get_All_Quiz_For_Jalaa();
  Dio dio = Dio();
  Get_All_Quiz() async {
    final controller = Get.find<Jalaa_Page_Controller>();

    try {
      controller.SetisQtLoading(true);
      String myurl = "$hostPort$getQuizTypeJalaa";
      var response = await dio.post(myurl,
          data: {
            "classId": controller.Classid,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        QuizTypeForSemesterJalaa Model =
            QuizTypeForSemesterJalaa.fromJson(response.data);
        controller.setSemester(Model);
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      print(e);
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
