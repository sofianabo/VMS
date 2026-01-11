import 'package:get/get_core/src/get_main.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Electronic_Library_API/Get_All_E_Book.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetHomework_LMSAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/StudentLms/StudentHomeworkAPI.dart';
import 'package:vms_school/Link/API/Teacher_API/GetHomeworkSolutaionAPI.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/HomeworkController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/LMS_Model/HomeWorkLMSModel.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Uploadcorretinghomeworkapi {
  BuildContext context;
  Uploadcorretinghomeworkapi(this.context);
  Dio dio = Dio();



  Uploadcorretinghomework({
    homeworkId,
    file,
    stuid,
    mark
    
  }) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {

      FormData formData = FormData.fromMap({
        'homeworkId': '$homeworkId',
        'studentId':'$stuid',
        'mark':'$mark'
      });

      if (file != null) {
        formData.files.add(MapEntry(
          "Correction",
          MultipartFile.fromBytes(file, filename: "HomeWork.pdf"),
        ));
      }

      String myurl = "$hostPort$addCorrection";

      var response = await dio.post(
          data: formData,
          cancelToken: cancelToken,
          myurl,
          options: getDioOptions());

      if (response.statusCode == 200) { 
        gets.Get.back();
        gets.Get.back();

          
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
