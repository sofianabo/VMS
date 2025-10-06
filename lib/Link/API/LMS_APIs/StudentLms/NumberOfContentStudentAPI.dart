import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/NumberOfContentController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/StudentLMSController.dart/MainPageContentController.dart';
import 'package:vms_school/Link/Model/LMS_Model/NumberOfContentModel.dart';
import 'package:vms_school/Link/Model/LMS_Model/StudentModel/NumberOfContentStudentModel.dart';

class Numberofcontentstudentapi {
  Dio dio = Dio();
  Numberofcontentstudent(int id) async {
    final controllerStu = Get.find<Mainpagecontentcontroller>();

    Get.find<Selected_Class_Controller>().setIsLoading(true);
    try {
      String myurl = "$hostPort$classInfoLms";
      var response = await dio.post(myurl,
          data: {'classId': id}, options: getDioOptions());
      if (response.statusCode == 200) {
        NumberOfContentStudentModel contentModel =
            NumberOfContentStudentModel.fromJson(response.data);
        controllerStu.setContentLMS(contentModel);
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
