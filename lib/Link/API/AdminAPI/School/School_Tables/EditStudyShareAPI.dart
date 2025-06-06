import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/SchoolTimeTableAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';

import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCuriculmController.dart';

import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Tables/SchoolTimeTable.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

import 'package:vms_school/Link/API/DioOption.dart';
import '../../../API.dart' as global;

class Editstudyshareapi {
  AdminSchoolTimeController u = Get.find<AdminSchoolTimeController>();

  Dropdowncuriculmcontroller curi = Get.find<Dropdowncuriculmcontroller>();
  Allteachercontroller teach = Get.find<Allteachercontroller>();
  Editstudyshareapi(this.context);
  BuildContext context;
  Dio dio = Dio();

  EditLesson(
    int curriculumId,
    int teachId,
    int id,
  ) async {
    String myurl = "${global.hostPort}${global.updatLessonByDay}";
    try {
      int? curiID = curi.allCuriculm[curriculumId].id;
      int? teacherID = teach.teachers[teachId].id;
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myurl,
          data: {
            "curriculumId": curiID,
            "teacherId": teacherID,
            "studyShareId": id
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        m = await Schooltimetableapi(context).Schooltimetable(
            u.examDivision.indexOf(u.selectedExamDivision), u.timeLessonIndex);
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
