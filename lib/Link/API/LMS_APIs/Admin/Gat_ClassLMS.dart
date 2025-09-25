import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetNumberOfContentAPI.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Home_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/LMS_Model/Classes_Model.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Main_Selection.dart';

class Get_Classes_LMS_API {
  Dio dio = Dio();
  Get_Classes_LMS() async {
    try {
      final controller = Get.find<Home_Controller_LMS>();
      controller.SetIsLoading(true);
      String myurl = "$hostPort$getClassesLms";
      var response = await dio.post(myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        Classes_LMS allClassModel = Classes_LMS.fromJson(response.data);
        controller.SetClasses(allClassModel);
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
