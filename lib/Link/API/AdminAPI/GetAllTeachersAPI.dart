import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/DropdownSessionsAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/AllTeachersController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllGradeModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllTeacherModel.dart';
import 'package:vms_school/main.dart';
import '../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Getallteachersapi {
  Allteachercontroller c = Get.find<Allteachercontroller>();
   
  BuildContext context;
  Getallteachersapi(this.context);
  Dio dio = Dio();

  Getallteachers(String? name) async {
      AllSessionModel s = await Getsessionapi(context).Getsession();
    AllGradesModel g = await Getallgradeapi(context).Getallgrade();
    AllClassesModel cl = await Getallclassapi(context).getAllClasses();
    c.setAllSession(s);
    c.setAllGrades(g);
    c.setAllClasses(cl);

    try {
      String myurl = "${global.hostPort}${global.getTeachers}";
      var response = await dio.get(myurl,
          data: {
            "name": name,
          },
options: getDioOptions());
      if (response.statusCode == 200) {
        AllTeacherModel teacher = AllTeacherModel.fromJson(response.data);
        c.setAllTeacher(teacher);
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
