import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownExamTypeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownSemsesterAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllExamTypeModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSemesterModel.dart';

class Examtableapi {
  final ExamTableController c = Get.find<ExamTableController>();
  BuildContext context;

  Examtableapi(this.context);

  // Dio dio = Dio();

  Examtable() async {
    try {
      AllSemesterModel semester =
          await Dropdownsemsesterapi(context).Dropdownsemsester();
      AllExamTypeModel s =
          await Dropdownexamtypeapi(context).Dropdownexamtype();
      AllClassesModel cl = await Getallclassapi(context).getAllClasses();

      c.setAllTypes(s);
      c.setAllClasses(cl);
      c.setAllSeason(semester);

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
