import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Page_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';

class Get_Curr_For_Sort {
  Get_Curr_For_Sort();
  Dio dio = Dio();
  Get_All_Curriculm() async {
    final controller = Get.find<Jalaa_Page_Controller>();
    try {
      controller.SetCurrIsLoading(true);
      String myurl = "$hostPort$getCurriculum";
      var response = await dio.post(data: {
        "classId": controller.Classid,
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
