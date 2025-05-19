import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/StudentMarks_TeacherController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';

class Getcurriculumteacherapi {
  BuildContext context;
  Getcurriculumteacherapi(this.context);
  Dio dio = Dio();
  Getcurriculumteacher(
      {CancelToken? canceltoken, String? classId, int? Semesterid}) async {
    final controller = Get.find<Curriculumn_Controller>();
    final StudentmarksTeacher = Get.find<StudentmarksTeachercontroller>();

    try {
      controller.SetIsLoading(true);
      StudentmarksTeacher.SetisCurriculumLoading(true);
      String myurl = "$hostPort$getCurriculumByTeacher";
      var response = await dio.post(data: {
        "classId": classId,
        "semesterId": Semesterid,
      }, cancelToken: canceltoken, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        Curriculum_Model curriculumModel =
            Curriculum_Model.fromJson(response.data);
        controller.SetCurriculum(curriculumModel);
    
        StudentmarksTeacher.SetCurriculum(curriculumModel);
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
