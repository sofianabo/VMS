import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Electronic_Library_API/Get_All_E_Book.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetHomework_LMSAPI.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/HomeworkController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/LMS_Model/HomeWorkLMSModel.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Deletehomeworllmsapi {
  BuildContext context;
  Deletehomeworllmsapi(this.context);
  Dio dio = Dio();
  final controller = Get.find<Homeworkcontroller>();

  Deletehomeworllms({
    required Homeworke h,
  }) async {
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      String myurl = "$hostPort$deleteHomework";

      var response = await dio.post(
          cancelToken: cancelToken,
          myurl,
          data: {"homeworkId": h.id},
          options: getDioOptions());
      if (response.statusCode == 200) {
        Get.back();
        Get.back();
       
        controller.Delete_Question(h);
        // await GethomeworkLmsapi().GethomeworkLms(
        //     id: Get.find<Selected_Class_Controller>().divisionid);
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
