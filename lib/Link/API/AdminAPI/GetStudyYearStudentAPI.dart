import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/DropdownSessionsAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllGradeModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/main.dart';
import '../API.dart' as global;

class Getstudyyearstudentapi {
  final StudyYearStudentsController c = Get.find<StudyYearStudentsController>();
  BuildContext context;
  Getstudyyearstudentapi(this.context);
  Dio dio = Dio();

  Getstudyyearstudent(String? name) async {
    try {
      AllSessionModel s = await Getsessionapi(context).Getsession();
      AllGradesModel g = await Getallgradeapi(context).Getallgrade();
      AllClassesModel cl = await Getallclassapi(context).getAllClasses();
      c.setAllClasses(cl);
      c.setAllSession(s);
      c.setAllGrades(g);
      String myurl = "${global.hostPort}${global.getStudyYearStudent}";
      var response = await dio.get(myurl,
          data: {
            "name": name,
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${prefs!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        //  AllStudentModel student = AllStudentModel.fromJson(response.data);
        //  c.setAllStudents(student);
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
