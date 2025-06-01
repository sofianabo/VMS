import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Home_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Students_LMS_Controller.dart';
import 'package:vms_school/Link/Model/LMS_Model/Classes_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/Students_LMS_Model.dart';

class Get_LMS_Students_API {
  Dio dio = Dio();
  Get_LMS_Students() async {
    try {
      final controller = Get.find<Students_LMS_Controller>();
      controller.setIsLoading(true);
      String myurl = "$hostPort$getLmsStudent";
      var response = await dio.post(data: {
        'divisionId': Get.find<Selected_Class_Controller>().divisionid
      }, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        Students_LMS_Model students_lms_model =
            Students_LMS_Model.fromJson(response.data);
        controller.setAllStudents(students_lms_model);
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
