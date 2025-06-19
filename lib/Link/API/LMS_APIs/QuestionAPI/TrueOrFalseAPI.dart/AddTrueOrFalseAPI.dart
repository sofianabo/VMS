import 'package:get/get_core/src/get_main.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Electronic_Library_API/Get_All_E_Book.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetAllLinksLMSAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetHomework_LMSAPI.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LinksLMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/PagesLmsController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Qustions_Bank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/TrueOrFalseController.dart';
import 'package:vms_school/Link/Model/LMS_Model/LinksLMSModel.dart';
import 'package:vms_school/Link/Model/LMS_Model/PagesLmsModel.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/TrueOrFalseModel.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Addtrueorfalseapi {
  Addtrueorfalseapi();
  Dio dio = Dio();

  Trueorfalsecontroller controller = Get.find<Trueorfalsecontroller>();

  Addtrueorfalse(
      {question, required bool answer, required bool isEnglish}) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      String myurl = "$hostPort$addQuestion";

      var response = await dio.post(data: {
        'description': '$question',
        'type': 'TrueFalse',
        'classId': Get.find<Selected_Class_Controller>().classid,
        'currId': Get.find<Qustions_Bank_Controller>().id,
        'boolianChoise': answer ? 1 : 0,
        'isEng': isEnglish ? 1 : 0,
      }, cancelToken: cancelToken, myurl, options: getDioOptions());

      if (response.statusCode == 200) {
        gets.Get.back();
        gets.Get.back();
        TrueOrFalseModel quesModel = TrueOrFalseModel.fromJson(response.data);
        controller.Add_Question(quesModel.question![0]);
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
