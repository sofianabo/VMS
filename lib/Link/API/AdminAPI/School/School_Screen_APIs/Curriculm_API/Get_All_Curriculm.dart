import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';

class Get_All_Curriculm_API {
  BuildContext context;
  Get_All_Curriculm_API(this.context);
  Dio dio = Dio();
  Get_All_Curriculm() async {

    final controller = Get.find<Curriculumn_Controller>();

    try {
      controller.SetIsLoading(true);
      String myurl = "${hostPort}${getCurriculum}";
      var response = await dio.post(myurl,
          options: getDioOptions());
      if (response.statusCode == 200) {
        Curriculum_Model curriculum_model = Curriculum_Model.fromJson(response.data);
       controller.SetCurriculum(curriculum_model);
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioError) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
