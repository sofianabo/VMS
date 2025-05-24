import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/TeacherSubjectsController.dart';
import 'package:vms_school/Link/Model/AdminModel/TeacherModels/TeacherSubjectModel.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Get_My_Curr {
  BuildContext context;
  final c = Get.find<Teachersubjectscontroller>();
  Get_My_Curr(this.context);
  Dio dio = Dio();

  Getteachersubject(int id) async {
    try {
      String myurl = "${hostPort}${getSCDTeacherById}";
      c.setIsLoading(true);
      var response = await dio.post(myurl,
          data: {"teacherId": id}, options: getDioOptions());
      if (response.statusCode == 200) {
        TeacherSubjectModel st = TeacherSubjectModel.fromJson(response.data);
        c.setTeacherSubject(st);
      } else {
        Get.back();
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
