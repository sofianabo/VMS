import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/DropDownExamTypeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/DropdownSessionsAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Admin_School_Time.dart';
import 'package:vms_school/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/ExamTableController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllExamTypeModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllGradeModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStudentModel.dart';
import 'package:vms_school/main.dart';
import '../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Schooltimetableapi {
  final AdminSchoolTimeController c = Get.find<AdminSchoolTimeController>();
  BuildContext context;

  Schooltimetableapi(this.context);

  // Dio dio = Dio();

  Schooltimetable() async {
    try {
      AllClassesModel cl = await Getallclassapi(context).getAllClasses();
      c.setAllClasses(cl);

//       String myurl = "${global.hostPort}${global.getStudents}";
//       var response = await dio.post(myurl,
//           data: {
//             "sessionId": sessionID,
//             "gradeId": gradeId,
//             "classId": classId,
//             "divisionId": divisionID
//           },
// options: getDioOptions());
      // if (response.statusCode == 200) {
      //   AllStudentModel student = AllStudentModel.fromJson(response.data);
      //   c.setAllStudents(student);
      // } else {
      //   ErrorHandler.handleDioError(DioError(
      //     requestOptions: response.requestOptions,
      //     response: response,
      //     type: DioErrorType.badResponse,
      //   ));
      // }
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