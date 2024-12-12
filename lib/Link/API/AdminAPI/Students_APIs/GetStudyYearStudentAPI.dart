import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownSessionsAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students_APIs/DropDownPenaltyAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllPenaltyModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStudyYearModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';
import '../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Getstudyyearstudentapi {
  final StudyYearStudentsController c = Get.find<StudyYearStudentsController>();
  BuildContext context;
  Getstudyyearstudentapi(this.context);
  Dio dio = Dio();

  Getstudyyearstudent(String? name) async {
    try {
      AllSessionModel s = await Getsessionapi(context).Getsession();
      AllGradesModel g = await Getallgradeapi(context).Getallgrade();
      AllClassModel cl = await Getallclassapi(context).getAllClasses();
      AllPenaltyModel p =await  Dropdownpenaltyapi(context).Dropdownpenalty();
      c.setAllClasses(cl);
      c.setAllSession(s);
      c.setAllGrades(g);
      c.setAllPenalty(p);
      String myurl = "${global.hostPort}${global.getStudyYearStudent}";
      var response = await dio.get(myurl,
          data: {
            "name": name,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
         AllStudyYearModel student = AllStudyYearModel.fromJson(response.data);
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
