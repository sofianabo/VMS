import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Divisions_Controller.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/My_Students_Controller.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/StudentMarks_TeacherController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllClassesModel.dart';
import '../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Getteacherclassapi {
  BuildContext context;
  Getteacherclassapi(this.context);
  static Getteacherclass({int? sessionID}) async {
    try {
      Dio dio = Dio();

      Dropdownclassescontroller ClassController =
          Get.find<Dropdownclassescontroller>();

      final My_Student = Get.find<My_Students_Controller>();

      ClassController.setIsLoading(true);
      My_Student.setClassLoading(true);

      final controller = Get.find<Divisions_Controller>();
      controller.SetIsloading(true);
      String myurl = "${global.hostPort}${global.getClassesByTeacher}";
      var response = await dio.post(
        myurl,
        options: getDioOptions(),
        data: {
          "sessionId": sessionID,
        },
      );
      if (response.statusCode == 200) {
        AllClassModel classes = AllClassModel.fromJson(response.data);
        ClassController.setClasses(classes);
        controller.setClass(classes);

        My_Student.setClassList(classes);
        return classes;
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
