import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';

class Schooltimetableapi {
  final AdminSchoolTimeController c = Get.find<AdminSchoolTimeController>();
  BuildContext context;

  Schooltimetableapi(this.context);

  // Dio dio = Dio();

  Schooltimetable() async {
    try {
      AllClassModel cl = await Getallclassapi.getAllClasses();
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
