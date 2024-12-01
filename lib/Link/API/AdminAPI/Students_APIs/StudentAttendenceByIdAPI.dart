import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/oneStudentAttendenceController.dart';
import 'package:vms_school/Link/Model/AdminModel/OneStudentAttendenceModel.dart';
import 'package:vms_school/main.dart';
import '../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Studentattendencebyidapi {
  BuildContext context;
  final Onestudentattendencecontroller c =
      Get.find<Onestudentattendencecontroller>();
  Studentattendencebyidapi(this.context);
  Dio dio = Dio();

  Studentattendencebyid(int id) async {
    try {
      String myurl = "${global.hostPort}${global.studentAttendenceById}";
      var response = await dio.post(myurl,
          data: {"studentId": id}, options: getDioOptions());
      if (response.statusCode == 200) {
        OneStudentAttendenceModel st =
            OneStudentAttendenceModel.fromJson(response.data);
        c.setStudentAttendence(st);
        return st;
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
