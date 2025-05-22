import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/My_Students_Controller.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/StudentMarks_TeacherController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllDivisionModel.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Getteacherdivisionmarksapi {
  Dropdowndivisioncontroller c = Get.find<Dropdowndivisioncontroller>();

  final StudentmarksTeacher = Get.find<StudentmarksTeachercontroller>();

  Dropdownclassescontroller class_controller =
      Get.find<Dropdownclassescontroller>();
  BuildContext context;
  Getteacherdivisionmarksapi(this.context);
  Dio dio = Dio();

  Getteacherdivisionmarks(int idx, int idx2) async {
    try {
      c.setIsLoading(true);

      StudentmarksTeacher.SetisDivisionLoading(true);

      int? id = class_controller.Allclass[idx].id;
      String myurl = "$hostPort$getDivionByTeacher";
      var response = await dio.post(myurl,
          data: {"classId": id}, options: getDioOptions());
      if (response.statusCode == 200) {
        AllDivisionModel division = AllDivisionModel.fromJson(response.data);
      
        c.setDivision(division);

        return division;
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
