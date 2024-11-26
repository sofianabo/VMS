import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/AdminAPI/DropdownClassesAPI.dart';
import 'package:getx/Link/API/AdminAPI/DropdownGradeAPI.dart';
import 'package:getx/Link/API/AdminAPI/DropdownSessionsAPI.dart';
import 'package:getx/Link/API/Error_API.dart';
import 'package:getx/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:getx/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:getx/Link/Model/AdminModel/AllGradeModel.dart';
import 'package:getx/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:getx/Link/Model/AdminModel/AllStudentModel.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Getallstudentapi {
  final Allstudentscontroller c = Get.find<Allstudentscontroller>();
  BuildContext context;

  Getallstudentapi(this.context);

  Dio dio = Dio();

  Getallstudent(
      int? sessionID, int? gradeId, int? classId, int? divisionID) async {
    try {
      AllSessionModel s = await Getsessionapi(context).Getsession();
      AllGradesModel g = await Getallgradeapi(context).Getallgrade();
    AllClassesModel cl = await Getallclassapi(context).getAllClasses();
    c.setAllSession(s);
    c.setAllGrades(g);
    c.setAllClasses(cl);

      String myurl = "${global.hostPort}${global.getStudents}";
      var response = await dio.post(myurl,
          data: {
            "sessionId": sessionID,
            "gradeId": gradeId,
            "classId": classId,
            "divisionId": divisionID
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${prefs!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        AllStudentModel student = AllStudentModel.fromJson(response.data);
        c.setAllStudents(student);
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
