import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students_APIs/GetAllGuardiansAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/allGaurdianController.dart';
import '../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Studentpunishapi {
  Studentpunishapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Studentpunish(int penaltyId, String reason, String? startdate,
      String? enddate, int studentId) async {
    String myurl = "${global.hostPort}${global.addStudentPenalty}";
    try {
      var response = await dio.post(myurl,
          data: {
            "studentId": studentId,
            "penaltyId": penaltyId,
            "cause": reason,
            "startDate": startdate,
            "endDate": enddate
          },
          options: getDioOptions());

      if (response.statusCode == 200) {
        Get.back();
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
      return response.statusCode;
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
