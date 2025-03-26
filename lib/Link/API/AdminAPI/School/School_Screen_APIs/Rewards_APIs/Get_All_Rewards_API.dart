import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Rewards_Model.dart';

class Get_All_Rewards_API {
  Dio dio = Dio();
  Get_All_Rewards({required int Student_ID}) async {
    String myURI = "$hostPort$getStudentPrize";
    try {
      var response = await dio.post(myURI,
          data: {"id": Student_ID}, options: getDioOptions());
      if (response.statusCode == 200) {
        return Rewards_Model.fromJson(response.data);
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
  }
}
