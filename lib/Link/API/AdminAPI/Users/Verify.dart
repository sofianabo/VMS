import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/main.dart';

class Verify_Account_API {
  Verify_Account_API();
  Dio dio = Dio();
  Verify_Account({
    required String code,
  }) async {
    String myURI = "$hostPort$verify";
    try {
      var response = await dio.post(myURI,
          data: {"verifyCode": code}, options: getDioOptions());

      if (response.statusCode == 200) {
        prefs!.setBool("isVerified", true);
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
    } catch (e) {}
  }
}
