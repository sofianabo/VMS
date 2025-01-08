import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Get_Students_Information_API {
  Get_Students_Information_API(this.context);
  BuildContext context;
  Dio dio = Dio();
  Get_Students_Information({required StudentsID}) async {
    String myURI = "${hostPort}${getStudentInformation}";
    try {
      var response = await dio.post(myURI,
          data: {"studentId": StudentsID}, options: getDioOptions());
      if (response.statusCode == 200) {
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
