import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_All_Curr_LMS.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Students_Marks_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/HomeworkController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/HomeWorkLMSModel.dart';

class GethomeworkLmsapi {
  Dio dio = Dio();
  GethomeworkLms({id}) async {
    final controller = Get.find<Homeworkcontroller>();
    try {
      controller.SetIsLoading(true);
      String myurl = "$hostPort$getHomework";
      Get.find<Homeworkcontroller>().setisCurriculmLoading(true);
      Get.find<Homeworkcontroller>().setisCurriculmDialogLoading(true);
      var response = await dio.post(data: {
        "divisionId": '$id',
      }, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        HomeworkLMSModel homeworkLMSModel =
            HomeworkLMSModel.fromJson(response.data);
        controller.SetHomework(homeworkLMSModel);

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
