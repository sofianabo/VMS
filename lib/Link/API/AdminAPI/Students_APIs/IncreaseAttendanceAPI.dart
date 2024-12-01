import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Increase_Attendance_Model.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Stu_Attendence.dart';

class IncreaseAttendanceAPI {



  BuildContext context;
  IncreaseAttendanceAPI(this.context);
  Dio dio = Dio();

  GetIncreaseAttendance() async {
    try {
      final Student_attendence_controller  controller = Get.find<Student_attendence_controller>();
      controller.setIsLoading(true);
      String myurl = "${hostPort}${studentsAttendance}";
      var response = await dio.post(myurl,
      options: getDioOptions());
      if (response.statusCode == 200) {
        print(response.data);
        StuAttendence stu = StuAttendence.fromJson(response.data);
        controller.setData(stu);
        print(stu.students![0].fullName);
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
