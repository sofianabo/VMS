import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Students_Marks_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';

class Get_Unlink_Curriculum_Api {
  BuildContext context;
  Get_Unlink_Curriculum_Api(this.context);
  Dio dio = Dio();
  Get_Unlink_Curriculum(
      {CancelToken? canceltoken, String? classId, int? Semesterid}) async {
    // final controller = Get.find<Curriculumn_Controller>();
    final class_Cur_Controller = Get.find<ClassMgmtController>();

    try {
      // controller.SetIsLoading(true);
      String myurl = "$hostPort$getUnLinkCurriculum";
      var response = await dio.post(data: {
        // "classId": classId,
        // "semesterId": Semesterid,
      }, cancelToken: canceltoken, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        Curriculum_Model curriculumModel =
            Curriculum_Model.fromJson(response.data);
        // controller.SetCurriculum(curriculumModel);
        class_Cur_Controller.SetCurriculum(curriculumModel);
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
