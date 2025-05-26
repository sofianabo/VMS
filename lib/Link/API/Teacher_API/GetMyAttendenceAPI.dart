import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/oneEmployeeAttendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/oneStudentAttendenceController.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/OneStudentAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/EmployeeModels/oneEmployeeAttendenceModel.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import '../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Getmyattendenceapi {
  BuildContext context;
  final Oneemployeeattendencecontroller c =
      Get.find<Oneemployeeattendencecontroller>();
  Getmyattendenceapi(this.context);
  Dio dio = Dio();

  Getmyattendence({bool isProfile = false}) async {
    try {
      CancelToken cancelToken = CancelToken();
      if (!isProfile) {
        Loading_Dialog(cancelToken: cancelToken);
      }
      c.setIsLoading(true);

      String myurl = "${global.hostPort}${global.getMyAttendence}";
      var response = await dio.post(myurl, options: getDioOptions());

      if (response.statusCode == 200) {
        if (!isProfile) {
          Get.back();
        }

        oneEmployeeAttendenceModel st =
            oneEmployeeAttendenceModel.fromJson(response.data);
        c.setEmployeeAttendence(st);
        return st;
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
    // finally {
    //   Get.back();
    // }
  }
}
